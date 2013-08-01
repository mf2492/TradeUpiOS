//
//  TUQuestionsViewController.m
//  TradeUp
//
//  Created by Michelle Austria on 8/1/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import "TUQuestionsViewController.h"

@interface TUQuestionsViewController ()

@end

@implementation TUQuestionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *backBtnImage = [UIImage imageNamed:@"backButton"]  ;
        [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
        backBtn.frame = CGRectMake(0, 0, 20, 20);
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn] ;
        self.navigationItem.leftBarButtonItem = backButton;
    }
    return self;
}

- (void)goback
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
