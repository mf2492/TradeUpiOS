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
@property (strong, nonatomic) IBOutlet UILabel *credentials;

- (void) postToken:(NSString *)token;

- (IBAction)loginButtonPressed:(UIButton *)sender;

- (IBAction)createAccountPressed:(UIButton *)sender;

- (void)loginUser:(NSString *)email with: (NSString *)password;

@end
