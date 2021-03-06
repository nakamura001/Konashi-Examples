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
}

- (void)delayFind
{
    [Konashi find];
}

@end
