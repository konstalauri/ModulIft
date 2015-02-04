//
//  MLPinButton.m
//  Modulift
//
//  Created by lion on 2/4/15.
//  Copyright (c) 2015 Konsta. All rights reserved.
//

#import "MLPinButton.h"

@implementation MLPinButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (MLPinButton *)createButtonWithLocation:(MLLocationModel *)location superView:(UIView *)superView target:(id)target selector:(SEL)selector
{
    MLPinButton *button = [[MLPinButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    UIImage *imgSelectedPin = [UIImage imageNamed:@"selectedPin"];
    UIImage *imgPin         = [UIImage imageNamed:@"pin"];
    [button setImage:imgSelectedPin forState:(UIControlStateSelected)];
    [button setImage:imgPin         forState:(UIControlStateNormal)];
    button.location = location;
    
    [superView addSubview:button];
    button.center = location.position;
    
    [button addTarget:target action:selector forControlEvents:(UIControlEventTouchUpInside)];
    
    return button;
}

- (void)setLocation:(MLLocationModel *)location
{
    _location = location;
    if (location.isSelected) {
        self.selected = YES;
    } else {
        self.selected = NO;
    }
}

@end
