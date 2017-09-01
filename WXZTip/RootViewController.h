//
//  RootViewController.h
//  WXZTip
//
//  Created by wxz on 2017/9/1.
//  Copyright © 2017年 wxz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
@interface RootViewController : UIViewController

/** 默认 **/
-(void)showLoadingView;

/** 默认风格自定义文字 **/
-(void)showLoadingViewDefaultText:(NSString *)text;

/** 自定义风格文字 **/
-(void)showLoadingWithHUDMode:(MBProgressHUDMode)mode Text:(NSString *)text;

/** 默认文字风格 **/
-(void)showLoadingWithHUDModeText;

/** 默认圆形进度**/
-(void)showLoadingWithHUDModeDeterminate;

/** 默认HorizontalBar **/
-(void)showLoadingWithHUDModeDeterminateHorizontalBar;

/** 默认环形进度 **/
-(void)showLoadingWithHUDModeAnnularDeterminate;

/** 默认自定义View **/
-(void)showLoadingWithHUDModeCustomView;

/** 隐藏 **/
-(void)hideLoadingView;
@end
