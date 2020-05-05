//
//  TodoPresenterProtocol.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 4/26/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Model/Tasks.h"
#import "../AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TodoPresenterProtocol <NSObject>
@property  TasksDetails *detail;
@property  Todo* todoView;
@property  AddTask* addView;
-(void)addTaskToUsersDefaults:(NSMutableArray*) arr;
-(NSInteger)getTsksCount;
-(NSMutableArray*)getTasks;
-(void)clearUserDefaults;
-(void)showTaskDetails:(NSInteger) index;
-(void)addTask;
-(void)editTask:(NSInteger) index;
@end

NS_ASSUME_NONNULL_END
