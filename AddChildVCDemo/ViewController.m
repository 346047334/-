//
//  ViewController.m
//  AddChildVCDemo
//
//  Created by 方常伟 on 16/8/12.
//  Copyright © 2016年 方常伟. All rights reserved.
//

#import "ViewController.h"
#import "TitleScrollView.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
#import "ViewController6.h"
#import "ViewController7.h"
#define DEVICEWIDTH [UIScreen mainScreen].bounds.size.width
#define DEVICEHEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UIScrollViewDelegate,seletedControllerDelegate>

@property (nonatomic ,strong) ViewController1  *firstVC;
@property (nonatomic ,strong) ViewController2 *secondVC;
@property (nonatomic ,strong) ViewController3  *thirdVC;
@property (nonatomic ,strong) ViewController4  *fourVC;
@property (nonatomic ,strong) ViewController5  *fiveVC;
@property (nonatomic ,strong) ViewController6  *sixVC;
@property (nonatomic ,strong) ViewController7  *sevenVC;
@property (nonatomic ,strong) TitleScrollView *headerView;
@property (nonatomic ,strong) UIViewController *currentVC;
@property (nonatomic ,strong) UIScrollView *mianScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.headerView = [[TitleScrollView alloc]init];
    self.headerView.seletedDelegate = self;
    self.headerView.frame = CGRectMake(0, 20, DEVICEWIDTH, 44);
    [self.view addSubview:self.headerView];

    self.mianScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, DEVICEWIDTH,DEVICEHEIGHT - 64)];
    self.mianScrollView.delegate = self;
    self.mianScrollView.contentSize = CGSizeMake(DEVICEWIDTH*self.headerView.headArray.count, 0);
    self.mianScrollView.pagingEnabled = YES;
    self.mianScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mianScrollView];
    self.firstVC = [[ViewController1 alloc]init];
    [self addChildViewController:self.firstVC];
    self.firstVC.view.frame = CGRectMake(0, 0, DEVICEWIDTH, DEVICEHEIGHT - 64);
    [self.mianScrollView addSubview:self.firstVC.view];
    
    

}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.x==DEVICEWIDTH) {
        if (self.secondVC == nil) {
            self.secondVC = [[ViewController2 alloc]init];
            [self addChildViewController:self.secondVC];
            self.secondVC.view.frame = CGRectMake(DEVICEWIDTH, 0, DEVICEWIDTH, DEVICEHEIGHT - 64);
            [self.mianScrollView addSubview:self.secondVC.view];
        }
    }else if(scrollView.contentOffset.x==DEVICEWIDTH*2){
        if (self.thirdVC ==nil) {
            self.thirdVC = [[ViewController3 alloc]init];
            [self addChildViewController:self.thirdVC];
            self.thirdVC.view.frame = CGRectMake(DEVICEWIDTH*2, 0, DEVICEWIDTH, DEVICEHEIGHT - 64);
            [self.mianScrollView addSubview:self.thirdVC.view];
        }
        

    }else if(scrollView.contentOffset.x==DEVICEWIDTH*3){
        if (self.fourVC ==nil) {
            self.fourVC = [[ViewController4 alloc]init];
            [self addChildViewController:self.fourVC];
            self.fourVC.view.frame = CGRectMake(DEVICEWIDTH*3, 0, DEVICEWIDTH, DEVICEHEIGHT - 64);
            [self.mianScrollView addSubview:self.fourVC.view];
        }
        
        
    }else if(scrollView.contentOffset.x==DEVICEWIDTH*4){
        if (self.fiveVC ==nil) {
            self.fiveVC = [[ViewController5 alloc]init];
            [self addChildViewController:self.fiveVC];
            self.fiveVC.view.frame = CGRectMake(DEVICEWIDTH*4, 0, DEVICEWIDTH, DEVICEHEIGHT - 64);
            [self.mianScrollView addSubview:self.fiveVC.view];
        }
        
        
    }else if(scrollView.contentOffset.x==DEVICEWIDTH*5){
        if (self.sixVC ==nil) {
            self.sixVC = [[ViewController6 alloc]init];
            [self addChildViewController:self.sixVC];
            self.sixVC.view.frame = CGRectMake(DEVICEWIDTH*5, 0, DEVICEWIDTH, DEVICEHEIGHT - 64);
            [self.mianScrollView addSubview:self.sixVC.view];
        }
        
        
    }else if(scrollView.contentOffset.x==DEVICEWIDTH*6){
        if (self.sevenVC ==nil) {
            self.sevenVC = [[ViewController7 alloc]init];
            [self addChildViewController:self.sevenVC];
            self.sevenVC.view.frame = CGRectMake(DEVICEWIDTH*6, 0, DEVICEWIDTH, DEVICEHEIGHT - 64);
            [self.mianScrollView addSubview:self.sevenVC.view];
        }
        
        
    }
    NSLog(@"%f",scrollView.contentOffset.x);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self.headerView changeBtnTitleColorWith:scrollView.contentOffset.x/DEVICEWIDTH+100];
}
-(void)seletedControllerWith:(UIButton *)btn{
    
    self.mianScrollView.contentOffset = CGPointMake(DEVICEWIDTH*(btn.tag - 100), 0);
}
@end
