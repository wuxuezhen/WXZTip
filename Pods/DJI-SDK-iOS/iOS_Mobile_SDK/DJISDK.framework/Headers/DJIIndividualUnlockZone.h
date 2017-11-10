//
//  DJIIndividualUnlockZone.h
//  DJISDK
//
//  Copyright © 2017, DJI. All rights reserved.
//

#import "DJISDKFoundation.h"
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN



/**
 *  Users can unlock areas of a restricted fly zone through
 *  http://www.dji.com/flysafe/geo-system/individual-unlock.  A user needs to show
 *  special authorization (usually from a third party such as a regulatory  or
 *  managing agency) as part of the process to unlock the area within the restricted
 *  fly zone.  Therefore each request is unique and customized to the individual. If
 *  the request is successful,  the unlocked area is tied to the user's account as
 *  an Individual Unlock Zone.
 *  This class contains the properties of an Individual Unlock Zone.
 */
@interface DJIIndividualUnlockZone : NSObject


/**
 *  The unique ID of the Individual Unlock zone.
 */
@property(nonatomic, readonly) NSUInteger ID;


/**
 *  Name of the Individual Unlock zone.
 */
@property(nonatomic, readonly) NSString* name;


/**
 *  The coordinate of the Individual Unlock zone's center.
 */
@property(nonatomic, readonly) CLLocationCoordinate2D center;


/**
 *  The radius of the Individual Unlock zone in meters.
 */
@property(nonatomic, readonly) double radius;


/**
 *  The timestamp of when the unlocking begins, formatted in UTC (YYYY-MM-DD
 *  hh:mm:ss).  When the time is not available from the server,
 *  `DJIFlyZoneInformationInvalidTimestamp` will be returned.
 */
@property(nonatomic, readonly) NSString* startTime;


/**
 *  The timestamp of when the unlocking ends, formatted in UTC (YYYY-MM-DD
 *  hh:mm:ss).  When the time is not available from the server,
 *  `DJIFlyZoneInformationInvalidTimestamp` will be returned.
 */
@property(nonatomic, readonly) NSString* endTime;


/**
 *  `YES` if the Individual Unlock zone has expired. After a zone is expired,  the
 *  location will be locked.
 */
@property(nonatomic, readonly) BOOL isExpired;

@end

NS_ASSUME_NONNULL_END
