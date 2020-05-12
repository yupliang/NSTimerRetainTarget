//
//  CommentCellModel.h
//  XX
//
//  Created by Qiqiuzhe on 2020/5/12.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comment.h"
#import <IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentCellModel : NSObject <IGListDiffable>
@property (nonatomic,copy,readonly) NSString *comment;
@property (nonatomic,copy,readonly) NSString *person;
- (instancetype)initWithComment:(Comment *)comment;
@end

NS_ASSUME_NONNULL_END
