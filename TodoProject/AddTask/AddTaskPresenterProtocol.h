//
//  AddTaskPresenterProtocol.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 4/26/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddTaskViewProtocol.h"
#import "../TaskProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@protocol AddTaskPresenterProtocol <NSObject>
@property id<TaskProtocol>taskProtocol;
@property id<AddTaskViewProtocol>addTaskView;
-(void)saveAddingTask:(NSString*) name  andDescription:(NSString*) desc andPriority:(NSString*) priority andStatus:(NSString*)status andDate:(NSString*) date;

-(void)saveEditingTask:(NSString*) name  andDescription:(NSString*) desc andPriority:(NSString*) priority andStatus:(NSString*)status andDate:(NSString*) date;

@end

NS_ASSUME_NONNULL_END
