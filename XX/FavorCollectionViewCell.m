//
//  FavorCollectionViewCell.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/10.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "FavorCollectionViewCell.h"
#import "FavorCollectionCellModel.h"

@interface FavorCollectionViewCell ()

@property (weak,nonatomic) IBOutlet UIButton *favorBtn;
@property (weak,nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic,strong) FavorCollectionCellModel *viewModel;

@end

@implementation FavorCollectionViewCell

- (void)dealloc
{
    [self.viewModel removeObserver:self forKeyPath:@"favorNum"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)bindViewModel:(FavorCollectionCellModel *)viewModel {
    self.viewModel = viewModel;
    [self.viewModel addObserver:self forKeyPath:@"favorNum" options:NSKeyValueObservingOptionNew context:nil];
    self.favorBtn.selected = viewModel.isFavor;
    self.nameLabel.text = viewModel.favorNum;
}

- (IBAction)btnDidClick:(UIButton *)sender {
    self.favorBtn.selected = !sender.isSelected;
    self.viewModel.isFavor = self.favorBtn.selected;
    if (self.viewModel.favorBlock) {
        self.viewModel.favorBlock(self.viewModel.isFavor);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"favorNum"]) {
        NSString *favorNum = change[NSKeyValueChangeNewKey];
        self.nameLabel.text = favorNum;
    }
}
@end
