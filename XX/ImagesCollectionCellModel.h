//
//  ImagesCollectionCellModel.h
//  XX
//
//  Created by Qiqiuzhe on 2020/5/11.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>
#import <IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImagesCollectionCellModel : NSObject <IGListDiffable>

@property (nonatomic,copy) NSArray<UIImage *> *images;
- (instancetype)initWithImages:(NSArray<NSString *> *)urls;

@end

NS_ASSUME_NONNULL_END
