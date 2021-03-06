//
//  TopicViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicViewController.h"
#import "ScrollDisplayViewController.h"
#import "QuestionViewController.h"
#import "TopicsViewController.h"
#import "AttentionViewController.h"

@interface TopicViewController ()<scrollDisplayViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@property(nonatomic,strong)ScrollDisplayViewController *sdVC;
@property(nonatomic,strong)QuestionViewController *questionVC;
@property(nonatomic,strong)TopicsViewController *topicsVC;
@property(nonatomic,strong)AttentionViewController *attentionVC;

@end

@implementation TopicViewController

#pragma mark - lazy load
-(QuestionViewController *)questionVC{
    if (!_questionVC) {
        _questionVC = [[QuestionViewController alloc] init];
    }
    return _questionVC;
}

-(TopicsViewController *)topicsVC{
    if (!_topicsVC) {
        _topicsVC = [[TopicsViewController alloc] init];
    }
    return _topicsVC;
}

-(AttentionViewController *)attentionVC{
    if (!_attentionVC) {
        _attentionVC = [[AttentionViewController alloc] init];
    }
    return _attentionVC;
}

-(ScrollDisplayViewController *)sdVC{
    if (!_sdVC) {
        NSArray *controllers = @[self.questionVC,self.topicsVC,self.attentionVC];
        _sdVC = [[ScrollDisplayViewController alloc] initWithViewControllers:controllers];
        _sdVC.autoCycle = NO;
        _sdVC.canCycle = NO;
        _sdVC.delegate = self;
        _sdVC.showPageControl = NO;
    }
    return _sdVC;
}

- (IBAction)changeView:(UISegmentedControl *)sender {
    _sdVC.currentPage = sender.selectedSegmentIndex;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"话题";
    self.segment.layer.cornerRadius = 15;
    
    [self.view addSubview:self.sdVC.view];
    [self.sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}


#pragma mark - scrollDisplayViewControllerDelegate
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController currentIdenx:(NSInteger)index{
    self.segment.selectedSegmentIndex = index;
    self.segment.selected = YES;
    NSLog(@"index:%ld",index);
}

@end

































