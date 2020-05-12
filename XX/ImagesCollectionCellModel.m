//
//  ImagesCollectionCellModel.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/11.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "ImagesCollectionCellModel.h"

@implementation ImagesCollectionCellModel

- (instancetype)initWithImages:(NSArray<NSString *> *)urls {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable NSObject<IGListDiffable> *)object {
    if (object == self) {
        return YES;
    } else if (![object isKindOfClass:[self class]]){
        return NO;
    } else {
        return [self.images isEqualToArray:((typeof(self))object).images];
    }
}

@end
