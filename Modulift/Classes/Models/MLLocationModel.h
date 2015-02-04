//
//  MLLocationModel.h
//  Modulift
//
//  Created by Konsta on 04/02/15.
//  Copyright (c) 2015 Konsta. All rights reserved.
//

#import "MLObject.h"
#import <MapKit/MapKit.h>


@interface MLLocationModel : MLObject

@property (nonatomic, assign, getter=isSelected) BOOL      selected;

@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSString *locationAddress;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, assign) CGPoint   position;

@end
