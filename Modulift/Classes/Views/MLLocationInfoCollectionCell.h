//
//  MLLocationInfoCollectionCell.h
//  Modulift
//
//  Created by Konsta on 04/02/15.
//  Copyright (c) 2015 Konsta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLLocationModel.h"

static NSString *MLLocationInfoCollectionCellIdentifier  = @"MLLocationInfoCollectionCell";


@interface MLLocationInfoCollectionCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView    *imgviewHighlightBackground;
@property (nonatomic, weak) IBOutlet UILabel        *lblTitle;
@property (nonatomic, weak) IBOutlet UIImageView    *imgviewPin;
@property (nonatomic, weak) IBOutlet UILabel        *lblAddress;
@property (nonatomic, weak) IBOutlet UILabel        *lblPhoneNumber;


@property (nonatomic, strong) MLLocationModel       *location;

@end
