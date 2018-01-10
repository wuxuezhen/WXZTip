//
//  JMRefreshnAutoNormalFooter.m
//  WXZTip
//
//  Created by 吴振振 on 2018/1/10.
//  Copyright © 2018年 wxz. All rights reserved.
//

#import "JMRefreshnAutoNormalFooter.h"

@implementation JMRefreshnAutoNormalFooter
//重写父类
- (void)prepare{
    [super prepare];
    [self setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    [self setTitle:@"加载更多" forState:MJRefreshStateIdle];
    [self setTitle:@"即将加载" forState:MJRefreshStateWillRefresh];
    [self setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    self.automaticallyHidden = YES;
    
}

//如果需要自己重新布局子控件
- (void)placeSubviews{
    [super placeSubviews];
    
}

@end
