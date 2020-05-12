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

NSString *const StackSectionDeleteNotification = @"StackSectionDeleteNotification";

@interface UserInfoSectionController () <UserInfoCellDelegate> {
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
    cell.delegate = self;
    [cell bindViewModel:_object];
    return cell;
}

- (void)cellDidClickMore:(nonnull UserInfoCell *)cell {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"share" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        IGListStackedSectionController *stack = self.collectionContext;
        [[NSNotificationCenter defaultCenter] postNotificationName:StackSectionDeleteNotification object:@(stack.section)];
    }]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self.viewController presentViewController:actionSheet animated:YES completion:nil];
}

@end
