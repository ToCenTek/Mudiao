//
//  RightView.h
//  DYMD
//
//  Created by 余海闯 on 14-10-3.
//  Copyright (c) 2014年 余海闯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
@class MainViewController;
@interface RightView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (nonatomic,assign)NSDictionary *infos;
@property (nonatomic,assign)IBOutlet UITableView *tableview;
@property (nonatomic,assign)MainViewController *controller;
@end
@interface RightViewCell : UITableViewCell
@property (nonatomic,strong)IBOutlet UIImageView *im;
@end
