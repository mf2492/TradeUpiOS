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
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://tradeup-staging.herokuapp.com/api/v1/assessments/:assessment-name.json"]];
    [request setHTTPMethod:@"POST"];
    /*
    NSString *post = [NSString stringWithFormat:@"auth_token=%@", ]];
    NSLog(@"POST: %@",post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
    
    //get response
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Response Code: %d", [urlResponse statusCode]);
    
    if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300)
    {
        NSLog(@"Response: %@", result);
        
    }
*/
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
