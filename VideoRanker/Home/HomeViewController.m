//
//  HomeViewController.m
//  VideoRanker
//
//  Created by Ardee on 16/5/27.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "UIImageView+WebCache.h"
#import "DCPicScrollView.h"

@interface HomeViewController ()
{
    UITableView *_tableView;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self creatTableView];
    
}
#pragma mark ----创建首页的列表--
- (void)creatTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 115;
    [_tableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"homeCell"];
    [self.view addSubview:_tableView];
}
#pragma mark ----tableView协议方法返回单元格个数每个区--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
#pragma mark ----tableView协议方法返回单元格内容--
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *homeCell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath];
    [homeCell.cellImg setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"test1.jpg"]];
    homeCell.cellTitle.text = @"测试视频";
    homeCell.cellText.text = @"绝命毒师是一个先小众后大众的美剧，里面很隐晦的反应了人们的内心，可以说是上乘佳作。";
    return homeCell;
}
#pragma mark ----tableView协议方法返回区头内容--
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 265)];
    headView.backgroundColor = [UIColor lightTextColor];
    NSMutableArray *arr2 = [[NSMutableArray alloc] init];
    
    NSMutableArray *arr3 = [[NSMutableArray alloc] initWithObjects:@"学习Java来这里！",@"不会Ps来这里！",@"你知道什么是Python吗？", @"教教你使用Linux好吗？",nil];
    
    for (int i = 1; i < 5; i++) {
        [arr2 addObject:[NSString stringWithFormat:@"banner%d.jpg",i]];
    };
    DCPicScrollView  *picView1 = [DCPicScrollView picScrollViewWithFrame:CGRectMake(0,0,self.view.frame.size.width, 180) WithImageUrls:arr2];
    
    picView1.style = PageControlAtCenter;
    picView1.titleData = arr3;
    
    picView1.backgroundColor = [UIColor clearColor];
    [picView1 setImageViewDidTapAtIndex:^(NSInteger index) {
        printf("你点到我了😳index:%zd\n",index);
    }];
    
    picView1.AutoScrollDelay = 2.0f;
    [headView addSubview:picView1];
    UIButton *btnRank = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRank.frame = CGRectMake(10, 185, 140, 50);
    [btnRank setImage:[UIImage imageNamed:@"rankPng.png"] forState:UIControlStateNormal];
    [headView addSubview:btnRank];
    UIButton *btnAll = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAll.frame = CGRectMake(170, 185, 140, 50);
    [btnAll setImage:[UIImage imageNamed:@"allPng.png"] forState:UIControlStateNormal];
    [headView addSubview:btnAll];
    
    UILabel *headLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 240, 300, 25)];
    headLabel.text = @"热门视频";
    headLabel.textColor = [UIColor grayColor];
    [headView addSubview:headLabel];
    return headView;
}
#pragma mark ----返回区头高度--
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 265;
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
