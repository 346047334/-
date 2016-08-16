//
//  TitleScrollView.h
//  AddChildVCDemo
//
//  Created by 方常伟 on 16/8/12.
//  Copyright © 2016年 方常伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol seletedControllerDelegate <NSObject>

-(void)seletedControllerWith:(UIButton *)btn;

@end

@interface TitleScrollView : UIScrollView
@property (nonatomic ,strong)NSArray *headArray;
@property (nonatomic ,weak)id<seletedControllerDelegate> seletedDelegate;
-(void)changeBtnTitleColorWith:(int)tag;
@end
