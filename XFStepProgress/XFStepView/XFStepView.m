//
//  XFStepView.m
//  SCPay
//
//  Created by weihongfang on 2017/6/26.
//  Copyright © 2017年 weihongfang. All rights reserved.
//

#import "XFStepView.h"

@interface XFStepView()

@property (nonatomic, strong)UIView *lineUndo;// 进度条已填充
@property (nonatomic, strong)UIView *lineDone;// 已填充进度条

@property (nonatomic, retain)NSMutableArray *cricleMarks;// 装载圆圈
@property (nonatomic, retain)NSMutableArray *titleLabels;// 装载标签

@end

@implementation XFStepView

- (NSMutableArray *)cricleMarks {
    if (!_cricleMarks) {
        _cricleMarks = [[NSMutableArray alloc] init];
    }
    return _cricleMarks;
}

- (NSMutableArray *)titleLabels {
    if (!_titleLabels) {
        _titleLabels = [[NSMutableArray alloc] init];
    }
    return _titleLabels;
}

- (instancetype)initWithFrame:(CGRect)frame Titles:(nonnull NSArray *)titles {
    if ([super initWithFrame:frame]) {
        _titles = titles;
        
        _lineUndo = [[UIView alloc]init];
        _lineUndo.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_lineUndo];
        
        _lineDone = [[UIView alloc]init];
        _lineDone.backgroundColor = TINTCOLOR;
        [self addSubview:_lineDone];
        
        for (NSString *title in _titles) {
            UILabel *lbl = [[UILabel alloc]init];
            lbl.text = title;
            lbl.textColor = [UIColor lightGrayColor];
            lbl.font = [UIFont systemFontOfSize:14];
            lbl.textAlignment = NSTextAlignmentCenter;
            [self addSubview:lbl];
            [self.titleLabels addObject:lbl];
            
            UIView *cricle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 13, 13)];
            cricle.backgroundColor = [UIColor lightGrayColor];
            cricle.layer.cornerRadius = 13.f / 2;
            [self addSubview:cricle];
            [self.cricleMarks addObject:cricle];
        }
    }
    return self;
}

#pragma mark - method
- (void)layoutSubviews {
    
    NSInteger perWidth = self.frame.size.width / self.titles.count;
    
    _lineUndo.frame = CGRectMake(0, 0, self.frame.size.width - perWidth, 3);
    _lineUndo.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 4);
    
    CGFloat startX = _lineUndo.frame.origin.x;
    
    for (int i = 0; i < _titles.count; i++) {
        UIView *cricle = [_cricleMarks objectAtIndex:i];
        if (cricle != nil) {
            cricle.center = CGPointMake(i * perWidth + startX, _lineUndo.center.y);
        }
        
        UILabel *lbl = [_titleLabels objectAtIndex:i];
        if (lbl != nil) {
            lbl.frame = CGRectMake(perWidth * i, self.frame.size.height / 2, self.frame.size.width / _titles.count, self.frame.size.height / 2);
        }
    }
    
    self.stepIndex = _stepIndex;
}

#pragma mark - public method
- (void)setStepIndex:(NSInteger)stepIndex {
    if (stepIndex >= 0 && stepIndex <= self.titles.count) {
        _stepIndex = stepIndex;
        // 计算量
        NSInteger count = _stepIndex;
        if (count>= self.titles.count) {
            count = self.titles.count-1;
        }
        CGFloat perWidth = self.frame.size.width / _titles.count;
        
        _lineDone.frame = CGRectMake(_lineUndo.frame.origin.x, _lineUndo.frame.origin.y, perWidth * count, _lineUndo.frame.size.height);
        
        for (int i = 0; i < _titles.count; i++) {
            UIView *cricle = [_cricleMarks objectAtIndex:i];
            if (cricle != nil) {
                if (i < _stepIndex) {
                    cricle.backgroundColor = TINTCOLOR;
                } else {
                    cricle.backgroundColor = [UIColor lightGrayColor];
                }
            }
            
            UILabel *lbl = [_titleLabels objectAtIndex:i];
            if (lbl != nil) {
                if (i < stepIndex) {
                    lbl.textColor = TINTCOLOR;
                } else {
                    lbl.textColor = [UIColor lightGrayColor];
                }
            }
        }
    }
}

- (void)setStepIndex:(int)stepIndex Animation:(BOOL)animation {
    if (stepIndex >= 0 && stepIndex < self.titles.count) {
        if (animation) {
            [UIView animateWithDuration:0.5 animations:^{
                self.stepIndex = stepIndex;
            }];
        } else {
            self.stepIndex = stepIndex;
        }
    }
}
@end
