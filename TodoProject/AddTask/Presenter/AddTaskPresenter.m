//
//  AddTaskPresenter.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 4/26/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import "AddTaskPresenter.h"
#import "../../Model/Tasks.h"
#import "../View/AddTask.h"
@implementation AddTaskPresenter

@synthesize addTaskView;
@synthesize taskProtocol;

- (void)saveAddingTask:( NSString *)name andDescription:( NSString *)desc andPriority:( NSString *)priority andStatus:( NSString *)status andDate:( NSString *)date {
    Tasks *task = [Tasks new];
    [task setName:name];
    [task setDescription:desc];
    [task setPriority:priority];
    [task setStatus:status];
    [task setDate:date];
    [taskProtocol addTask:task];
    [addTaskView onSuccess];
    
}

- (void)saveEditingTask:(nonnull NSString *)name andDescription:(nonnull NSString *)desc andPriority:(nonnull NSString *)priority andStatus:(nonnull NSString *)status andDate:(nonnull NSString *)date {
    Tasks *task = [Tasks new];
    [task setName:name];
    [task setDescription:desc];
    [task setPriority:priority];
    [task setStatus:status];
    [task setDate:date];
    [taskProtocol editTask:task];
    [addTaskView onSuccess];
    
}










@end
