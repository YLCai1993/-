//
//  BaseNetManager.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, NewsListType) {
    NewsListTypeTouTiao,   //头条
    NewsListTypeJingxuan,  //精选
    NewsListTypeYuLe,      //娱乐
    NewsListTypeTiYu,      //体育
    NewsListTypeWangYiHao, //网易号
    NewsListTypeMaAnShan,  //马鞍山
    NewsListTypeShiPing,   //视频
    NewsListTypeCaiJing,   //财经
    NewsListTypeKeJi,      //科技
    NewsListTypeQiChe,     //汽车
    NewsListTypeShiShang,  //时尚
    NewsListTypeTuPian,    //图片
    NewsListTypeZhiBo,     //直播
    NewsListTypeReDian,    //热点
};
@interface BaseNetManager : NSObject

+ (id)Get:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

@end
