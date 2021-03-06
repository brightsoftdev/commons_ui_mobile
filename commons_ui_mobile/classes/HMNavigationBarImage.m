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

// __author__    = João Magalhães <joamag@hive.pt>
// __version__   = 1.0.0
// __revision__  = $LastChangedRevision: 2390 $
// __date__      = $LastChangedDate: 2009-04-02 08:36:50 +0100 (qui, 02 Abr 2009) $
// __copyright__ = Copyright (c) 2008 Hive Solutions Lda.
// __license__   = GNU General Public License (GPL), Version 3

#import "HMNavigationBarImage.h"

@implementation HMNavigationBarImage

@synthesize verticalImageName = _verticalImageName;
@synthesize horizontalImageName = _horizontalImageName;

- (void)dealloc {
    // releases the vertical image name
    [_verticalImageName release];

    // releases the horizontal image name
    [_horizontalImageName release];

    // calls the supper
    [super dealloc];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context {
    // allocates the image name
    NSString *imageName = nil;

    // retrieves the frame size height (casts to int)
    NSInteger frameSizeHeight = self.frame.size.height;

    // switches over the frame size height
    switch(frameSizeHeight) {
        case HM_NAVIGATION_BAR_IMAGE_VERTICAL_HEIGHT:
            // sets the image name to the vertical value
            imageName = self.verticalImageName;

            // breaks the switch
            break;

        case HM_NAVIGATION_BAR_IMAGE_HORIZONTAL_HEIGHT:
            // sets the image name to the horizontal value
            imageName = self.horizontalImageName;

            // breaks the switch
            break;

        default:
            // breaks the switch
            break;
    }

    // retrieves the image to be used
    UIImage *image = [UIImage imageNamedDevice:imageName];

    // puts the image into context
    CGContextTranslateCTM(context, 0, image.size.height);

    // scales the image to revert it vertically
    CGContextScaleCTM(context, 1.0, -1.0);

    // draws the image
    CGRect imageRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGContextDrawImage(context, imageRect, image.CGImage);
}

- (NSString *)verticalImageName {
    return _verticalImageName;
}

- (void)setVerticalImageName:(NSString *)verticalImageName {
    // in case the object is the same
    if(verticalImageName == _verticalImageName) {
        // returns immediately
        return;
    }

    // releases the object
    [verticalImageName release];

    // sets and retains the object
    _verticalImageName = [verticalImageName retain];

    // retrieves the vertical image
    UIImage *verticalImage = [UIImage imageNamedDevice:verticalImageName];

    // in case its running on ios 5
    if([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        // sets the navigation bar's background image
        // with the integer value representing the
        // UIBarMetricsDefault enumeration value
        // for backwards compatability
        [self setBackgroundImage:verticalImage forBarMetrics:0];
    }
}

- (NSString *)horizontalImageName {
    return _horizontalImageName;
}

- (void)setHorizontalImageName:(NSString *)horizontalImageName {
    // in case the object is the same
    if(horizontalImageName == _horizontalImageName) {
        // returns immediately
        return;
    }

    // releases the object
    [horizontalImageName release];

    // sets and retains the object
    _horizontalImageName = [horizontalImageName retain];

    // retrieves the horizontal image
    UIImage *horizontalImage = [UIImage imageNamedDevice:horizontalImageName];

    // in case its running on ios 5
    if([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        // sets the navigation bar's background image,
        // with the integer value representing the
        // UIBarMetricsLandscapePhone enumeration value
        // for backwards compatability
        [self setBackgroundImage:horizontalImage forBarMetrics:1];
    }
}

@end
