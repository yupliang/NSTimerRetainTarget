//
//  UserInfoCell.h
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UserInfoCell;
@protocol UserInfoCellDelegate <NSObject>

- (void)cellDidClickMore:(UserInfoCell *)cell;

@end

@interface UserInfoCell : UICollectionViewCell <IGListBindable>
@property (nonatomic,weak) id<UserInfoCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
