//
//  Todo.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Todo : UIViewController <AddProtocol,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UISearchBarDelegate>
@property NSUserDefaults* taskDef;
@property (weak, nonatomic) IBOutlet UITableView *tasksTableView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;

@property  NSMutableArray* taskArr;
@end

NS_ASSUME_NONNULL_END
