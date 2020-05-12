//
//  ImageCell.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/11.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell ()

@property (nonatomic,weak) IBOutlet UIImageView *imageView;

@end

@implementation ImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)bindViewModel:(UIImage *)viewModel {
    self.imageView.image = viewModel;
}
@end
