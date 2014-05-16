//
//  NEViewController.h
//  UIDemo
//
//  Created by H-YXH on 5/13/14.
//  Copyright (c) 2014 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView* demoTableView;
@end
