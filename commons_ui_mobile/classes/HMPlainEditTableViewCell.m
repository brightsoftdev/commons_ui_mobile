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

#import "HMPlainEditTableViewCell.h"

@implementation HMPlainEditTableViewCell

- (id)initWithReuseIdentifier:(NSString *)cellIdentifier {
    // invokes the parent constructor
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];

    // defines the text label's font
    self.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];

    // returns self
    return self;
}

- (void)createEditing {
    // calls the super
    [super createEditing];

    // initializes the delta
    float delta = 0;

    // adjusts the delta in case the item table view is plain
    if(self.itemTableView.style == UITableViewStylePlain) {
        delta += 24;
    }

    // creates the edit view
    CGRect editViewFrame = CGRectMake(delta, 0, self.contentView.frame.size.width - delta, self.contentView.frame.size.height);
    UIView *editView = [[UIView alloc] initWithFrame:editViewFrame];
    editView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    editView.backgroundColor = [UIColor clearColor];

    // adds the edit view to the content view
    [self.contentView addSubview:editView];

    // sets the attributes
    self.editView = editView;

    // releases the objects
    [editView release];
}

- (void)showEditing {
    // hides the text label
    self.textLabel.hidden = YES;

    // calls the super
    [super showEditing];
}

- (void)hideEditing {
    // calls the super
    [super hideEditing];

    // returns in case the edit
    // view is persistent
    if(self.persistentEdit) {
        return;
    }

    // shows the text label
    self.textLabel.hidden = NO;
}

- (void)setDescription:(NSString *)description {
    // in case the object is the same
    if(description == _description) {
        // returns immediately
        return;
    }

    // releases the object
    [_description release];

    // sets and retains the object
    _description = [description retain];

    // sets the cell's text label
    self.textLabel.text = description;
}

@end
