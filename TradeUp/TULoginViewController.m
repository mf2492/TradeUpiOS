//
//  TULoginViewController.m
//  TradeUp
//
//  Created by Michelle Austria on 7/31/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import "TULoginViewController.h"
#import "TUSignUpViewController.h"
#import "TUSkillsListViewController.h"

@interface TULoginViewController ()

@end

@implementation TULoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
        backButton.title = @"Cancel";
        self.navigationItem.backBarButtonItem = backButton;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.credentials.hidden = YES;

    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 Hides top navigation bar
 */
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
        
    return YES;
}



- (IBAction)loginButtonPressed:(UIButton *)sender {

    NSString *email = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSLog(@"%@", email);
    NSLog(@"%@", password);
    [self loginUser:email with:password];
    

}

- (IBAction)createAccountPressed:(UIButton *)sender {
    TUSignUpViewController *signUpVC = [[TUSignUpViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:signUpVC animated:YES];
}



- (void)loginUser:(NSString *)email with:(NSString *)password {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://tradeup-staging.herokuapp.com/api/v1/tokens.json"]];
    [request setHTTPMethod:@"POST"];
    NSString *post = [NSString stringWithFormat:@"email=%@&password=%@", email, password];
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


    
    //NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Response Code: %d", [urlResponse statusCode]);
    
    if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300)
    {
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:responseData //1
                              
                              options:kNilOptions
                              error:&error];
        
        NSString* userToken = [json objectForKey:@"token"]; //2
        [self postToken:userToken];

        
        TUSkillsListViewController *skillsVC = [[TUSkillsListViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:skillsVC animated:YES];

    } else {
        self.credentials.hidden = NO;
    }
}

- (void)postToken:(NSString *)token {
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://tradeup-staging.herokuapp.com/"]];
    [request setHTTPMethod:@"POST"];
    NSString *post = [NSString stringWithFormat:@"auth_token=%@", token];
    NSLog(@"POST: %@",post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
    
    //get response
    /*
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Response Code: %d", [urlResponse statusCode]);
    
    if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300)
    {
        NSLog(@"Token: %@", result);
    }
     */
    

}



@end
