//
//  Message.m
//  OSClib
//
//  Created by 余海闯 on 14-10-1.
//  Copyright (c) 2014年 余海闯. All rights reserved.
//

#import "Message.h"
#import "AsyncUdpSocket.h"
#import "OSCConnectionDelegate.h"
#import "OSCConnection.h"
#import "OSCDispatcher.h"
#import "OSCPacket.h"
#import "AppDelegate.h"

@implementation Message
static Message *shareMessage;
@synthesize address=_address;
@synthesize port=_port;
@synthesize IndicatorView;
+(Message*)shareMessage{
    if (shareMessage == nil) {
        shareMessage = [[Message alloc] init];
    }
    return shareMessage;
}
-(void)showIndicatorView{
    if (self.IndicatorView == nil) {
        self.IndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [self.IndicatorView setCenter:CGPointMake(512, 384)];
        [[[AppDelegate sharedAppDelegate] controller].view addSubview:self.IndicatorView];
    }
    [self.IndicatorView startAnimating];
}
-(void)stopIndicatorView{
    [self.IndicatorView stopAnimating];
}
-(void)reConnectTip{
     UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"与中控连接已经断开!" message:nil delegate:self cancelButtonTitle:@"点击重新连接" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}
-(void)releaseMessage{
    [shareMessage release];
    shareMessage = nil;
    
}
-(void)connectTCP{
    [self showIndicatorView];
//    [self reConnectTip];
//    if (connection) {
//        [connection disconnect];
//        connection.delegate = nil;
//        [connection release];
//    }
    connection = [[OSCConnection alloc] init];
    connection.delegate = self;
    connection.continuouslyReceivePackets = YES;
    NSError *error;
    if (![connection connectToHost:self.address port:6000 protocol:OSCConnectionTCP_Int32Header error:&error])
    {
        NSLog(@"Could not bind TCP connection: %@", error);
    }
    
    [connection receivePacket];
}
-(void)connect{
    if (connection) {
        connection.delegate = nil;
        [connection release];
    }
    connection = [[OSCConnection alloc] init];
    connection.delegate = self;
    connection.continuouslyReceivePackets = YES;
    NSError *error;
    if (![connection bindToAddress:nil port:0 error:&error])
    {
        NSLog(@"Could not bind UDP connection: %@", error);
    }
    [connection receivePacket];
}
-(id)initWithAddress:(NSString*)address port:(int)port{
    if ((self = [super init])) {
        self.address = address;
        self.port = port;
        [self connectTCP];
//        [self connect];
    }
    return self;
}
- (void)oscConnection:(OSCConnection *)con didSendPacket:(OSCPacket *)packet;
{
     NSLog(@".....");
    [self stopIndicatorView];
    //    ((UITextField *)[window viewWithTag:kTagLocalPort]).text = [NSString stringWithFormat:@"%hu", con.localPort];
    //    [self.text setText:[NSString stringWithFormat:@"发送包: localport %hu", con.localPort]];
}

- (void)oscConnection:(OSCConnection *)con didReceivePacket:(OSCPacket *)packet fromHost:(NSString *)host port:(UInt16)port
{
    NSLog(@"KKKKK");
    //    ((UITextField *)[window viewWithTag:kTagReceivedValue]).text = [packet.arguments description];
    //    ((UITextField *)[window viewWithTag:kTagLocalAddress]).text = packet.address;
    //    NSLog(@"HHHHJJJJJJ");
    //[self.rectext setText:[NSString stringWithFormat:@"接受包 %@", [packet.arguments description]]];
    
}
//-(void)dealloc{
//    if (connection) {
//        connection.delegate = nil;
//        [connection release];
//    }
//    self.address = nil;
//    [super dealloc];
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)sendMessage:(NSString*)address Int:(int)flag{
    
    if (address==nil) {
        return;
    }
    OSCMutableMessage *message = [[OSCMutableMessage alloc] init];
//    NSString *address =[NSString stringWithFormat:@"/layer1/%@/connect",name];
//    NSString *address =[NSString stringWithFormat:@"/layer1/%@/connect",name];
//    NSLog(@"FFF %@",address);
    message.address = address;
    [message addInt:flag];//@"192.168.0.190"
    [connection sendPacket:message toHost:self.address port:self.port];
    [message release];
}
- (void)oscConnectionDidDisconnect:(OSCConnection *)con{
    
    [self reConnectTip];
//    NSError *error;
//    if (![connection connectToHost:self.address port:6000 protocol:OSCConnectionTCP_Int32Header error:&error])
//    {
//        NSLog(@"Could not bind TCP connection: %@", error);
//    }
}
- (void)oscConnection:(OSCConnection *)connection failedToReceivePacketWithError:(NSError *)error{
    NSLog(@"IIIIIII");
}
-(void)sendMessage:(NSString*)address Float:(float)volume{
    
    if (address==nil) {
        return;
    }
    OSCMutableMessage *message = [[OSCMutableMessage alloc] init];
    //    NSString *address =[NSString stringWithFormat:@"/layer1/%@/connect",name];
    //    NSString *address =[NSString stringWithFormat:@"/layer1/%@/connect",name];
    //    NSLog(@"FFF %@",address);
    message.address = address;
    [message addFloat:volume];//@"192.168.0.190"
//    [connection sendPacket:message toHost:self.address port:self.port];
    [connection sendPacket:message];
    [message release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSError *error = nil;
    if (![connection connectToHost:self.address port:6000 protocol:OSCConnectionTCP_Int32Header error:&error])
    {
        NSLog(@"Could not bind TCP connection: %@", error);
    }
    
}

@end
