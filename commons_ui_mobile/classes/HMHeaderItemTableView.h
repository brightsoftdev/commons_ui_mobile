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

#import "HMItemTableView.h"
#import "HMPlainStringTableViewCell.h"

/**
 * The number of sections in the header.
 */
#define HM_HEADER_ITEM_TABLE_VIEW_HEADER_SECTIONS 1

/**
 * The number of rows in the header.
 */
#define HM_HEADER_ITEM_TABLE_VIEW_HEADER_ROWS 2

/**
 * The height of each row in the header.
 */
#define HM_HEADER_ITEM_TABLE_VIEW_HEADER_ROW_HEIGHT 50

/**
 * The header item table view used to incorporate
 * an header in the item table view.
 */
@interface HMHeaderItemTableView : HMItemTableView<UITableViewDataSource> {
    @private
    NSString *_title;
    NSString *_subTitle;
    NSString *_image;
    UIView *_normalHeaderView;
    UIView *_editHeaderView;
    UILabel *_titleLabel;
    UILabel *_subTitleLabel;
    UIImageView *_imageImage;
    UIButton *_imageAddButton;
    HMPlainStringTableViewCell *_titleTableViewCell;
    HMPlainStringTableViewCell *_subTitleTableViewCell;
    HMTableView *_headerTableView;
}

/**
 * The title of the header.
 */
@property (retain) NSString *title;

/**
 * The sub-title of the header.
 */
@property (retain) NSString *subTitle;

/**
 * The image of the header.
 */
@property (retain) NSString *image;

/**
 * The header view to be used in "normal" mode.
 */
@property (retain) UIView *normalHeaderView;

/**
 * The header view to be used in "edit" mode.
 */
@property (retain) UIView *editHeaderView;

/**
 * The label for the title.
 */
@property (assign) UILabel *titleLabel;

/**
 * The label for the sub-title.
 */
@property (assign) UILabel *subTitleLabel;

/**
 * The image view to be used in the image.
 */
@property (assign) UIImageView *imageImage;

/**
 * The text field for the title.
 */
@property (assign) HMPlainStringTableViewCell *titleTableViewCell;

/**
 * The text field for the sub-title.
 */
@property (assign) HMPlainStringTableViewCell *subTitleTableViewCell;

/**
 * The button to the add image.
 */
@property (assign) UIButton *imageAddButton;

/**
 * The table view.
 */
@property (retain) HMTableView *headerTableView;

/**
 * Constructs the view components and adds them
 * to the view.
 */
- (void)constructView;

/**
 * Constructs the normal view components.
 */
- (void)constructNormalView;

/**
 * Constructs the edit view components.
 */
- (void)constructEditView;

/**
 * Called when the photo button is clicked.
 *
 * @param sender The sender component.
 * @param extra The extra parameters argument.
 */
- (void)addPhotoButtonClicked:(id)sender extra:(id)extra;

/**
 * Called when editing mode shows.
 */
- (void)showEditing;

/**
 * Called when editing mode hides.
 */
- (void)hideEditing;

/**
 * Redraws the header part.
 */
- (void)redrawHeader;

@end
