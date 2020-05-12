//
//  NSArray+FP.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/11.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "NSArray+FP.h"


@implementation NSArray (FP)

- (NSArray *)map:(id  _Nonnull (NS_NOESCAPE ^)(id _Nonnull))block {
    NSMutableArray *newArray = [NSMutableArray array];
    if (!block) {
        return self;
    }
    for (id element in self) {
        [newArray addObject:block(element)];
    }
    return newArray;
}

@end
