//
//  XFStepView.h
//  SCPay
//
//  Created by weihongfang on 2017/6/26.
//  Copyright © 2017年 weihongfang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TINTCOLOR [UIColor colorWithRed:35/255.f green:135/255.f blue:255/255.f alpha:1]

@interface XFStepView : UIView

@property (nonatomic, retain)NSArray * _Nonnull titles;

@property (nonatomic, assign)NSInteger stepIndex;

- (instancetype _Nonnull )initWithFrame:(CGRect)frame Titles:(nonnull NSArray *)titles;

- (void)setStepIndex:(NSInteger)stepIndex Animation:(BOOL)animation;

@end
