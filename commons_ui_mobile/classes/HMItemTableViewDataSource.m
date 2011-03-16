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

#import "HMTableViewCell.h"
#import "HMItemTableViewDataSource.h"

@implementation HMItemTableViewDataSource

@synthesize itemTableViewProvider = _itemTableViewProvider;
@synthesize tableView = _tableView;
@synthesize itemSpecification = _itemSpecification;

- (id)init {
    // calls the super
    self = [super init];

    // sets the item dirty
    itemDirty = YES;

    // returns self
    return self;
}

- (id)initWithItemTableViewProvider:(NSObject<HMItemTableViewProvider> *)itemTableViewProvider {
    // calls the default contructor
    self = [self init];

    // sets the attributes
    self.itemTableViewProvider = itemTableViewProvider;

    // returns self
    return self;
}

- (void)dealloc {
    // calls the supper
    [super dealloc];
}

- (void)updateItem {
    // in case the item dirty flag is
    // not set
    if(itemDirty == NO) {
        // returns immeditely
        return;
    }

    // retrieves the item specification from the item table view provider
    self.itemSpecification = [self.itemTableViewProvider getItemSpecification];

    // unsets the item dirty flag
    itemDirty = NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // sets the table view
    self.tableView = tableView;

    // updates the item (if necessary)
    [self updateItem];

    // retrieves the menu item group items size
    NSInteger menuItemGroupItemsSize = [self.itemSpecification.items count];

    // returns the menu item group items size
    return menuItemGroupItemsSize;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [[[NSArray alloc] init] autorelease];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // creates the cell identifier
    static NSString *cellIdentifier = @"Cell";

    // retrieves the button item
    HMButtonItem *buttonItem = (HMButtonItem *) [self.itemSpecification getItem:indexPath];

    // tries to retrives the cell from cache (reusable)
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    // in case the cell is not defined in the cuurrent cache
    // need to create a new cell
    if (cell == nil) {
        // creates the new cell with the given reuse identifier
        cell = [[[HMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:buttonItem.name name:buttonItem.name icon:buttonItem.icon highlightedIcon:buttonItem.highlightedIcon] autorelease];
    }

    // sets the button item's attributes in the cell
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];

    // sets the notifications switch
    if(indexPath.section == 1) {
        UISwitch *notificationsSwitch = [[UISwitch alloc] init];
        cell.accessoryView = notificationsSwitch;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [notificationsSwitch release];
    }

    // returns the cell
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // creates an index path
    NSIndexPath *indexPath = [[NSIndexPath alloc] initWithIndex:section];

    // retrieves the section item group
    HMItemGroup *sectionItemGroup = (HMItemGroup *) [self.itemSpecification getItem:indexPath];

    // retrieves the section item group items count
    NSInteger sectionItemGroupItemsCount = [sectionItemGroup.items count];

    // releases the index path
    [indexPath release];

    // returns the section item group items count
    return sectionItemGroupItemsCount;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    // creates an index path
    NSIndexPath *indexPath = [[NSIndexPath alloc] initWithIndex:section];

    // retrieves the section item group
    HMItemGroup *sectionItemGroup = (HMItemGroup *) [self.itemSpecification getItem:indexPath];

    // releases the index path
    [indexPath release];

    // returns the section's description
    return sectionItemGroup.description;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return nil;
}

+ (void)_keepAtLinkTime {
}

@end
