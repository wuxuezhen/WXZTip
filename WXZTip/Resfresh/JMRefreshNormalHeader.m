//
//  JMRefreshNormalHeader.m
//  WXZTip
//
//  Created by 吴振振 on 2018/1/10.
//  Copyright © 2018年 wxz. All rights reserved.
//

#import "JMRefreshNormalHeader.h"

@implementation JMRefreshNormalHeader

 //重写父类
- (void)prepare{
    [super prepare];
    [self setTitle:@"松手刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
    [self setTitle:@"即将刷新" forState:MJRefreshStateWillRefresh];
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.font = [UIFont systemFontOfSize:14];
    
}

//如果需要自己重新布局子控件
- (void)placeSubviews{
    [super placeSubviews];
    
}


@end
