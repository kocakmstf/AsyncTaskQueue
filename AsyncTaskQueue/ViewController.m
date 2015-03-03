//
//  ViewController.m
//  AsyncTaskQueue
//
//  Created by Mustafa on 03/03/15.
//  Copyright (c) 2015 kocakmstf. All rights reserved.
//

#import "ViewController.h"
#import "TaskQueue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [[TaskQueue SharedInstance] AddTask:^{
        [self SendEmail];
    } timeInterval:1];
    [[TaskQueue SharedInstance] AddTask:^{
        [self SendEmail];
    } timeInterval:2];
    [[TaskQueue SharedInstance] AddTask:^{
        [self SendEmail];
    } timeInterval:1];[[TaskQueue SharedInstance] AddTask:^{
        [self SendEmail];
    } timeInterval:1];
    [[TaskQueue SharedInstance] AddTask:^{
        [self SendEmail];
    } timeInterval:1];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)SendEmail{
    NSLog(@"i am working on something interesting on other threat, please go your away");
    sleep(5);
}

@end
