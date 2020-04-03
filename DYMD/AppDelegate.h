//
//  AppDelegate.h
//  OSCTest
//
//  Created by jhy on 14-9-12.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MainViewController *controller;    
}
@property (nonatomic,retain)NSDictionary *videoConfigure;
@property (strong, nonatomic) UIWindow *window;
-(MainViewController*)controller;
+(AppDelegate*)sharedAppDelegate;
-(void)AudioStop;
-(void)AudioPlay;
@end
