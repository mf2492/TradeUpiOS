//
//  TUSkillsListViewController.h
//  TradeUp
//
//  Created by Michelle Austria on 8/1/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TUSkillsListViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *skillsListTableView;


@property (strong, nonatomic) NSMutableArray *availableSkills;

@end
