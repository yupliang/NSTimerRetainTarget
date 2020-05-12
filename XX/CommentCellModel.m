//
//  CommentCellModel.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/12.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "CommentCellModel.h"

@interface CommentCellModel ()
@property (nonatomic,copy) NSAttributedString *commentStr;
@end

@implementation CommentCellModel

- (instancetype)initWithComment:(Comment *)comment {
    self = [super init];
    if (self) {
        _person = comment.person;
        _comment = [NSString stringWithFormat:@"回复了:%@", comment.comment];
    }
    return self;
}
- (id<NSObject>)diffIdentifier {
    return @(self.person.hash ^ self.comment.hash);
}
- (BOOL)isEqualToDiffableObject:(NSObject<IGListDiffable> *)object {
    if (self == object) {
        return YES;
    } else if (![object isKindOfClass:[CommentCellModel class]]) {
        return NO;
    } else {
        CommentCellModel *obj = (CommentCellModel *)object;
        return [self.person isEqualToString:obj.person] && [self.person isEqualToString:obj.comment];
    }
}
@end
