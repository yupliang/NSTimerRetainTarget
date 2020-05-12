//
//  ImagesCollectionCellModel.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/11.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "ImagesCollectionCellModel.h"
#import "NSArray+FP.h"
#import <UIImage+YYAdd.h>

@implementation ImagesCollectionCellModel

- (instancetype)initWithImages:(NSArray<NSString *> *)urls {
    self = [super init];
    if (self) {
        _images = [urls map:^id _Nonnull(NSString * _Nonnull element) {
            if ([element isEqualToString:@"red"]) {
                return [UIImage imageWithColor:[UIColor redColor]];
            }
            if ([element isEqualToString:@"blue"]) {
                return [UIImage imageWithColor:[UIColor blueColor]];
            }
            if ([element isEqualToString:@"purple"]) {
                return [UIImage imageWithColor:[UIColor purpleColor]];
            }
            if ([element isEqualToString:@"orange"]) {
                return [UIImage imageWithColor:[UIColor orangeColor]];
            }
            if ([element isEqualToString:@"green"]) {
                return [UIImage imageWithColor:[UIColor greenColor]];
            }
            if ([element isEqualToString:@"yellow"]) {
                return [UIImage imageWithColor:[UIColor yellowColor]];
            }
            return [UIImage imageWithColor:[UIColor blackColor]];
        }];
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
