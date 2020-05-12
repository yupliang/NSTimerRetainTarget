//
//  ImageSectionController.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/12.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "ImageSectionController.h"
#import "UserInfoCellModel.h"
#import "ImagesCollectionViewCell.h"
#import "ImagesCollectionCellModel.h"

const int kInsetLeft = 10;

@interface ImageSectionController ()

@property (nonatomic,strong) UserInfoCellModel *object;
@property(nonatomic,strong) ImagesCollectionCellModel *model;

@end

@implementation ImageSectionController
- (NSInteger)numberOfItems {
    if (!_object.images || _object.images.count == 0) {
        return 0;
    }
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = (self.collectionContext.containerSize.width - kInsetLeft*4.0f) / 3.f;
    CGFloat height = (_object.images.count - 1) / 3 * (width+kInsetLeft) + width;
    return CGSizeMake(self.collectionContext.containerSize.width, height);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    ImagesCollectionViewCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"ImagesCollectionViewCell" bundle:nil forSectionController:self atIndex:index];
    [cell bindViewModel:_model];
    return cell;
}

-(void)didUpdateToObject:(id)object{
    _object = object;
    _model = [[ImagesCollectionCellModel alloc] initWithImages:_object.images];
}

@end
