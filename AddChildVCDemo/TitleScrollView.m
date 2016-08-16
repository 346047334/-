//
//  TitleScrollView.m
//  AddChildVCDemo
//
//  Created by 方常伟 on 16/8/12.
//  Copyright © 2016年 方常伟. All rights reserved.
//

#import "TitleScrollView.h"
#define DEVICEWIDTH [UIScreen mainScreen].bounds.size.width
#define BTNWIDTH 80.0
@interface TitleScrollView()
{
    int _currentIndex;
}
@property (nonatomic,strong)UIScrollView *scrollView;

@end

@implementation TitleScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.headArray = @[@"头条",@"娱乐",@"体育",@"上海",@"美女",@"社会",@"百度"];
        self.showsHorizontalScrollIndicator = NO;
        [self createUI];
    }
    return self;
}
- (void)createUI{
    
    self.backgroundColor = [UIColor redColor];
    self.contentSize = CGSizeMake(BTNWIDTH*self.headArray.count, 0);
    self.bounces = NO;

    [self createBtn];
}

-(void)createBtn{
    

    for (int i = 0; i < [self.headArray count]; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0 + BTNWIDTH*i, 0, BTNWIDTH, 40);
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:[self.headArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        if (i == 0) {
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
        button.tag = i + 100;
        [button addTarget:self action:@selector(didClickHeadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
    }
}
-(void)didClickHeadButtonAction:(UIButton *)btn{
    _currentIndex = (int)btn.tag;
    [self changeBtnTitleColorWith:_currentIndex];
    
    if ([self.seletedDelegate respondsToSelector:@selector(seletedControllerWith:)]) {
        
        [self.seletedDelegate seletedControllerWith:btn];
    }
}
-(void)changeBtnTitleColorWith:(int)tag{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            if (obj.tag == tag) {
                [obj setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
                if (obj.frame.origin.x>=DEVICEWIDTH/2&&obj.frame.origin.x<=self.contentSize.width-DEVICEWIDTH/2) {
                    [UIView animateWithDuration:.5 animations:^{
                        self.contentOffset = CGPointMake(obj.frame.origin.x-DEVICEWIDTH/2+40, 0);
                        obj.titleLabel.font = [UIFont systemFontOfSize:18];
                    }];
                }
                if (obj.frame.origin.x<DEVICEWIDTH/2) {
                    [UIView animateWithDuration:.5 animations:^{
                        self.contentOffset = CGPointMake(0, 0);
                        obj.titleLabel.font = [UIFont systemFontOfSize:18];
                    }];
                }
                
            }else{
                [obj setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                obj.titleLabel.font = [UIFont systemFontOfSize:16];
            }
        }
        
    }];
}


@end
