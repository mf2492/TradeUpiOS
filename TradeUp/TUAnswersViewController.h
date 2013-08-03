//
//  TUAnswersViewController.h
//  TradeUp
//
//  Created by Michelle Austria on 8/2/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TUAnswersViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *buttonColor;

@property (nonatomic) BOOL isCorrect;

@property (strong, nonatomic) NSString *auth;
@property (strong, nonatomic) NSString *testName;

@property (strong, nonatomic) IBOutlet UILabel *result;


- (IBAction)swipeNext:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;

@property (strong, nonatomic) NSString *answer1;
@property (strong, nonatomic) NSString *answer2;
@property (strong, nonatomic) NSString *answer3;
@property (strong, nonatomic) NSString *answer4;

@end
