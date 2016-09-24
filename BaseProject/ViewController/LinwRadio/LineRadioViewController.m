//
//  LineRadioViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LineRadioViewController.h"
#import "LiveRadioViewModel.h"
#import "ScrollDisplayViewController.h"
#import <UIImageView+WebCache.h>
#import "LineCell.h"

@interface LineRadioViewController ()<UITableViewDelegate,UITableViewDataSource,scrollDisplayViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)LiveRadioViewModel *lrVM;
@property(nonatomic,strong)ScrollDisplayViewController *sdVC;

@end

@implementation LineRadioViewController
-(LiveRadioViewModel *)lrVM{
    if (!_lrVM) {
        _lrVM= [[LiveRadioViewModel alloc] initWithType:nil];
    }
    return _lrVM;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
      self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_media_highlight"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    //获取数据
    [self getData];
    
   
}

-(void)getData{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.lrVM refreshDateCompleteHandle:^(NSError *error) {
            [_tableView.header endRefreshing];
            [_tableView reloadData];
            if (error) {
                NSLog(@"error:%@",error);
            }
            //配置表头视图
            [self configTableHeaderView];
        }];
    }];
    [self.tableView.header beginRefreshing];
}

-(void)configTableHeaderView{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 185)];
    _sdVC = [[ScrollDisplayViewController alloc] initWithImgPaths:[self.lrVM getHeadURl]];
    _sdVC.autoCycle = YES;
    _sdVC.canCycle = YES;
    _sdVC.delegate = self;
    _sdVC.detailMessage = [self.lrVM getDetail];
    [self addChildViewController:_sdVC];
    [headView addSubview:_sdVC.view];
    [_sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(headView);
    }];
    self.tableView.tableHeaderView = headView;
}

#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"number:%ld",self.lrVM.getRowNumber);
    return self.lrVM.getRowNumber;
}

#warning 写到这里还有分组头没有写

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
    [cell.backGroundButton sd_setImageWithURL:[NSURL URLWithString:[self.lrVM getImagesForRow:indexPath.row]]];
    cell.titleLabel.text = [self.lrVM getTitleForRow:indexPath.row];
    cell.apartiment.text = [self.lrVM watchingPeopleForRow:indexPath.row];
    BOOL zhibo = [self.lrVM isOnlineForRow:indexPath.row];
    if (zhibo) {
        cell.zhiBoButton.text = @"直播";
        cell.zhiBoButton.backgroundColor = [UIColor redColor];
    }else{
        cell.zhiBoButton.backgroundColor = [UIColor grayColor];
        cell.zhiBoButton.text = @"回顾";
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 55;
}
#pragma mark - scrollDisplayViewControllerDelegate
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController didSelectedIndex:(NSInteger)index{
    NSLog(@"点击了第%ld张图片",index);
}
@end































