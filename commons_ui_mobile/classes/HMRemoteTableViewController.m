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

#import "HMRemoteTableViewController.h"

@implementation HMRemoteTableViewController

@synthesize entityAbstraction = _entityAbstraction;
@synthesize entityProviderDelegate = _entityProviderDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    // calls the super
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    // initializes the structures
    [self initStructures];

    // returns self
    return self;
}

- (void)dealloc {
    // releases the entity abstraction
    [_entityAbstraction release];

    // calls the super
    [super dealloc];
}

- (void)initStructures {
    // sets the attributes
    self.title = [self getTitle];

    // sets the new bar button in the navigation item
    UIBarButtonItem *newBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showNewEntityViewController)];
    [self.navigationItem setRightBarButtonItem:newBarButton animated:YES];

    // creates the entity abstraction
    HMEntityAbstraction *entityAbstraction = [[HMEntityAbstraction alloc] init];

    // sets the attributes
    self.entityAbstraction = entityAbstraction;

    // releases the objects
    [entityAbstraction release];
    [newBarButton release];
}

- (NSString *)getTitle {
    return @"Table";
}

- (NSString *)getNewEntityTitle {
    return @"Table";
}

- (UIColor *)getHeaderColor {
    return [UIColor redColor];
}

- (id)getViewController {
    return nil;
}

- (id)getNewEntityViewController {
    return nil;
}

- (void)showNewEntityViewController {
    // retrieves the new entity view controller
    UIViewController<HMEntityDelegate> *newEntityViewController = [self getNewEntityViewController];

    // sets the title in the new entity view controller
    newEntityViewController.title = [self getNewEntityTitle];

    // creates the navigation controller
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newEntityViewController];

    // sets the navigation navigation bar tint color
    navigationController.navigationBar.tintColor = [self getHeaderColor];

    // presents the user view controller into the navigation controller
    [self presentModalViewController:navigationController animated:YES];

    // releases the new entity view controller reference
    [newEntityViewController release];

    // releases the navigation controller reference
    [navigationController release];
}

- (void)updateEntityProviderDelegate:(NSDictionary *)entity {
    // updates the entity in the entity provider delegate
    [self.entityProviderDelegate updateEntity:entity];

    // pops the view controller
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSString *)getRemoteUrl {
    return nil;
}

- (HMRemoteTableViewSerialized)getRemoteType {
    return HMRemoteTableViewNoneSerialized;
}

- (NSString *)getItemTitleName {
    return @"table";
}

- (void)didSelectRemoteRowWithData:(NSDictionary *)data {
    // in case the entity provider delegate
    // is set this is a provider call
    if(self.entityProviderDelegate) {
        // updates the entity provider delegate
        [self updateEntityProviderDelegate:data];
    }
    // otherwise it's a normal selection
    else {
        // retrieves the view controller
        UIViewController<HMEntityDelegate> *viewController = [self getViewController];

        // sets (and changes) the entity in the view controller
        [viewController changeEntity:data];

        // pushes the view controller into the navigation controller
        [self.navigationController pushViewController:viewController animated:YES];

        // releases the view controller reference
        [viewController release];
    }
}

- (void)didDeselectRemoteRowWithData:(NSDictionary *)data {
}

- (void)updateEntity:(NSDictionary *)entity {
    if(self.entityProviderDelegate) {
        // updates the entity provider delegate
        [self updateEntityProviderDelegate:entity];
    }
}

@end
