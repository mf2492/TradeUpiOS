//
//  TUQuestionsViewController.h
//  TradeUp
//
//  Created by Michelle Austria on 8/1/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TULoginViewController.h"

@interface TUQuestionsViewController : UIViewController {
    TULoginViewController *token;
}

@property (strong, nonatomic) NSString *auth_token_question;
@property (strong, nonatomic) NSString *testName;

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) NSMutableArray *answerList;

@property (strong, nonatomic) IBOutlet UIButton *answer1;
@property (strong, nonatomic) IBOutlet UIButton *answer2;
@property (strong, nonatomic) IBOutlet UIButton *answer3;
@property (strong, nonatomic) IBOutlet UIButton *answer4;




@end
