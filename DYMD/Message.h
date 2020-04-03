//
//  Message.h
//  OSClib
//
//  Created by 余海闯 on 14-10-1.
//  Copyright (c) 2014年 余海闯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSCConnectionDelegate.h"

@class OSCConnection;
@interface Message : NSObject<OSCConnectionDelegate,UIAlertViewDelegate>{
    OSCConnection *connection;
 
    
}
@property (nonatomic,retain)UIActivityIndicatorView *IndicatorView;
@property (nonatomic,retain)NSString *address;
@property (nonatomic,assign)int port;
-(id)initWithAddress:(NSString*)address port:(int)port;
+(Message*)shareMessage;
-(void)releaseMessage;
-(void)sendMessage:(NSString*)address Int:(int)flag;
-(void)sendMessage:(NSString*)address Float:(float)volume;
@end
