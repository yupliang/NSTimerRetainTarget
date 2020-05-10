//
//  FavorCollectionCellModel.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "FavorCollectionCellModel.h"

@interface FavorCollectionCellModel ()



@end

#define GBKeyPath(objc, keyPath) @(((void)objc.keyPath, #keyPath))

@implementation FavorCollectionCellModel

- (instancetype)initWithModel:(UserInfoCellModel *)model {
    self = [super init];
    if (self) {
        _model = model;
        [model addObserver:self forKeyPath:GBKeyPath(model, favor) options:NSKeyValueObservingOptionNew context:nil];
        _isFavor = model.isFavor;
        _favorNum = [NSString stringWithFormat:@"%ld个👍", model.favor.unsignedIntegerValue];
        id obj1 =  @(((void)self.model.favor, "favor"));
        NSLog(@"");
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:GBKeyPath(self.model, favor)]) {
        NSNumber *favor = change[NSKeyValueChangeNewKey];
        self.favorNum = [NSString stringWithFormat:@"%ld个👍", favor.unsignedIntegerValue];
    }
}

- (nonnull id<NSObject>)diffIdentifier { 
    return self.model.feedId;
}

- (BOOL)isEqualToDiffableObject:(nullable NSObject<IGListDiffable> *)object {
    if (object == self) {
        return YES;
    } else if (![object isKindOfClass:[FavorCollectionCellModel class]]) {
        return NO;
    } else {
        FavorCollectionCellModel *obj = (FavorCollectionCellModel *)object;
        return (self.isFavor == obj.isFavor) && [self.favorNum isEqualToString:obj.favorNum];
    }
}

- (void)dealloc
{
    [self.model removeObserver:self forKeyPath:@(((void)self.model.favor, "favor"))];
}

@end
