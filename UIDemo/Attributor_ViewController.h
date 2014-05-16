//
//  Attributor_ViewController.h
//  UIDemo
//
//  Created by H-YXH on 5/15/14.
//  Copyright (c) 2014 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Attributor_ViewController : UIViewController

@end


/* ******************************************************
    1/生命周期
    Instantiated
    awakeFromNib
    outlets get set
    viewDidLoad
    (when geometry is determined)
        viewWillLayoutSubviews: and viewDidLayoutSubviews:
    viewWillAppear: and viewDidAppear:
        ...
        viewWillLayoutSubviews: and viewDidLayoutSubviews:
        ...
    viewWillDisappear: and viewDidDisappear:
 
    2/广播
    Notifications
    - (void)addObserver:(id)observer        // (you) the object to get notified
               selector:(SEL)methodToInvokeIfSomeingHappens
                   name:(NSString*)name     // name of radio station (a constant some where)
                 object:(id)sender          // whoses changes you interest in (nil is anyone's)
 
    - (void)methodToInvokeIfSomeingHappens:(NSNotification*)notification
    {
        notification.name       // the name passed above
        notification.object     // the object sending you the notification
        notification.userInfo   // infomation about what happened, (ID type)
    }
 
    Be sure to "Turn Out" when done listening
    [center removeObserver:self];
    or
    [center removeObserver:self name: observerName object:nil];
 
    Failure to remove observer may result in crashers.
    This is because the NSNotificationCenter keeps on an "unsafe retained" pointer to you.
 *****************************************************/