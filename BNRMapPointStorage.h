//
//  BNRMapPointStorage.h
//  FollowMyPins
//
//  Created by Richard on 7/3/14.
//  Copyright (c) 2014 Team_7. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRMapPoint;

@interface BNRMapPointStorage : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

+ (instancetype)sharedStorage;



-(void)createItem:(BNRMapPoint *)point;

@end
