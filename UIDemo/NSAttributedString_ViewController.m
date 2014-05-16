//
//  NSAttributedString_ViewController.m
//  UIDemo
//
//  Created by H-YXH on 5/15/14.
//  Copyright (c) 2014 NetEase. All rights reserved.
//

#import "NSAttributedString_ViewController.h"
#import <CoreText/CoreText.h>

@interface NSAttributedString_ViewController ()

@end

@implementation NSAttributedString_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CATextLayer* textLayer = [CATextLayer layer];
    [textLayer setString:[self getAttributedString]];
//    [textLayer setString:@"hello"];
    [textLayer setFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame) - 20, 200, 200)];
    [self.view.layer addSublayer:textLayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeViewButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSAttributedString*)getAttributedString
{
    NSMutableAttributedString* attriString = [[NSMutableAttributedString alloc] initWithString:@"Green Red Blue"];
//    [attriString addAttribute:NSForegroundColorAttributeName
//                        value:[UIColor redColor]
//                        range:NSMakeRange(0, 5)];
    
    return attriString;
}
@end
