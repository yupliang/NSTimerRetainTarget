//
//  ContentCollectionViewCell.h
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContentCollectionViewCell : UICollectionViewCell <IGListBindable>

+ (CGFloat)lineHeight;
+ (CGFloat)heightWithText:(NSString *)text width:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
