//
//  UITableView+JMRefresh.m
//  AZURestWeidu3
//
//  Created by 吴振振 on 2017/12/11.
//  Copyright © 2017年 coreface. All rights reserved.
//

#import "UITableView+JMRefresh.h"
#import <MJRefresh/MJRefresh.h>
@implementation UITableView (JMRefresh)

-(void)jm_headerRefreshTarget:(id)target selecter:(SEL)selecter{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target
                                                                     refreshingAction:selecter];
    [header setTitle:@"松手刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
    [header setTitle:@"即将刷新" forState:MJRefreshStateWillRefresh];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.mj_header = header;
    
}


-(void)jm_headerGitRefreshTarget:(id)target selecter:(SEL)selecter{
    
    MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingTarget:target
                                                                  refreshingAction:selecter];
    gifHeader.stateLabel.hidden = YES;
    gifHeader.lastUpdatedTimeLabel.hidden = YES;
    NSArray *images = [self headerImages];
    
    [gifHeader setImages:images duration:2 forState:MJRefreshStateRefreshing];
    [gifHeader setImages:@[images[0]] forState:MJRefreshStateIdle];
    [gifHeader setImages:@[images[1]] forState:MJRefreshStateWillRefresh];
    [gifHeader setImages:@[images[2]] forState:MJRefreshStatePulling];
   
    self.mj_header = gifHeader;
}

-(NSArray *)headerImages{
    NSMutableArray *headerImages = [NSMutableArray array];
    for (int i = 1; i <= 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"topload%d",i]];
        [headerImages addObject:image];
    }
    return headerImages;
}

-(void)jm_footerRefreshTarget:(id)target selecter:(SEL)selecter{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target
                                                                             refreshingAction:selecter];
    [footer setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    [footer setTitle:@"加载更多" forState:MJRefreshStateIdle];
    [footer setTitle:@"即将加载" forState:MJRefreshStateWillRefresh];
    [footer setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    footer.automaticallyHidden = YES;
    self.mj_footer = footer;
}



-(void)endRefreshAllLoad:(BOOL)loaded{
    if (loaded) {
        [self.mj_footer endRefreshingWithNoMoreData];
    }
    if ([self.mj_header isRefreshing]) {
        [self.mj_header endRefreshing];
    }
}
-(void)endRefresh{
    if ([self.mj_header isRefreshing]) {
        [self.mj_header endRefreshing];
        self.mj_footer.state = MJRefreshStateIdle;
    }
    if ([self.mj_footer isRefreshing]) {
        [self.mj_footer endRefreshing];
    }
    [self reloadData];
}
@end

