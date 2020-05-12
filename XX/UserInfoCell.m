//
//  UserInfoCell.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "UserInfoCell.h"
#import "UserInfoCellModel.h"

@interface UserInfoCell()

@property (weak, nonatomic) IBOutlet UIImageView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation UserInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.avatarView.layer.cornerRadius = 12;
}

- (void)bindViewModel:(UserInfoCellModel *)viewModel {
    self.avatarView.backgroundColor = [UIColor purpleColor];
    self.nameLabel.text = viewModel.userName;
}
-(IBAction)clickMore:(id)sender {
    if (self.delegate) {
        [self.delegate cellDidClickMore:self];
    }
}

@end
