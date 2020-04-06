//
//  AppDelegate.h
//  IOS-ReadingWritingFiles
//
//  Created by eric on 06/04/2020.
//  Copyright © 2020 SLCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

