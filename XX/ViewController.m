//
//  ViewController.m
//  XX
//
//  Created by Qiqiuzhe on 2020/4/12.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"

@interface ViewController ()

@end

@implementation ViewController



- (IBAction)click:(id)sender {
    ViewController1 *vc1 = [[ViewController1 alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc1 animated:YES];
}

@end

