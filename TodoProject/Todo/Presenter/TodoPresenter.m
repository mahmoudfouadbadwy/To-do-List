//
//  TodoPresenter.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 5/2/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import "TodoPresenter.h"
#import "../../Model/UserDefaultsStore.h"


@implementation TodoPresenter
{
    UserDefaultsStore* store;
    AppDelegate *appDelegate;
  
}
//MARK: - property
@synthesize addView;
@synthesize detail;
@synthesize todoView;

//MARK: - Init
- (instancetype)init
{
    self = [super init];
    if (self) {
        store = [UserDefaultsStore new];
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        detail = [appDelegate detailView];
        addView =[appDelegate addView];
    }
    return self;
}


//MARK: - Task Logic
- (NSInteger)getTsksCount {
    return [store getTasksNumber];
}

- (nonnull NSMutableArray *)getTasks {
    return [store getTasks];
}

- (void)addTaskToUsersDefaults:(nonnull NSMutableArray *)arr {
    [store addTaskToDefaults:arr];
}

- (void)clearUserDefaults {
    [store clearUserDefaults];
}

- (void)showTaskDetails:(NSInteger) index{
    Tasks* task = [[self getTasks] objectAtIndex:(int)index];
    detail.detailName=task.name;
    detail.detailDescription=task.Description;
    detail.detailPriority=task.priority;
    detail.detailDate=task.date;
    detail.detailStatus=task.status;
    [todoView goToDetailView];
   
}

- (void)addTask{
     addView.todoView = todoView;  // protocol ref .
     addView.flag=0; 
    [todoView goToAddView];
}

- (void)editTask:(NSInteger) index {
    addView.todoView = todoView;  // protocol ref .
    addView.flag=1;
    Tasks* task = [[self getTasks] objectAtIndex:(int)index];
    addView.nameEdit=task.name;
    addView.descriptionEdit=task.Description;
    addView.priorityEdit=task.priority;
    addView.statusEdit=task.status;
    [todoView goToAddView];
}

@end
