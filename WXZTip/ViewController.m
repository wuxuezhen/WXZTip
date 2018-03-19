//
//  ViewController.m
//  WXZTip
//
//  Created by wxz on 2017/8/31.
//  Copyright © 2017年 wxz. All rights reserved.
//

#import "ViewController.h"
#import "TipViewController.h"
#import "MBViewController.h"
#import "WXZTip-Bridging-Header.h"
#import <Masonry/Masonry.h>
#import "WXZTip-Swift.h"
#import "UITableView+JMRefresh.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@[@"tip"],@[@"MB"]];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.bottom.trailing.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
    }];
    [self.tableView jm_headerGitRefreshTarget:self selecter:@selector(ss)];
    
}
-(void)ss{
    NSLog(@"endRefresh");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView endRefresh];
    });
}
-(void)showYouName{
    NSLog(@"showYouName");
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray[section] count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Tip提示";
    }else{
        return @"MB提示";
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *tip = self.dataArray[indexPath.section][indexPath.row];
    SListViewController *list = [[SListViewController alloc]init];
    list.title = tip;
    [self.navigationController pushViewController:list animated:YES];
//    if (indexPath.section == 0) {
//        TipViewController *tipVc = [[TipViewController alloc]init];
//        tipVc.title = tip;
//        [self.navigationController pushViewController:tipVc animated:YES];
//    }else{
//        MBViewController *mbVc = [[MBViewController alloc]init];
//        mbVc.title = tip;
//        [self.navigationController pushViewController:mbVc animated:YES];
//    }
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
