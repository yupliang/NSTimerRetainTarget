//
//  ViewController1.m
//  XX
//
//  Created by Qiqiuzhe on 2020/5/4.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "ViewController1.h"

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

@interface ViewController1 () {
    NSTimer *_timer;
}

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof (self) weakself = self;
    _timer = [NSTimer Eoc_timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer *timer) {
        [weakself invokeTimer];
    }];
}

- (void)invokeTimer {
    NSLog(@"%@", self);
}

- (void)dealloc
{
    [_timer invalidate];
    NSLog(@"%s", __FUNCTION__);
}
@end
