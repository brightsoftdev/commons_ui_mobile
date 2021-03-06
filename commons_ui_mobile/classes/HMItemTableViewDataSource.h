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

#import "Dependencies.h"

#import "HMTableViewCell.h"
#import "HMEditTableViewCell.h"
#import "HMTableViewDataSource.h"
#import "HMItemTableViewProvider.h"

// avoids circular dependency
@class HMItemGroup;

/**
 * Table view data source used to represent
 * for representation of item objects.
 */
@interface HMItemTableViewDataSource : HMTableViewDataSource {
    @private
    NSObject<HMItemTableViewProvider> *_itemTableViewProvider;
    HMNamedItemGroup *_itemSpecification;
    BOOL _itemDirty;
}

/**
 * The item table view provider used to obtain the item objects.
 */
@property (assign) IBOutlet NSObject<HMItemTableViewProvider> *itemTableViewProvider;

/**
 * The current item specification (top level item node).
 */
@property (retain) HMNamedItemGroup *itemSpecification;

/**
 * The reference to the header named item group.
 */
@property (readonly) HMNamedItemGroup *headerNamedItemGroup;

/**
 * The reference to the list item group.
 */
@property (readonly) HMItemGroup *listItemGroup;

/**
 * Constructor of the class.
 *
 * @param itemTableViewProvider The item table view
 * provider.
 */
- (id)initWithItemTableViewProvider:(NSObject<HMItemTableViewProvider> *)itemTableViewProvider;

/**
 * Flushes the item specification, converting the current ui component
 * values with new object items.
 */
- (void)flushItemSpecification;

/**
 * Flushes the item specification, converting the current ui component
 * values with new object items.
 *
 * @param transient Indicates if the cell's transient value,
 * the value that is currently displayed, should be flushed,
 * or if the commited value should be flushed instead.
 */
- (void)flushItemSpecificationTransient:(BOOL)transient;

/**
 * Flushes the item group, converting the current ui component
 * values with new object items.
 *
 * @param itemGroup The item group.
 * @param transient Indicates if the cell's transient value,
 * the value that is currently displayed, should be flushed,
 * or if the commited value should be flushed instead.
 */
- (void)flushItemGroup:(HMItemGroup *)itemGroup transient:(BOOL)transient;

/**
 * Updates the current item specification.
 */
- (void)updateItemSpecification;

/**
 * Updates the current item specification (forced).
 */
- (void)updateItemSpecificationForce;

@end
