//
//  TUInitialQuestionsViewController.h
//  TradeUp
//
//  Created by Michelle Austria on 8/1/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TULoginViewController.h"

@interface TUInitialQuestionsViewController : UIViewController 

@property (strong, nonatomic) NSString *auth_token_question;
@property (strong, nonatomic) NSString *testName;

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;

@property (strong, nonatomic) IBOutlet UIButton *answer1;
@property (strong, nonatomic) IBOutlet UIButton *answer2;
@property (strong, nonatomic) IBOutlet UIButton *answer3;
@property (strong, nonatomic) IBOutlet UIButton *answer4;

@property (strong, nonatomic) NSString *first;
@property (strong, nonatomic) NSString *second;
@property (strong, nonatomic) NSString *third;
@property (strong, nonatomic) NSString *fourth;

- (IBAction)answer1pressed:(UIButton *)sender;
- (IBAction)answer2pressed:(UIButton *)sender;
- (IBAction)answer3pressed:(UIButton *)sender;
- (IBAction)answer4pressed:(UIButton *)sender;

@property (strong, nonatomic) NSMutableArray *answerList;
@property (strong, nonatomic) NSMutableArray *idList;
@property (strong, nonatomic) NSMutableArray *correctBool;

@property (nonatomic) int userChoice;
@property (nonatomic) int correctChoice;

- (void)checkAnswer:(int)user vs:(int)correct;


@end
