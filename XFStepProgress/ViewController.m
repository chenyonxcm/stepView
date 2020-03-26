//
//  ViewController.m
//  XFStepProgress
//
//  Created by weihongfang on 2017/6/27.
//  Copyright © 2017年 weihongfang. All rights reserved.
//

#import "ViewController.h"
#import "XFStepView.h"

@interface ViewController ()

@property (strong, nonatomic)XFStepView *stepView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"这是一个测试用例");
    _stepView = [[XFStepView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 60) Titles:[NSArray arrayWithObjects:@"第一步", @"第二步", @"第三步", nil]];
    _stepView.stepIndex = 3;
    [self.view addSubview:_stepView];
}

- (IBAction)clickPer:(id)sender
{

    int step = _stepView.stepIndex;
    [_stepView setStepIndex:step - 1 Animation:YES];
}

- (IBAction)clickNext:(id)sender
{
    int step = _stepView.stepIndex;
    [_stepView setStepIndex:step + 1 Animation:YES];
}

@end
