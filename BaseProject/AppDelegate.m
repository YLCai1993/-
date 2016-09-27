//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "MobClick.h"
#import "AppDelegate+Category.h"
#import "HeadLineViewModel.h"
#import "AdsNetManager.h"
#import "LiveRadioNetManager.h"
#import "VideoNetManager.h"
#import "ClassVideNetManager.h"
#import "Global.h"


#define AppKey @"57e0f5e7e0f55a69b5000273"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*  友盟统计注册  */
    [MobClick startWithAppkey:AppKey reportPolicy:BATCH channelId:nil];
    
//    [NewsNetManager getNewsListForm:NewsListTypeTouTiao fn:1 offset:0 size:30 completeHandle:^(NewsModel *model, NSError *error) {
//       
//        NSLog(@"**");
//    }];
    
//    classIndex = 1;
//    [NewsNetManager getNewsNormalListForm:@"T1348648517839" offset:0 size:20 completeHandle:^(OtherNormalModel *model, NSError *error) {
//        NSArray *array = model.classModel;
//        NSLog(@"count:%ld",array.count);
//        NSLog(@"***");
//    }];
    
    
//    [AdsNetManager getAdsForm:adsStr completeHandle:^(AdsModel *model, NSError *error) {
//        adsClassModel *model1 = model.classModel;
//        NSArray *arr = model1.img;
//        adsClassImgModel *model2 = arr[0];
//        NSLog(@"%@",model2.src);
//        NSLog(@"**");
//    }];
    
//    [AdsNetManager getNormalAdsForm:@"2200005" completeHandle:^(NormalAdsModel *model, NSError *error) {
//        NSLog(@"***");
//    }];
    
//    [NewsNetManager getDetailFromType:@"S1451880983492" completeHandle:^(NewsDetailModel *model, NSError *error) {
//        NSLog(@"***");
//    }];
    
//    [LiveRadioNetManager getRadioListFromType:nil completeHandle:^(HeadRadioModel *model, NSError *error) {
//        NSLog(@"***");
//    }];
//    [self initializeWithApplication:application];
//    [VideoNetManager getRadioFromRoomID:@"97402" completeHandle:^(ViedoModel *model, NSError *error) {
//       
//        NSLog(@"***");
//    }];z
    
    
//    [ClassVideNetManager getClassfiyFormType:nil completeHandle:^(ClassModel *model, NSError *err) {
//       
//        NSLog(@"***");
//    }];
    
//    [ClassVideNetManager getClassItemFromID:4 andPage:1 completeHandle:^(HeadRadioModel *model, NSError *err) {
//       
//        NSLog(@"你好");
//    }];
    
    return YES;
}

@end































