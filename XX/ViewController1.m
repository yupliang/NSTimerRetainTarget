//
//  ViewController1.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/4.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "ViewController1.h"
#import <YYFPSLabel.h>
#import <IGListKit.h>
#import "UserInfoSectionController.h"
#import "UserInfoCellModel.h"
#import <MJExtension.h>
#import "ContentSectionController.h"
#import "FavorSectionController.h"
#import "ImageSectionController.h"

typedef void (^TimerHandler) (NSTimer *);

@interface NSTimer (HandleRetainTarget)

@end

@implementation NSTimer(HandleRetainTarget)

+ (NSTimer *)Eoc_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))handler  {
    return [NSTimer scheduledTimerWithTimeInterval:interval target:[self class] selector:@selector(repeatTimer:) userInfo:[handler copy] repeats:YES];
}

+ (void)repeatTimer:(NSTimer *)timer {
    TimerHandler handler = timer.userInfo;
    if (handler) {
        handler(timer);
    }
}

@end

@interface ViewController1 ()<IGListAdapterDataSource> {
    NSTimer *_timer;
    UICollectionView *_collectionView;
    NSMutableArray<id<IGListDiffable>> *_objects;
    IGListAdapter *_adapter;
}

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    if (@available(iOS 13.0, *)) {
        _collectionView.backgroundColor = [UIColor systemGroupedBackgroundColor];
    } else {
        // Fallback on earlier versions
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    [self.view addSubview:_collectionView];
    
    _objects = [NSMutableArray new];
    _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    _adapter.dataSource = self;
    _adapter.collectionView = _collectionView;
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"data1" withExtension:@"json"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    [_objects addObjectsFromArray:[UserInfoCellModel mj_objectArrayWithKeyValuesArray:arr]];
    
    [_adapter reloadDataWithCompletion:^(BOOL finished) {
        NSLog(@"finished %d", finished);
    }];
    
    YYFPSLabel *fpsLabel = [YYFPSLabel new];
    fpsLabel.frame = CGRectMake(self.view.bounds.size.width - 100, self.view.bounds.size.height-110, 60, 30);
    [self.view addSubview:fpsLabel];
    
    __weak typeof (self) weakself = self;
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        __strong typeof(weakself) strongself = weakself;
//        NSLog(@"section count %ld", (long)strongself.collectionView.numberOfSections);
//    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteNoti:) name:StackSectionDeleteNotification object:nil];
}

- (void)deleteNoti:(NSNotification *)noti {
    NSInteger section = [noti.object integerValue];
    [_objects removeObjectAtIndex:section];
    [_adapter performUpdatesAnimated:YES completion:nil];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _collectionView.frame = self.view.bounds;
}

- (void)invokeTimer {
    NSLog(@"%@", self);
}

- (void)dealloc
{
    [_timer invalidate];
    NSLog(@"%s", __FUNCTION__);
}
- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    IGListStackedSectionController *stack = [[IGListStackedSectionController alloc] initWithSectionControllers:@[[UserInfoSectionController new], [ContentSectionController new], [ImageSectionController new],[FavorSectionController new]]];
    stack.inset = UIEdgeInsetsMake(5, 0, 0, 0);
    return stack;
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return _objects;
}



@end
