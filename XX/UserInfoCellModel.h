//
//  UserInfoCellModel.h
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoCellModel : NSObject <IGListDiffable>

@property (nonatomic,copy) NSString *feedId;
@property (nonatomic,copy) NSURL *avatar;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *content;

@end

NS_ASSUME_NONNULL_END
