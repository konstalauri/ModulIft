//
//  MLOurNetworkVC.m
//  Modulift
//
//  Created by Konsta on 04/02/15.
//  Copyright (c) 2015 Konsta. All rights reserved.
//

#import "MLOurNetworkVC.h"
#import <MapKit/MapKit.h>
#import "MLLocationInfoCollectionCell.h"
#import "MLAnnotationView.h"
#import "MLPinButton.h"


@interface MLOurNetworkVC () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableArray *arrayLocations;
    NSMutableArray *arrayButtonsForPin;
    
}

@property (nonatomic, weak) IBOutlet UICollectionView   *clsviewForInformation;
@property (nonatomic, weak) IBOutlet UIView             *viewMapContainer;
@property (nonatomic, weak) IBOutlet UIImageView        *imgviewMap;



@end

@implementation MLOurNetworkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrayLocations = [[NSMutableArray alloc] init];
    arrayButtonsForPin = [[NSMutableArray alloc] init];
    
    
    MLLocationModel *location0 = [[MLLocationModel alloc] init];
    location0.position = CGPointMake(100, 197);
    location0.locationName = @"ABC";
    location0.locationAddress = @"ajlfkajsld jfad as dfjalk sdjfl a";
    location0.phoneNumber = @"+19380293094";
    [arrayLocations addObject:location0];
    
    MLLocationModel *location1 = [[MLLocationModel alloc] init];
    location1.position = CGPointMake(148, 150);
    location1.locationName = @"BBT";
    location1.locationAddress = @"oihp poi 4p3oipoi 4oipo 6ip4oiop";
    location1.phoneNumber = @"+19380234324";
    [arrayLocations addObject:location1];
    
    MLLocationModel *location2 = [[MLLocationModel alloc] init];
    location2.position = CGPointMake(195, 230);
    location2.locationName = @"BBT";
    location2.locationAddress = @"oihp poi 4p3oipoi 4oipo 6ip4oiop";
    location2.phoneNumber = @"+19380234324";
    [arrayLocations addObject:location2];

    
    MLLocationModel *location3 = [[MLLocationModel alloc] init];
    location3.position = CGPointMake(607, 150);
    location3.locationName = @"BBT";
    location3.locationAddress = @"oihp poi 4p3oipoi 4oipo 6ip4oiop";
    location3.phoneNumber = @"+19380234324";
    [arrayLocations addObject:location3];

    
    MLLocationModel *location4 = [[MLLocationModel alloc] init];
    location4.position = CGPointMake(498, 245);
    location4.locationName = @"BBT";
    location4.locationAddress = @"oihp poi 4p3oipoi 4oipo 6ip4oiop";
    location4.phoneNumber = @"+19380234324";
    [arrayLocations addObject:location4];

    
    MLLocationModel *location5 = [[MLLocationModel alloc] init];
    location5.position = CGPointMake(402, 198);
    location5.locationName = @"BBT";
    location5.locationAddress = @"oihp poi 4p3oipoi 4oipo 6ip4oiop";
    location5.phoneNumber = @"+19380234324";
    [arrayLocations addObject:location5];

    
    [self addLocationsWithArray:arrayLocations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addLocationsWithArray:(NSArray *)array
{
    [self.viewMapContainer.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[MLPinButton class]]) {
            [(UIButton *)obj removeFromSuperview];
        }
    }];
    
    [arrayLocations enumerateObjectsUsingBlock:^(MLLocationModel *locationInfo, NSUInteger idx, BOOL *stop) {
        MLPinButton *button = [MLPinButton createButtonWithLocation:locationInfo superView:self.viewMapContainer target:self selector:@selector(onClickPin:)];
        [self.viewMapContainer addSubview:button];
    }];
}


- (void) onClickPin:(id)sender
{
    [self.viewMapContainer.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[MLPinButton class]]) {
            MLPinButton *button = (MLPinButton *)obj;
            if (button == sender || button.location == sender) {
                button.selected = YES;
                button.location.selected = YES;
            } else {
                button.selected = NO;
                button.location.selected = NO;
            }
        }
    }];

    [self.clsviewForInformation reloadData];
    
    if ([sender isKindOfClass:[MLPinButton class]]) {
        [arrayLocations enumerateObjectsUsingBlock:^(MLLocationModel *locationModel, NSUInteger idx, BOOL *stop) {
            if (locationModel == [(MLPinButton *)sender location]) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
                [self.clsviewForInformation scrollToItemAtIndexPath:indexPath atScrollPosition:(UICollectionViewScrollPositionCenteredHorizontally) animated:YES];
                *stop = YES;
            }
        }];

    }
}

/*
#pragma mark - MKMapView delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MLAnnotationView *annotationView = (MLAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:MLAnnotationViewIdentifier];
    if (!annotationView) {
        annotationView = [[MLAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:MLAnnotationViewIdentifier];
    }
    MLLocationModel *locationInfo = (MLLocationModel *)annotation;
    
    if (locationInfo.isSelected) {
        annotationView.image = [UIImage imageNamed:@"selectedPin"];
    } else {
        annotationView.image = [UIImage imageNamed:@"pin"];
    }
    annotationView.annotation = annotation;
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    MLLocationModel *locationInfo = (MLLocationModel *)view.annotation;
    locationInfo.selected = YES;
    view.image = [UIImage imageNamed:@"selectedPin"];
    
    [self.clsviewForInformation reloadData];
    
    [arrayLocations enumerateObjectsUsingBlock:^(MLLocationModel *locationModel, NSUInteger idx, BOOL *stop) {
        if (locationModel == locationInfo) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
            [self.clsviewForInformation scrollToItemAtIndexPath:indexPath atScrollPosition:(UICollectionViewScrollPositionCenteredHorizontally) animated:YES];
            *stop = YES;
        }
    }];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    MLLocationModel *locationInfo = (MLLocationModel *)view.annotation;
    locationInfo.selected = NO;
    view.image = [UIImage imageNamed:@"pin"];
}
*/

#pragma mark - UICollectionView datasource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MLLocationInfoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MLLocationInfoCollectionCellIdentifier forIndexPath:indexPath];
    cell.location = arrayLocations[indexPath.row];
    
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return arrayLocations.count;
}

#pragma mark - UICollectionView delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MLLocationInfoCollectionCell *cell = (MLLocationInfoCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [self onClickPin:cell.location];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
