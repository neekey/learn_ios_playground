//
//  NKTransitionViewController.m
//  NKPlayground
//
//  Created by neekey on 14-2-4.
//  Copyright (c) 2014年 neekey. All rights reserved.
//

#import "NKTransitionViewController.h"

@interface NKTransitionViewController ()

@property UIViewController* childController1;
@property UIViewController* childController2;
@property UIButton* backToMain;
@property UIButton* next;
@property UIButton* back;

@end

@implementation NKTransitionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.view = [[UIView alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];

    _childController1 = [[UIViewController alloc] init];
    _childController1.view = [[UIView alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    _childController1.view.backgroundColor = [UIColor greenColor];

    // 返回主页面
    _backToMain = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    [_backToMain setTitle:@"back" forState:UIControlStateNormal];
    [_backToMain setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [_backToMain addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(backToMainAction:)]];

    // 返回主页面
    _next = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 200, 50)];
    [_next setTitle:@"next" forState:UIControlStateNormal];
    [_next setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [_next addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(nextControllerAction:)]];

    [_childController1.view addSubview:_backToMain];
    [_childController1.view addSubview:_next];

    _childController2 = [[UIViewController alloc] init];
    _childController2.view = [[UIView alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    _childController2.view.backgroundColor = [UIColor yellowColor];

    // 返回主页面
    _back = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    [_back setTitle:@"back" forState:UIControlStateNormal];
    [_back setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [_back addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(backToFirstController:)]];

    [_childController2.view addSubview:_back];

    [self addChildViewController:_childController1];
    [self addChildViewController:_childController2];

    [self.view addSubview:_childController1.view];
}

- (void)backToFirstController: (id) sender {

    _childController1.view.frame = CGRectMake(-320, 0, 320, 640);

    [self transitionFromViewController:_childController2 toViewController:_childController1 duration: 0.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{

//        _childController2.view.frame = CGRectMake(320, 0, 320, 640);
        _childController2.view.alpha = 0;
        _childController1.view.frame = [[UIScreen mainScreen] bounds];
        _childController1.view.alpha = 1;

    }completion:nil];
}

- (void)nextControllerAction: (id) sender {

    NSLog(@"NEXT");
    _childController2.view.frame = CGRectMake(320, 0, 320, 640);

    [self transitionFromViewController:_childController1 toViewController:_childController2 duration: 0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{

//        _childController1.view.frame = CGRectMake(-320, 0, 320, 640);
        _childController1.view.alpha = 0;
        _childController2.view.frame = [[UIScreen mainScreen] bounds];
        _childController2.view.alpha = 1;

    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"success");
        }
    }];
}

- (void)backToMainAction: (id) sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
