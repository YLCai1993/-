//
//  AdsViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "AdsNetManager.h"

@interface AdsViewModel : BaseViewModel

@property(nonatomic,strong)adsClassModel *model;
@property(nonatomic,strong)NormalAdsModel *normalModel;

-(instancetype)initWithType:(NSString *)type andTag:(NSString *)tag;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *tag;

-(void)getAdsModelCompleteHandle:(void(^)(NSError *))complete;
-(NSArray *)getImages;
-(NSString *)getTitle;
-(NSArray *)getDetail;
-(NSInteger )getImageCount;
-(NSString *)getSourceAndTime;

@end
