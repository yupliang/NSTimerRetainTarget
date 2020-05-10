//
//  FavorCollectionCellModel.h
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffable.h>
#import "UserInfoCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavorCollectionCellModel : NSObject <IGListDiffable>

@property (nonatomic,assign) BOOL isFavor;
@property (nonatomic,copy) NSString *favorNum;
@property (nonatomic,strong,readonly) UserInfoCellModel *model;

- (instancetype)initWithModel:(UserInfoCellModel *)model;

@end

NS_ASSUME_NONNULL_END
