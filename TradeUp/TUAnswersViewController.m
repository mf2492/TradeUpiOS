//
//  TUAnswersViewController.m
//  TradeUp
//
//  Created by Michelle Austria on 8/2/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import "TUAnswersViewController.h"
#import "TUInitialQuestionsViewController.h"



@interface TUAnswersViewController ()

@end

@implementation TUAnswersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBar.topItem.hidesBackButton = YES;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (self.isCorrect) {
        [self.buttonColor setBackgroundColor:[UIColor colorWithRed:(19/255.0) green:(142/255.0) blue:(45/255.0) alpha:1]];
        [self.result setText:@"Correct!"];
    } else {
        [self.buttonColor setBackgroundColor:[UIColor grayColor]];
        [self.result setText:@"Wrong"];
    }
    
    NSLog(@"%@", self.testName);
    NSLog(@"%@", self.auth);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeNext:(UIButton *)sender {
    TUInitialQuestionsViewController *questionVC = [[TUInitialQuestionsViewController alloc] initWithNibName:nil bundle:nil];

    
    NSLog(@"HERE");
    questionVC.auth_token_question = self.auth;
    questionVC.testName = self.testName;
    
    NSLog(@"%@",questionVC.auth_token_question);
    NSLog(@"%@",questionVC.testName);

    
    [self.navigationController pushViewController:questionVC animated:YES];
    

    
    
}
@end
