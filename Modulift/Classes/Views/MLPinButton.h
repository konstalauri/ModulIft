//
//  MLPinButton.h
//  Modulift
//
//  Created by lion on 2/4/15.
//  Copyright (c) 2015 Konsta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLLocationModel.h"


@interface MLPinButton : UIButton

+ (MLPinButton *)createButtonWithLocation:(MLLocationModel *)location superView:(UIView *)superView target:(id)target selector:(SEL)selector;

@property (nonatomic, strong) MLLocationModel *location;

@end
