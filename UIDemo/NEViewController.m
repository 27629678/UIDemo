//
//  NEViewController.m
//  UIDemo
//
//  Created by H-YXH on 5/13/14.
//  Copyright (c) 2014 NetEase. All rights reserved.
//

#import "NEViewController.h"
#import "NSAttributedString_ViewController.h"

@interface NEViewController ()
{
    
}

// 实例列表中的元素
@property (nonatomic, retain) NSArray* demos;
@end

@implementation NEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.demos = @[@"NSAttributedString", @"Attributor"];
    [self.demoTableView setDelegate:self];
    [self.demoTableView setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-UITableView Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.demos count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* demoTableViewIdentifier = @"DEMO_TABLE_VIEW_ID";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:demoTableViewIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:demoTableViewIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    [cell.textLabel setText:[self.demos objectAtIndex:row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    NSString* title = [self.demos objectAtIndex:row];
    title = [title stringByAppendingString:@"_ViewController"];
    
    Class MyViewController = NSClassFromString(title);
    
    UIViewController* pushViewController = [[MyViewController alloc] initWithNibName:title
                                                                              bundle:nil];
    
    [self presentViewController:pushViewController
                       animated:YES
                     completion:nil];
    
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}
@end
