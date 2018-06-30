//
//  InLineTextEditTableViewCell.m
//  Off the Record
//
//  Created by David on 10/2/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRInLineTextEditTableViewCell.h"
#import "OTRUtilities.h"
@import PureLayout;

@interface OTRInLineTextEditTableViewCell ()

@property (nonatomic) BOOL addedConstraints;
@property (nonatomic, strong) NSArray * constraints;

@end

@implementation OTRInLineTextEditTableViewCell

-(void)setTextField:(UITextField *)newTextField
{
    if (self.textField) {
        [self.textField removeFromSuperview];
    }
    _textField = newTextField;
    _textField.translatesAutoresizingMaskIntoConstraints = NO;

    [self.constraints autoRemoveConstraints];
    self.constraints = nil;
    self.addedConstraints = NO;
    [self.contentView addSubview:self.textField];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints{
    [super updateConstraints];
    if (!self.addedConstraints && self.textField) {
        
        NSLayoutConstraint *leadingEdgeConstraint = [self.textField autoPinEdge:ALEdgeLeading
                                                                          toEdge:ALEdgeTrailing
                                                                          ofView:self.textLabel
                                                                      withOffset:6];
        
        NSLayoutConstraint *trailingEdgeConstraint = [self.textField autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:5];
        
        NSLayoutConstraint *centerConstraint = [self.textField autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        self.constraints = @[leadingEdgeConstraint,trailingEdgeConstraint,centerConstraint];
        
        self.addedConstraints = YES;
    }
}


@end
