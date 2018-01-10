//
//  UITableView+JMRefresh.h
//  AZURestWeidu3
//
//  Created by 吴振振 on 2017/12/11.
//  Copyright © 2017年 coreface. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (JMRefresh)
-(void)jm_headerRefreshTarget:(id)target selecter:(SEL)selecter;
-(void)jm_footerRefreshTarget:(id)target selecter:(SEL)selecter;

-(void)jm_headerGitRefreshTarget:(id)target selecter:(SEL)selecter;

-(void)endRefresh;
-(void)endRefreshAllLoad:(BOOL)loaded;
@end
