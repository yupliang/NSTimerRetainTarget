//
//  CommentCollectionViewCell.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/12.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "CommentCollectionViewCell.h"
#import "CommentCellModel.h"


@interface CommentCollectionViewCell ()
@property (nonatomic,weak) IBOutlet UILabel *leftLabel;
@property (nonatomic,weak) IBOutlet UILabel *rightLabel;
@end

@implementation CommentCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)bindViewModel:(CommentCellModel *)viewModel {
    self.leftLabel.text = viewModel.person;
    self.rightLabel.text = viewModel.comment;
}

- (IBAction)onClickDelete:(id)sender {
    if (self.deleteAction) {
        self.deleteAction(self);
    }
}
@end
