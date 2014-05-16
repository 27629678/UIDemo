//
//  Attributor_ViewController.m
//  UIDemo
//
//  Created by H-YXH on 5/15/14.
//  Copyright (c) 2014 NetEase. All rights reserved.
//

#import "Attributor_ViewController.h"

@interface Attributor_ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;
@end

@implementation Attributor_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)changeBodySelectionColorToMatchBackgroundofButton:(id)sender
{
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:((UIButton*)sender).backgroundColor
                                  range:self.body.selectedRange];
}

- (IBAction)outLineBodySelectionButton:(id)sender
{
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName: @-3
                                           , NSStrokeColorAttributeName: [UIColor blackColor]
                                           }
                                   range:self.body.selectedRange];
}

- (IBAction)unOutLineBodySelectionButton:(id)sender
{
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName
                                     range:self.body.selectedRange];
}

- (IBAction)closeViewControllerButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 生命周期
// viewDidLoad方法被调用时，View的几何特性还没有初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.headline setText:@"UITextView Demo"];
    
    NSMutableAttributedString* title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    
    [title setAttributes:@{NSStrokeWidthAttributeName: @3
                          , NSStrokeColorAttributeName: self.outlineButton.tintColor}   // tintColor 全局文字颜色
                   range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

// 这个方法可能会被调用多次
// 初始化用的代码不可以放在该方法内
// 放置的代码最好是用于更新Model的代码进行同步
// 可以做更新View中的几何图形更新操作
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredFontsChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

- (void)preferredFontsChanged:(NSNotification*)notification
{
    [self usePreferredSystemFont];
}

- (void)usePreferredSystemFont
{
    [self.body setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    
    [self.headline setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
    
    // 保存当前场景的状态
//    [self rememberScrollPosition];
    
    // 保存现场数据
//    [self saveDataToPermanentStore];
}

- (void)viewWillLayoutSubviews
{
    
}

- (void)viewDidLayoutSubviews
{
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    // 内存占用大户，如视频、音频、图像等
}

@end
