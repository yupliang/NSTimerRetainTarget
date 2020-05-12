//
//  ImagesCollectionViewCell.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/11.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "ImagesCollectionViewCell.h"
#import "ImageCell.h"
#import "ImagesCollectionCellModel.h"

@interface ImagesCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) ImagesCollectionCellModel *viewModel;

@end

@implementation ImagesCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.collectionView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:@"ImageCell"];
}

- (void)bindViewModel:(ImagesCollectionCellModel *)viewModel {
    self.viewModel = viewModel;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.images[indexPath.row]];
    return cell;
}

@end
