//
//  Todo.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../TaskProtocol.h"
#import "../TodoViewProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface Todo : UIViewController <TaskProtocol,UIAlertViewDelegate,UISearchBarDelegate,TodoViewProtocol,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray* tasks;
    Tasks *task;
    NSMutableArray *filter;
    BOOL isFiltered;
    NSInteger selectedRow;
    NSInteger deleteFlag;
}

// outlets
@property (weak, nonatomic) IBOutlet UITableView *tasksTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;


@end

NS_ASSUME_NONNULL_END
