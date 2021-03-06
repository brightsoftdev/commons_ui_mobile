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

/**
 * The navigation bar image vertical height.
 */
#define HM_NAVIGATION_BAR_IMAGE_VERTICAL_HEIGHT 44

/**
 * The navigation bar image horizontal height.
 */
#define HM_NAVIGATION_BAR_IMAGE_HORIZONTAL_HEIGHT 32

/**
 * Extends the ui kit navigation bar by
 * allowing to customize its background
 * between different ios versions.
 */
@interface HMNavigationBarImage : UINavigationBar {
    @private
    NSString *_verticalImageName;
    NSString *_horizontalImageName;
}

/**
 * The name of the image to be used in vertical position.
 */
@property (retain) NSString *verticalImageName;

/**
 * The name of the image to be used in horizontal position.
 */
@property (retain) NSString *horizontalImageName;

@end
