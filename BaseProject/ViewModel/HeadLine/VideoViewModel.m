//
//  VideoViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "VideoViewModel.h"

@interface VideoViewModel()

@property(nonatomic,strong)ViedoModel *model;

@end

@implementation VideoViewModel

-(instancetype)initWithRoomID:(NSString *)roomID iszhiBo:(BOOL)zhiBo{
    if (self = [super init]) {
        _roomID = roomID;
        _isZhiBo = zhiBo;
    }
    return self;
}

-(NSString *)getURL{
    if (_isZhiBo) {
        ViedoVideoModel *nowModel = self.model.video;
        return nowModel.videoUrl;
    }else{
        VideoMutilVideoModel *videoURLModel = self.model.mutilVideo[0];
        return videoURLModel.url;
    }
}

-(NSInteger )rowNumber{
    NSArray *arr = self.model.messages;
    return arr.count;
}

-(NSString *)getSectionViewForSection:(NSInteger )section{
    NSArray *arr = self.model.messages;
    VideoMessagesModel *model = arr[section];
    return model.time;
}

-(NSString *)getHeadImagURLForRow:(NSInteger )section{
    NSArray *arr = self.model.messages;
    VideoMessagesModel *model = arr[section];
    VideoMessagesCommentatorModel *comMdeol = model.commentator;
    return comMdeol.imgUrl;;
}
-(NSString *)getTitleForRow:(NSInteger)section{
    NSArray *arr = self.model.messages;
    VideoMessagesModel *model = arr[section];
    VideoMessagesCommentatorModel *comMdeol = model.commentator;
    return comMdeol.name;
}
-(NSString *)getContentForRow:(NSInteger)section{
    NSArray *arr = self.model.messages;
    VideoMessagesModel *model = arr[section];
    VideoMessagesMsgModel *msgModel = model.msg;
    return msgModel.content;;
}

-(NSArray *)contentPictureForSection:(NSInteger )section{
    NSArray *arr = self.model.messages;
    VideoMessagesModel *model = arr[section];
    return model.images;
}

-(NSInteger )cellHeightForSection:(NSInteger)section{
    CGFloat textW = kWindowW - 20;
    NSString *str = [self getContentForRow:section];
    CGFloat textH = [str boundingRectWithSize:CGSizeMake(textW , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil].size.height;
    NSArray *arr = self.model.messages;
    VideoMessagesModel *model = arr[section];
    CGFloat height = 12 + 20 + 10 + textH + 10;
    if (model.images == nil || model.images.count == 0) {
        
    }else{
        height = height + 245 + 15;
    }
//    NSLog(@"section:%ld textH:%lf,height:%lf",section,textH,height);
    return height;
}

-(void)getVideoDataCompleteHandle:(void(^)(NSError *error))complete{
    
    [VideoNetManager getRadioFromRoomID:_roomID completeHandle:^(ViedoModel *model, NSError *error) {
        self.model = model;
            complete(error);
    }];
}

@end
