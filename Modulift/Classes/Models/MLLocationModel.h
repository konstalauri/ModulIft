//
//  MLLocationModel.h
//  Modulift
//
//  Created by Konsta on 04/02/15.
//  Copyright (c) 2015 Konsta. All rights reserved.
//

#import "MLObject.h"
#import <MapKit/MapKit.h>


@interface MLLocationModel : MLObject <MKAnnotation>

#pragma mark - Override properties
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// Title and subtitle for use by selection UI.
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

// Called as a result of dragging an annotation view.
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate NS_AVAILABLE(10_9, 4_0);

#pragma mark - Instance properties

@property (nonatomic, assign, getter=isSelected) BOOL      selected;

@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSString *locationAddress;
@property (nonatomic, strong) NSString *phoneNumber;

@end
