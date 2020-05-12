//
//  NSArray+FP.h
//  XX
//
//  Created by Qiqiuzhe on 2020/5/11.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (FP)

- (NSArray *)map: (id (NS_NOESCAPE ^)(ObjectType element))block;

@end

NS_ASSUME_NONNULL_END
