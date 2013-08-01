//
//  TUSkillsListViewController.m
//  TradeUp
//
//  Created by Michelle Austria on 8/1/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import "TUSkillsListViewController.h"
#import "Skills.h"
#import "TUQuestionsViewController.h"

@interface TUSkillsListViewController ()

@end

@implementation TUSkillsListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBar.topItem.hidesBackButton = YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"banner"] forBarMetrics:UIBarMetricsDefault];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.skillsListTableView.delegate = self;
    self.skillsListTableView.dataSource = self;
    
    if (!self.availableSkills){
        self.availableSkills = [[NSMutableArray alloc] init];
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://tradeup-staging.herokuapp.com/api/v1/skills.json"]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:10];
    [request setHTTPMethod: @"GET"];
    
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    //get response
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    // NSString *result = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    // NSLog(@"Response: %@", result);
    
    NSError *jsonParsingError = nil;
    NSArray *skillSet = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
    NSDictionary *skills;
    
    for (int i = 0; i <[skillSet count]; i++) {
        skills = [skillSet objectAtIndex:i];
        NSString *categoryString=[[skillSet valueForKeyPath:@"skill"][i] objectForKey:@"assessment"];
        
        if (![categoryString isEqual:[NSNull null]]) {
            //NSLog(@"%@", categoryString);
            NSString *descriptiveTestName = [[skillSet valueForKeyPath:@"skill"][i] objectForKey:@"name"];
            NSString *descriptiveTestID = [[skillSet valueForKeyPath:@"skill"][i] objectForKey:@"id"];

            NSString *assessmentName = [categoryString valueForKey:@"name"];
            assessmentName = [assessmentName stringByReplacingOccurrencesOfString:@" " withString:@"-"];
            NSString *assessmentID = [categoryString valueForKey:@"id"];
            
            Skills *skillObject = [[Skills alloc] init];
            //NSLog(@"NAME %@", testName);
            skillObject.name = assessmentName;
            skillObject.id_num = assessmentID;
            skillObject.tableViewName = descriptiveTestName;
            skillObject.tableViewIDName = descriptiveTestID;

            [self.availableSkills addObject:skillObject];
        }
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.availableSkills.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    Skills *skill_set =[self.availableSkills objectAtIndex:indexPath.row];
    cell.textLabel.text = skill_set.name;
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = selectedCell.textLabel.text;    
    TUQuestionsViewController *questionsVC = [[TUQuestionsViewController alloc] initWithNibName:nil bundle:nil];
    questionsVC.auth_token_question = self.auth_token;
    questionsVC.testName = cellText;
    [self.navigationController pushViewController:questionsVC animated:YES];
    
}

@end
