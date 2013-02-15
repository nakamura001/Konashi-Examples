//
//  ViewController.m
//  KonashiExample
//
//  Created by takashi nakamura on 2013/02/15.
//  Copyright (c) 2013年 takashi nakamura. All rights reserved.
//

#import "ViewController.h"
#import "Konashi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [Konashi initialize];
    
    [Konashi addObserver:self selector:@selector(ready) name:KONASHI_EVENT_READY];
    
    [self performSelector:@selector(delayFind) withObject:nil afterDelay:0.1f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ready
{
    [Konashi pinMode:LED2 mode:OUTPUT];
    [Konashi digitalWrite:LED2 value:HIGH];
    [self performSelector:@selector(action1) withObject:nil afterDelay:0.5f];
}

- (void)delayFind
{
    [Konashi find];
}

- (void)action1 {
    [Konashi digitalWrite:LED2 value:LOW];
    [self performSelector:@selector(action2) withObject:nil afterDelay:0.5f];
}

- (void)action2 {
    [Konashi digitalWrite:LED2 value:HIGH];
    [self performSelector:@selector(action1) withObject:nil afterDelay:0.5f];
}

@end
