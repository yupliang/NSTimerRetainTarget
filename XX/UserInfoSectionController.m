//
//  UserInfoSectionController.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "UserInfoSectionController.h"
#import "UserInfoCell.h"
#import "UserInfoCellModel.h"

@interface UserInfoSectionController () {
    UserInfoCellModel *_object;
}

@end

@implementation UserInfoSectionController

- (void)didUpdateToObject:(id)object {
    _object = object;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 25);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UserInfoCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"UserInfoCell" bundle:nil forSectionController:self atIndex:index];
    [cell bindViewModel:_object];
    return cell;
}

@end
