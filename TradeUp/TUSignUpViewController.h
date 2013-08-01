//
//  TUSignUpViewController.h
//  TradeUp
//
//  Created by Michelle Austria on 7/31/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface TUSignUpViewController : UIViewController
<UITextFieldDelegate>

- (IBAction)signUpButtonPressed:(UIButton *)sender;

- (BOOL) passwordConfirmed:(NSString *)first with: (NSString *)second;

- (void) userSignUp:(NSString *)name withEmail: (NSString *)email withPassword: (NSString *)password withConfirmation:(NSString *)confirm;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

@property (strong, nonatomic) IBOutlet UILabel *passwordMatch;

@end
