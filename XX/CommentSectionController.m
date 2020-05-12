//
//  CommentSectionController.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/12.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "CommentSectionController.h"
#import "UserInfoCellModel.h"
#import "CommentCellModel.h"
#import "NSArray+FP.h"
#import "CommentCollectionViewCell.h"

@interface CommentSectionController ()
@property (nonatomic,strong) UserInfoCellModel *object;
@property (nonatomic,strong) NSArray<CommentCellModel *> *viewModels;
@end

@implementation CommentSectionController

- (NSInteger)numberOfItems {
    return self.viewModels.count;
}

- (void)didUpdateToObject:(id)object {
    self.object = object;
    self.viewModels = [self.object.comments map:^id _Nonnull(Comment * _Nonnull element) {
        CommentCellModel *cellModel = [[CommentCellModel alloc] initWithComment:element];
        return cellModel;
    }];
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 44);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    CommentCollectionViewCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"CommentCollectionViewCell" bundle:nil forSectionController:self atIndex:index];
    [cell bindViewModel:self.viewModels[index]];
    return cell;
}
@end
