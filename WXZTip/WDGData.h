//
//  WDGData.h
//  WXZTip
//
//  Created by wxz on 2017/9/15.
//  Copyright © 2017年 wxz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDGData : NSObject
@property (strong, nonatomic, nullable) id value;
@property (strong, nonatomic, nullable) id priority;
@property (readonly, nonatomic) NSUInteger childrenCount;
@property (readonly, strong, nonatomic) NSEnumerator * _Nullable children;
@property (readonly, strong, nonatomic, nullable) NSString *key;
- (BOOL)hasChildren;

@end
