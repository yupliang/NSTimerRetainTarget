//
//  AppDelegate.h
//  XX
//
//  Created by Qiqiuzhe on 2020/4/12.
//  Copyright © 2020 ToolMaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;


@end

