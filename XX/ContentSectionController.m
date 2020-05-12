//
//  ContentSectionController.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "ContentSectionController.h"
#import "UserInfoCellModel.h"
#import "ContentCollectionViewCell.h"

@interface ContentSectionController ()

@property (nonatomic,strong) UserInfoCellModel *data;
@property (nonatomic,assign) BOOL expand;

@end

@implementation ContentSectionController

- (void)didUpdateToObject:(id)object {
    _data = object;
}

- (NSInteger)numberOfItems {
    if (!_data.content) {
        return 0;
    }
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat containerWidth = self.collectionContext.containerSize.width;
    CGFloat height = _expand ? [ContentCollectionViewCell heightWithText:_data.content width:containerWidth] : [ContentCollectionViewCell lineHeight];
    return CGSizeMake(containerWidth, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    ContentCollectionViewCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"ContentCollectionViewCell" bundle:nil forSectionController:self atIndex:index];
    [cell bindViewModel:_data.content];
    return cell;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    _expand = !_expand;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.collectionContext invalidateLayoutForSectionController:self completion:nil];
    } completion:nil];
}

@end
