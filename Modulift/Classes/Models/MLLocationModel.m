//
//  MLLocationModel.m
//  Modulift
//
//  Created by Konsta on 04/02/15.
//  Copyright (c) 2015 Konsta. All rights reserved.
//

#import "MLLocationModel.h"

@implementation MLLocationModel


- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    _coordinate = newCoordinate;
}


- (void)setLocationName:(NSString *)locationName
{
    _locationName = locationName;
    _title = locationName;
}

- (void)setLocationAddress:(NSString *)locationAddress
{
    _locationAddress = locationAddress;
    _subtitle = locationAddress;
    
}

@end
