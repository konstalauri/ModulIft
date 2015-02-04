//
//  MLLocationInfoCollectionCell.m
//  Modulift
//
//  Created by Konsta on 04/02/15.
//  Copyright (c) 2015 Konsta. All rights reserved.
//

#import "MLLocationInfoCollectionCell.h"

@implementation MLLocationInfoCollectionCell

- (void)setLocation:(MLLocationModel *)location
{
    _location = location;
    
    self.lblTitle.text = location.locationName;
    self.lblAddress.text = location.locationAddress;
    self.lblPhoneNumber.text = location.phoneNumber;
    
    if (location.isSelected) {
        self.imgviewPin.hidden = NO;
        self.imgviewHighlightBackground.hidden = NO;
    } else {
        self.imgviewPin.hidden = YES;
        self.imgviewHighlightBackground.hidden = YES;
    }
}

@end
