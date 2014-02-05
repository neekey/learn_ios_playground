//
//  NKViewController.m
//  NKPlayground
//
//  Created by neekey on 14-2-3.
//  Copyright (c) 2014年 neekey. All rights reserved.
//

#import "NKViewController.h"
#import "NKPrensentViewController.h"
#import "NKTransitionViewController.h"

@interface NKViewController ()

//@property UIButton* initialButton;
//@property UIButton* bigCanvasButton;
//@property UIButton* smallCanvasButton;
//@property UIButton* smallBackCanvasButton;
//@property UIViewController* anOtherController;
//@property UIViewController* oneController;

@end

@implementation NKViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)buttonTapActionPresent: (id) sender {
    [self presentViewController: [[NKPrensentViewController alloc] init] animated:YES completion:nil];
}

- (void)buttonTapActionTransition: (id) sender {
    [self presentViewController: [[NKTransitionViewController alloc] init] animated:YES completion:nil];

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // present类型
    UIButton* toPresentView = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    [toPresentView setTitle:@"present" forState:UIControlStateNormal];
    [toPresentView setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [toPresentView addGestureRecognizer: [[ UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapActionPresent:)]];

    // transition类型
    UIButton* toTransitionView = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 50)];
    [toTransitionView setTitle:@"transition" forState:UIControlStateNormal];
    [toTransitionView setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [toTransitionView addGestureRecognizer: [[ UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapActionTransition:)]];

    // 加入到视图中
    [self.view addSubview:toPresentView];
    [self.view addSubview:toTransitionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
