//
//  JMRefreshGifHeader.m
//  WXZTip
//
//  Created by 吴振振 on 2018/1/10.
//  Copyright © 2018年 wxz. All rights reserved.
//

#import "JMRefreshGifHeader.h"
@interface JMRefreshGifHeader()
@property (nonatomic, strong) NSMutableArray *headerImages;
@end
@implementation JMRefreshGifHeader

//重写父类
-(void)prepare{
    [super prepare];
    
    NSArray *images = self.headerImages;
    [self setImages:images duration:2 forState:MJRefreshStateRefreshing];
    [self setImages:@[images[7]] forState:MJRefreshStateIdle];
    [self setImages:@[images[8]] forState:MJRefreshStatePulling];
    
    self.stateLabel.hidden = YES;
    self.lastUpdatedTimeLabel.hidden = YES;
    
}

-(NSArray *)headerImages{
    if (!_headerImages) {
        _headerImages = [NSMutableArray arrayWithCapacity:0];
        for (int i = 1; i <= 14; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"step%d",i]];
            [_headerImages addObject:image];
        }
    }
    return _headerImages;
}

//如果需要自己重新布局子控件
- (void)placeSubviews{
    [super placeSubviews];
    
}
@end
