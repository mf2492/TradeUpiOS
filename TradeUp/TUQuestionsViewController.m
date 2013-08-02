//
//  TUQuestionsViewController.m
//  TradeUp
//
//  Created by Michelle Austria on 8/1/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import "TUQuestionsViewController.h"
#import "Question.h"

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
    // NSString *result = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    // NSLog(@"Response: %@", result);
    
    NSError *jsonParsingError = nil;
    NSArray *skillSet = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
    //NSDictionary *skills = [skillSet objectAtIndex:0];
    
    
    
    //GET CURRENT QUESTION
    NSString *currentQuestion = [skillSet valueForKeyPath:@"question.prompt"];
    NSLog(@"QUESTION: %@", currentQuestion);
    Question *newQuestion = [[Question alloc]init];
    newQuestion.prompt = currentQuestion;
    self.questionLabel.text = newQuestion.prompt;
    //get question id
    
    
    //GET ANSWER OPTIONS
    self.answerList = [skillSet valueForKeyPath:@"question.answers.answer.answer_text"];
    NSLog(@"ANSWER: %@", self.answerList);
    NSString *answer1 = self.answerList[0];
    NSString *answer2 = self.answerList[1];
    NSString *answer3 = self.answerList[2];
    NSString *answer4 = self.answerList[3];
    
    [self.answer1 setTitle:answer1 forState:UIControlStateNormal];
    [self.answer2 setTitle:answer2 forState:UIControlStateNormal];
    [self.answer3 setTitle:answer3 forState:UIControlStateNormal];
    [self.answer4 setTitle:answer4 forState:UIControlStateNormal];


    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
