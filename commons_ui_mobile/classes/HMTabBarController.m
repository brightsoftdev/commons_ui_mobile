// Hive Mobile
// Copyright (C) 2008 Hive Solutions Lda.
//
// This file is part of Hive Mobile.
//
// Hive Mobile is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Hive Mobile is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Hive Mobile. If not, see <http://www.gnu.org/licenses/>.

// __author__    = Tiago Silva <tsilva@hive.pt>
// __version__   = 1.0.0
// __revision__  = $LastChangedRevision: 2390 $
// __date__      = $LastChangedDate: 2009-04-02 08:36:50 +0100 (qui, 02 Abr 2009) $
// __copyright__ = Copyright (c) 2008 Hive Solutions Lda.
// __license__   = GNU General Public License (GPL), Version 3

#import "HMTabBarController.h"

@implementation HMTabBarController

@synthesize mainButton = _mainButton;

- (void)dealloc {
    // releases the main button
    [_mainButton release];

    // calls the super
    [super dealloc];
}

- (UIButton *)mainButton {
    return _mainButton;
}

- (void)setMainButton:(UIButton *)mainButton {
    // in case the description is invalid
    if(mainButton == nil) {
        // returns immediately
        return;
    }

    // in case the object is the same
    if(mainButton == _mainButton) {
        // returns immediately
        return;
    }

    // removes the main button from the superview
    [_mainButton removeFromSuperview];

    // releases the object
    [_mainButton release];

    // sets and retains the object
    _mainButton = [mainButton retain];

    // retrieves the main button frame
    CGRect mainButtonFrame = mainButton.frame;

    // calculates the height different between the image and the and the tab bar controller
    CGFloat heightDifference = mainButtonFrame.size.height - self.tabBar.frame.size.height;

    // retrieves the tab bar center
    CGPoint tabBarCenter = self.tabBar.center;

    // in case the tab bar is higher than the image
    if (heightDifference < 0) {
        // sets the button's center as the tab bar's center
        mainButton.center = tabBarCenter;
    }
    // in case the image is higher than the tab bar
    else {
        // adjusts the the center so that the image appears above the tab bar
        tabBarCenter.y -= heightDifference / 2.0;
        mainButton.center = tabBarCenter;
    }

    // binds the target and selector to the button
    [mainButton addTarget:self action:@selector(mainButtonClicked:extra:) forControlEvents:UIControlEventTouchUpInside];

    // adds the button to the tab bar controller
    [self.view addSubview:mainButton];
}

- (void)mainButtonClicked:(id)sender extra:(id)extra {
    // retrieves the number of view controllers
    int numberViewControllers = [self.viewControllers count];

    // calculates the main view controller index
    int mainViewControllerIndex = (numberViewControllers - 1) / 2;

    // retrieves the main view controller
    UIViewController *mainViewController = [self.viewControllers objectAtIndex:mainViewControllerIndex];

    // selects the main view controller
    self.selectedViewController = mainViewController;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // forwards the question to the selected view controller
    return [self.selectedViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

@end
