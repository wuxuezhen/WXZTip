//
//  RootViewController.m
//  WXZTip
//
//  Created by wxz on 2017/9/1.
//  Copyright © 2017年 wxz. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (nonatomic,strong) MBProgressHUD *hud;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createHUD];
    // Do any additional setup after loading the view.
}
-(void)createHUD{
    // 实例化浮层
    self.hud = [[MBProgressHUD alloc] initWithView:self.view];
    // 设置显示的标题
    self.hud.label.text = @"请稍等";
    // 添加子视图
    [self.view addSubview:self.hud];
}


#pragma mark - LoadingView



-(void)showLoadingView{
    self.hud.mode = MBProgressHUDModeIndeterminate;
    [self showLoadingWithText:@"请稍等"];
}

-(void)showLoadingViewDefaultText:(NSString *)text{
    self.hud.mode = MBProgressHUDModeIndeterminate;
    [self showLoadingWithText:text];
}
-(void)showLoadingWithHUDMode:(MBProgressHUDMode)mode Text:(NSString *)text{
    self.hud.mode = mode;
    [self showLoadingWithText:text];
}

-(void)showLoadingWithHUDModeText{
    self.hud.mode = MBProgressHUDModeText;
    [self showLoadingViewWithMode];
}

-(void)showLoadingWithHUDModeDeterminate{
    self.hud.mode =  MBProgressHUDModeDeterminate;
    [self showLoadingViewWithMode];
}
-(void)showLoadingWithHUDModeDeterminateHorizontalBar{
    self.hud.mode =  MBProgressHUDModeDeterminateHorizontalBar;
    [self showLoadingViewWithMode];
}
-(void)showLoadingWithHUDModeAnnularDeterminate{
    self.hud.mode =  MBProgressHUDModeAnnularDeterminate;
    [self showLoadingViewWithMode];
}
-(void)showLoadingWithHUDModeCustomView{
    self.hud.mode =  MBProgressHUDModeCustomView;
    self.hud.customView = [self customView];
    [self showLoadingViewWithMode];
}
-(void)showLoadingViewWithMode{
    [self showLoadingWithText:@"请稍等"];
}

//自定义视图
-(UIView *)customView{
    UIImageView *gifImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Loading_1"]];
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    for (int i = 0; i < 12; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Loading_%d", i + 1]];
        [arrM addObject:image];
    }
    [gifImageView setAnimationImages:arrM];
    [gifImageView setAnimationDuration:1.5];
    [gifImageView setAnimationRepeatCount:0];
    [gifImageView startAnimating];
    return gifImageView;
}

//私有
-(void)showLoadingWithText:(NSString *)text{
    self.hud.label.text = text;
    [self.view bringSubviewToFront:self.hud];
    [self.hud showAnimated:YES];
}
-(void)hideLoadingView{
    if (self.hud) {
        [self.hud hideAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
