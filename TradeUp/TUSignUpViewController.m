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
    if ([name length] > 0 && [email length] > 0) {
        if([self passwordConfirmed:password with:confirm]) {
            [self userSignUp:name withEmail:email withPassword:password withConfirmation:confirm];
        };
    } else {
        self.passwordMatch.text = @"All fields required.";
        self.passwordMatch.hidden = NO;
    }
}

-(void)userSignUp:(NSString *)name withEmail:(NSString *)email withPassword:(NSString *)password withConfirmation:(NSString *)confirm {
    //http://localhost:3000/users.json?name=jonton&email=hi@tra22deup.io&password=wowzers&password_confirmation=wowzers&role_ids=2
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://tradeup-staging.herokuapp.com/users.json"]];
    [request setHTTPMethod:@"POST"];
    NSString *post = [NSString stringWithFormat:@"name=%@&email=%@&password=%@&password_confirmation=%@&role_ids=2", name, email, password, confirm];
    NSLog(@"POST: %@",post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
    
    //get response
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Response Code: %d", [urlResponse statusCode]);
    
    if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300)
    {
        NSLog(@"Response: %@", result);
        //ADD CODE TO GO TO SKILLS
    }
    

}



- (BOOL) passwordConfirmed:(NSString *)first with:(NSString *)second {
    if ([first isEqualToString:second] && [self.passwordTextField.text length] > 0) {
        NSLog(@"YES");
        self.passwordMatch.hidden = YES;
        return YES;

    } else {
        NSLog(@"NO");
        self.passwordMatch.hidden = NO;
        
        //Highlights password textfield if incorrect
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
