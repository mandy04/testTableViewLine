//
//  ViewController.m
//  testTableViewLine
//
//  Created by llbt on 16/2/18.
//  Copyright © 2016年 llbt. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoTextCell.h"
#import "UITableView+Common.h"
#import "UIButton+Bootstrap.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"封装 显示个人信息，可滑动";
    [self createUI];
}

- (void)createUI {
    
    _myTableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = BgColor(238, 238, 238, 1);
        [tableView registerClass:[UserInfoTextCell class] forCellReuseIdentifier:kCellIdentifier_UserInfoTextCell];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.tableFooterView = [self footerV];
        [self.view addSubview:tableView];
    
        tableView;
    });
}

#pragma mark footerV
- (UIView *)footerV{
    UIView *footerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 72)];
    footerV.backgroundColor = [UIColor clearColor];
    UIButton *footerBtn = [UIButton buttonWithStyle:StrapSuccessStyle andTitle:@"发消息" andFrame:CGRectMake(kPaddingLeftWidth, (CGRectGetHeight(footerV.frame)-44)/2 , kScreen_Width - 2*kPaddingLeftWidth, 44) target:self action:@selector(messageBtnClicked)];
    [footerV addSubview:footerBtn];
    return footerV;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    
    return (kScreen_Height-350);
}

//区与footer之间距离
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0;
}

- (void)messageBtnClicked {

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserInfoTextCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_UserInfoTextCell forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            [cell setTitle:@"所在地:" value:@"北京"];
            break;
        case 1:
            [cell setTitle:@"座右铭:" value:@"轰轰烈烈做我是我，真真切切感觉活着！"];
            break;
        case 2:
            [cell setTitle:@"个性标签:" value:@"乐活族、90后、开朗、程序员、ios、程序开发、女汉纸、技术、减肥中、、、"];
            break;
        case 3:
            [cell setTitle:@"个人详情:" value:@"暂无"];
            break;
        default:
            break;
    }

    [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:15];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UserInfoTextCell cellHeight];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
