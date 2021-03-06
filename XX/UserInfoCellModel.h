//
//  UserInfoCellModel.h
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffable.h>
#import "Comment.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserInfoCellModel : NSObject <IGListDiffable>

@property (nonatomic,copy) NSString *feedId;
@property (nonatomic,copy) NSURL *avatar;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSNumber *favor;
@property (nonatomic,assign) BOOL isFavor;
@property (nonatomic,copy) NSArray<NSString *> *images;
@property (nonatomic,copy) NSArray<Comment *> *comments;
@end

NS_ASSUME_NONNULL_END
