//
//  CommentCollectionViewCell.h
//  XX
//
//  Created by Qiqiuzhe on 2020/5/12.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListBindable.h>

NS_ASSUME_NONNULL_BEGIN
@class CommentCollectionViewCell;
typedef void (^DeleteAction)(CommentCollectionViewCell *);
@interface CommentCollectionViewCell : UICollectionViewCell <IGListBindable>
@property (nonatomic,copy) DeleteAction deleteAction;
@end

NS_ASSUME_NONNULL_END
