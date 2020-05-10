//
//  FavorSectionController.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "FavorSectionController.h"
#import "FavorCollectionCellModel.h"
#import "FavorCollectionViewCell.h"

@interface FavorSectionController ()

@property (nonatomic,strong) UserInfoCellModel *object;
@property (nonatomic,strong) FavorCollectionCellModel *viewModel;

@end

@implementation FavorSectionController

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 65);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    FavorCollectionViewCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"FavorCollectionViewCell" bundle:nil forSectionController:self atIndex:index];
    [cell bindViewModel:self.viewModel];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _object = object;
    self.viewModel = [[FavorCollectionCellModel alloc] initWithModel:object];
    
}

@end
