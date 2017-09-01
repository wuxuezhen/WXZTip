//
//  MBViewController.m
//  WXZTip
//
//  Created by wxz on 2017/9/1.
//  Copyright © 2017年 wxz. All rights reserved.
//

#import "MBViewController.h"

@interface MBViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation MBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"隐藏"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(hideLoad)];
    self.dataArray = @[@"默认菊花",@"只有文字",@"圆形进度",@"自定义文字",@"环形进度",@"自定义View",@"自定义Mode和文字"];
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"MB提示";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            [self showLoadingView];
            break;
        case 1:
              [self showLoadingWithHUDModeText];
            break;
        case 2:
              [self showLoadingWithHUDModeDeterminate];
            break;
        case 3:
            [self showLoadingViewDefaultText:@"自定义文字"];
            break;
        case 4:
             [self showLoadingWithHUDModeAnnularDeterminate];
            break;
        case 5:
             [self showLoadingWithHUDModeCustomView];
            break;
        case 6:
            [self showLoadingWithHUDMode:MBProgressHUDModeDeterminateHorizontalBar Text:@"自定义Mode和文字"];
            break;
            
        default:
            break;
    }
    
}
-(void)hideLoad{
    [self hideLoadingView];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        
    }
    return _tableView;
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
