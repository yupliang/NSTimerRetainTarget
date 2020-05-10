//
//  UserInfoCellModel.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "UserInfoCellModel.h"

@implementation UserInfoCellModel

- (nonnull id<NSObject>)diffIdentifier {
    return self.feedId;
}

- (BOOL)isEqualToDiffableObject:(nullable NSObject<IGListDiffable> *)object {
    if (object == self) {
        return YES;
    } else if (![object isKindOfClass:[UserInfoCellModel class]]) {
        return NO;
    } else {
        return [self.userName isEqualToString:[object valueForKey:@"userName"]];
    }
}

@end
