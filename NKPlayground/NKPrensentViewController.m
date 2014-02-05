//
//  NKPrensentViewController.m
//  NKPlayground
//
//  Created by neekey on 14-2-4.
//  Copyright (c) 2014年 neekey. All rights reserved.
//

#import "NKPrensentViewController.h"

@interface NKPrensentViewController ()

@property UIButton* parentToMain;
@property UIButton* parentToSc1;
@property UIViewController* subsequentController1;
@property UIButton* sc1ToSc2;
@property UIButton* backToParent;
@property UIViewController* subsequentController2;
@property UIButton* backToSc1;

@end

@implementation NKPrensentViewController

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

    // parent相关初始化
    self.view = [[UIView alloc] initWithFrame: [[ UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor lightGrayColor];

    _parentToSc1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    [_parentToSc1 setTitle: @"next" forState:UIControlStateNormal];
    [_parentToSc1 setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];

    [_parentToSc1 addGestureRecognizer: [[ UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapActionToSc1:)]];

    _parentToMain = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 200, 50)];
    [_parentToMain setTitle: @"back" forState:UIControlStateNormal];
    [_parentToMain setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];

    [_parentToMain addGestureRecognizer: [[ UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapActionBackToMain:)]];

    [self.view addSubview:_parentToSc1];
    [self.view addSubview:_parentToMain];

    // sc1相关初始化
    _subsequentController1 = [[ UIViewController alloc] init];
    _subsequentController1.view = [[UIView alloc] initWithFrame: [[ UIScreen mainScreen] bounds]];
    _subsequentController1.view.backgroundColor = [UIColor yellowColor];

    _sc1ToSc2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    [_sc1ToSc2 setTitle: @"next" forState:UIControlStateNormal];
    [_sc1ToSc2 setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];

    [_sc1ToSc2 addGestureRecognizer: [[ UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapActionToSc2:)]];

    _backToParent = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 200, 50)];
    [_backToParent setTitle: @"back" forState:UIControlStateNormal];
    [_backToParent setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];

    [_backToParent addGestureRecognizer: [[ UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapActionBackToParent:)]];

    [_subsequentController1.view addSubview:_sc1ToSc2];
    [_subsequentController1.view addSubview:_backToParent];

    // sc2相关初始化
    _subsequentController2 = [[ UIViewController alloc] init];
    _subsequentController2.view = [[UIView alloc] initWithFrame: [[ UIScreen mainScreen] bounds]];
    _subsequentController2.view.backgroundColor = [UIColor greenColor];

    _backToSc1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 200, 50)];
    [_backToSc1 setTitle: @"back" forState:UIControlStateNormal];
    [_backToSc1 setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];

    [_backToSc1 addGestureRecognizer: [[ UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapActionBackToSc1:)]];

    [_subsequentController2.view addSubview:_backToSc1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) buttonTapActionToSc1: (id) sender {
    [self presentViewController:_subsequentController1 animated:YES completion:nil];
}

- (void) buttonTapActionToSc2: (id) sender {
    [_subsequentController1 presentViewController:_subsequentController2 animated:YES completion:nil];
}

- (void) buttonTapActionBackToSc1: (id) sender {
    [_subsequentController2.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) buttonTapActionBackToParent: (id) sender {
    [_subsequentController1.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) buttonTapActionBackToMain: (id) sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
