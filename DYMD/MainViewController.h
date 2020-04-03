//
//  MainViewController.h
//  DYMD
//
//  Created by 余海闯 on 14-10-1.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "RightView.h"
/// type   computer 开关机 1   prjoect 开关机 2
// 影片播放 3
@class RightView;
@interface MainViewController : UIViewController{
    float volume;
    int   playFlag;
    int   switchFlag;
    int   diannaoType; //默认开启电脑
    
    int   proType;
    int   comType;
    
    int   allSwitch;
    
}

@property (retain, nonatomic) IBOutlet UIButton *compu1;
@property (retain, nonatomic) IBOutlet UIButton *compu2;
@property (retain, nonatomic) IBOutlet UIButton *compu3;

@property (retain, nonatomic) IBOutlet UIButton *pro1;
@property (retain, nonatomic) IBOutlet UIButton *pro2;
@property (retain, nonatomic) IBOutlet UIButton *pro3;
@property (retain, nonatomic) IBOutlet UIButton *pro4;
@property (retain, nonatomic) IBOutlet UIButton *pro5;

@property (retain, nonatomic) IBOutlet UIButton *powerBtn;


@property (nonatomic,retain)IBOutlet UIImageView *tipName;
@property (nonatomic,retain)IBOutlet UIImageView *zhanting;
@property (nonatomic,retain)IBOutlet UIImageView *zhantingMain;
@property (nonatomic,retain)IBOutlet UIImageView *zhanXiangTip;
@property (nonatomic,retain)IBOutlet UIButton *swtichBtn;
@property (nonatomic,retain)IBOutlet UIButton *playBtn;
@property (nonatomic,retain)IBOutlet UIImageView *swtichlab1;
@property (nonatomic,retain)IBOutlet UIImageView *swtichlab2;
@property (nonatomic,retain)IBOutlet UISlider *sliderA;
@property (nonatomic,retain)NSString *TCpaddress;
@property (nonatomic,retain)Message *message;
@property (nonatomic,assign)int type;
@property (nonatomic,assign)int subType;
@property (nonatomic,retain)NSDictionary *dic;
@property (nonatomic,retain)NSDictionary *addressDic;
@property (nonatomic,retain)RightView *rightView;
-(IBAction)changeZhanTing:(UIButton*)sender;
-(IBAction)swtichPress:(UIButton*)sender;
-(IBAction)videoPressed:(UIButton*)sender;
-(IBAction)projectPressed:(UIButton*)sender;
-(IBAction)showLeftView:(UIButton*)sender;
-(IBAction)showRightView:(UIButton*)sender;
-(IBAction)playAction:(UIButton*)sender;
-(void)sendMessage:(int)type;
-(IBAction)compu:(UIButton*)sender;
-(IBAction)pro:(UIButton*)sender;
-(IBAction)Allswitch:(UIButton*)sender;
@end
