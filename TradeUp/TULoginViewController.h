//
//  TULoginViewController.h
//  TradeUp
//
//  Created by Michelle Austria on 7/31/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TULoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonPressed:(UIButton *)sender;

- (IBAction)createAccountPressed:(UIButton *)sender;

@end
