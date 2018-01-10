//
//  UIViewController+Hud.h
//  WeiDu
//
//  Created by 吴振振 on 2017/11/16.
//  Copyright © 2017年 吴振振. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Hud)

- (void)jm_showProgressHud:(NSString *)text;
- (void)jm_showProgressHud;
- (void)jm_dismissHud;

/*** 中间弹窗 包含确定、取消两个事件 **/
- (void)jm_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
                confirmAction:(void (^)(void))confirmAciton
                 cancelAction:(void (^)(void))cancelAciton;


/**
 中间弹窗 包含两个事件

 @param title 标题
 @param message 内容
 @param destructiveTitle 确定标题
 @param cancelTitle 取消标题
 @param confirmAciton 确定事件
 @param cancelAciton 取消事件
 */
- (void)jm_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
       destructiveActionTitle:(NSString *)destructiveTitle
            cancelActionTitle:(NSString *)cancelTitle
                confirmAction:(void (^)(void))confirmAciton
                 cancelAction:(void (^)(void))cancelAciton;


/*** 中间弹窗仅确定事件 **/
- (void)jm_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
                confirmAction:(void (^)(void))confirmAciton;

- (void)jm_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
                  actionTitle:(NSString *)actionTitle
                confirmAction:(void (^)(void))confirmAciton;
@end
