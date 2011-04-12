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

#import "Dependencies.h"

#import "HMTableViewCell.h"

@interface HMEditTableViewCell : HMTableViewCell {
    @protected
    BOOL _editingDirty;

    @private
    UIView *_editView;
    NSString *_defaultValue;
    NSString *_returnType;
    BOOL _editableCell;
    BOOL _clearable;
    BOOL _editAlways;
    BOOL _selectableEdit;
    BOOL _persistentEdit;
    BOOL _focusEdit;
}

/**
 * The value that should be used by default.
 */
@property (assign) NSString *defaultValue;

/**
 * The view that is shown when the cell
 * is in edit mode.
 */
@property (retain) UIView *editView;

/**
 * Indicates the action that is
 * represented by returning from
 * the cell's value edition.
 */
@property (retain) NSString *returnType;

/**
 * Indicates if the cell is editable.
 */
@property (assign) BOOL editableCell;

/**
 * Indicates if the inserted value is
 * clearable with a clear action.
 */
@property (assign) BOOL clearable;

/**
 * Indicates if the cell is meant to
 * be of type edit only.
 */
@property (assign) BOOL editAlways;

/**
 * Indicates if the button is selectable
 * in the edit mode.
 */
@property (assign) BOOL selectableEdit;

/**
 * Indicates if the edit view is persistent.
 */
@property (assign) BOOL persistentEdit;

/**
 * Indicates if the cell should focus
 * when entering edit mode.
 */
@property (assign) BOOL focusEdit;

/**
 * Creates the editing view.
 */
- (void)createEditing;

/**
 * Shows the editing view.
 */
- (void)showEditing;

/**
 * Hides the editing view.
 */
- (void)hideEditing;

/**
 * Focus in the editing view contents.
 */
- (void)focusEditing;

/**
 * Blurs from the editing view contents.
 */
- (void)blurEditing;

/**
 * Persists the editing view contents.
 */
- (void)persistEditing;

/**
 * Rollback the editing view contents.
 */
- (void)rollbackEditing;

/**
 * Flushes the current editing contents.
 * This method should be overriden carefully
 * because it can cause side effects.
 */
- (void)flushEditing;

@end
