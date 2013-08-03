//
//  TUInitialQuestionsViewController.m
//  TradeUp
//
//  Created by Michelle Austria on 8/1/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import "TUInitialQuestionsViewController.h"
#import "Question.h"
#import "TUAnswersViewController.h"

@interface TUInitialQuestionsViewController ()

@end

@implementation TUInitialQuestionsViewController


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

    self.answer1.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.answer2.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.answer3.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.answer4.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    
    //GET IDS
    self.idList = [skillSet valueForKeyPath:@"question.answers.answer.id"];
    NSLog(@"ID: %@", self.idList);
    

    
    //GET CORRECT OPTIONS
    self.correctBool = [skillSet valueForKeyPath:@"question.answers.answer.is_correct"]; 
    NSLog(@"CORRECT?: %@", self.correctBool);
    for (int i = 0; i < self.correctBool.count; i++) {
        if ([[self.correctBool objectAtIndex:i] integerValue] == 1) {
            NSLog(@"CORRECT CHOICE: %d", i);
            self.correctChoice = i;
        }
    }
}


-(void)checkAnswer:(int)user vs:(int)correct {
    TUAnswersViewController *answersVC = [[TUAnswersViewController alloc] initWithNibName:nil bundle:nil];
    
    if (self.userChoice == self.correctChoice) {
        answersVC.isCorrect = YES;
    } else{
        answersVC.isCorrect = NO;
    }
    
    answersVC.auth = self.auth_token_question;
    answersVC.testName = self.testName;
    answersVC.answer1 = self.answer1.titleLabel;
    
    
    
    [self.navigationController pushViewController:answersVC animated:NO];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)answer1pressed:(UIButton *)sender {
    self.userChoice = 0;
    [self checkAnswer:self.userChoice vs:self.correctChoice];
}

- (IBAction)answer2pressed:(UIButton *)sender {
    self.userChoice = 1;
    [self checkAnswer:self.userChoice vs:self.correctChoice];

}

- (IBAction)answer3pressed:(UIButton *)sender {
    self.userChoice = 2;
    [self checkAnswer:self.userChoice vs:self.correctChoice];

}

- (IBAction)answer4pressed:(UIButton *)sender {
    self.userChoice = 3;
    [self checkAnswer:self.userChoice vs:self.correctChoice];
}




@end
