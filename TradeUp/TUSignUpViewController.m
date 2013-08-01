//
//  TUSignUpViewController.m
//  TradeUp
//
//  Created by Michelle Austria on 7/31/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import "TUSignUpViewController.h"

@interface TUSignUpViewController ()

@end

@implementation TUSignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nameTextField.delegate = self;
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.confirmPasswordTextField.delegate = self;
    self.passwordMatch.hidden = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.confirmPasswordTextField resignFirstResponder];  
    return YES;
}


- (IBAction)signUpButtonPressed:(UIButton *)sender {
    NSString *name = self.nameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *confirm = self.confirmPasswordTextField.text;
    
    NSLog(@"%@\n%@\n%@\n%@", name, email, password, confirm);
    [self passwordConfirmed:password with:confirm];
}

- (BOOL) passwordConfirmed:(NSString *)first with:(NSString *)second {
    if ([first isEqualToString:second]) {
        NSLog(@"YES");
        self.passwordMatch.hidden = YES;
        return YES;

    } else {
        NSLog(@"NO");
        self.passwordMatch.hidden = NO;
        self.passwordTextField.layer.borderColor=[[UIColor colorWithRed:199.0f/255.0f green:68.0f/255.0f blue:48.0f/255.0f alpha:1.0] CGColor];
        self.passwordTextField.layer.borderWidth=2.0;
        self.passwordTextField.layer.cornerRadius = 8;
        self.confirmPasswordTextField.layer.borderColor=[[UIColor colorWithRed:199.0f/255.0f green:68.0f/255.0f blue:48.0f/255.0f alpha:1.0] CGColor];
        self.confirmPasswordTextField.layer.borderWidth=2.0;
        self.confirmPasswordTextField.layer.cornerRadius = 8;
        return NO;
    }
}

@end
