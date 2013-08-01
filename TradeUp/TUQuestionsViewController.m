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
    
    NSLog(@"AUTHL %@", self.auth_token_question);
    NSLog(@"NAME: %@", self.testName);
    
    NSString *url = [[[@"http://tradeup-staging.herokuapp.com/api/v1/assessments/" stringByAppendingString:self.testName] stringByAppendingString:@".json?auth_token="] stringByAppendingString:self.auth_token_question];
    
    NSLog(@"URL: %@", url);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:10];
    [request setHTTPMethod: @"GET"];
    
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    //get response
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    NSString *result = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"Response: %@", result);
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
