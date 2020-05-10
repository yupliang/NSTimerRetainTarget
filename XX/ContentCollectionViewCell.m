//
//  ContentCollectionViewCell.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "ContentCollectionViewCell.h"

@interface ContentCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ContentCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)bindViewModel:(NSString *)viewModel {
    self.textLabel.text = viewModel;
}

+ (CGFloat)lineHeight {
    UIFont *font = [UIFont systemFontOfSize:16];
    //TODO: font ascender lineHeight descender
    return font.lineHeight + font.ascender + font.descender;
}

+ (CGFloat)heightWithText:(NSString *)text width:(CGFloat)width {
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize size = CGSizeMake(width - 20, CGFLOAT_MAX);
    //TODO: 动态求文字高度
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return ceil(rect.size.height) + font.ascender + font.descender;
}

@end
