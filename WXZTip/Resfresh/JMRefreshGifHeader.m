//
//  JMRefreshGifHeader.m
//  WXZTip
//
//  Created by 吴振振 on 2018/1/10.
//  Copyright © 2018年 wxz. All rights reserved.
//

#import "JMRefreshGifHeader.h"

@implementation JMRefreshGifHeader

//重写父类
-(void)prepare{
    [super prepare];
    
    NSArray *images = [self headerImages];
    [self setImages:images duration:2 forState:MJRefreshStateRefreshing];
    [self setImages:@[images[0]] forState:MJRefreshStateIdle];
    [self setImages:@[images[1]] forState:MJRefreshStateWillRefresh];
    [self setImages:@[images[2]] forState:MJRefreshStatePulling];
    
    self.stateLabel.hidden = YES;
    self.lastUpdatedTimeLabel.hidden = YES;
    
}
-(NSArray *)headerImages{
    NSMutableArray *headerImages = [NSMutableArray array];
    for (int i = 1; i <= 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"topload%d",i]];
        [headerImages addObject:image];
    }
    return headerImages;
}

//如果需要自己重新布局子控件
- (void)placeSubviews{
    [super placeSubviews];
    
}
@end
