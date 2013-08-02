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

@end
