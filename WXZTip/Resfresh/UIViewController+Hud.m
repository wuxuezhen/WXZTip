//
//  UIViewController+Hud.m
//  WeiDu
//
//  Created by 吴振振 on 2017/11/16.
//  Copyright © 2017年 吴振振. All rights reserved.
//

#import "UIViewController+Hud.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIViewController (Hud)

- (void)jm_showProgressHud:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.removeFromSuperViewOnHide = YES;
    //设置菊花框为白色
    hud.contentColor = [UIColor whiteColor];
    if (text) {
       hud.label.text = text;
    }
}

- (void)jm_showProgressHud {
    [self jm_showProgressHud:nil];
}

- (void)jm_dismissHud {
    dispatch_async(dispatch_get_main_queue(), ^{
        for (MBProgressHUD *hud in [self HUDSForView:self.view]) {
            [hud hideAnimated:YES];
            hud.removeFromSuperViewOnHide = YES;
        }
    });
}

- (NSArray *)HUDSForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    NSMutableArray *huds = [NSMutableArray arrayWithCapacity:0];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:MBProgressHUD.class]) {
            [huds addObject:subview];
        }
    }
    return huds;
}

#pragma mark - 弹窗
- (void)jm_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
                confirmAction:(void (^)(void))confirmAciton
                 cancelAction:(void (^)(void))cancelAciton {
    
    [self jm_showAlertWithTitle:title
                        message:message
         destructiveActionTitle:@"确定"
              cancelActionTitle:@"取消"
                  confirmAction:confirmAciton
                   cancelAction:cancelAciton];
}

- (void)jm_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
       destructiveActionTitle:(NSString *)destructiveTitle
            cancelActionTitle:(NSString *)cancelTitle
                confirmAction:(void (^)(void))confirmAciton
                 cancelAction:(void (^)(void))cancelAciton{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:cancelTitle
                                              style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                  if (cancelAciton) {
                                                      cancelAciton();
                                                  }
                                              }]];
    [alert addAction:[UIAlertAction actionWithTitle:destructiveTitle
                                              style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                  if (confirmAciton) {
                                                      confirmAciton();
                                                  }
                                              }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}





- (void)jm_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
                confirmAction:(void (^)(void))confirmAciton{
    
    [self jm_showAlertWithTitle:title
                        message:message
                    actionTitle:@"确定"
                  confirmAction:confirmAciton];
   
}

-(void)jm_showAlertWithTitle:(NSString *)title
                     message:(NSString *)message
                 actionTitle:(NSString *)actionTitle
               confirmAction:(void (^)(void))confirmAciton{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:actionTitle
                                              style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                  if (confirmAciton) {
                                                      confirmAciton();
                                                  }
                                              }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


@end
