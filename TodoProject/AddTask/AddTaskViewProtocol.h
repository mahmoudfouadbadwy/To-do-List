//
//  AddTaskViewProtocol.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 4/26/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Model/Tasks.h"
NS_ASSUME_NONNULL_BEGIN

@protocol AddTaskViewProtocol <NSObject>

-(void)setUpPriorityPicker;
-(void)setUpStatusPicker;
-(void)setUpEditingView;
-(void)setUpAddingView;
-(void)checkEditState;
-(NSMutableDictionary*)getFormData;
-(void)saveAddingTask;
-(void)saveEditingTask;
-(void)onSuccess;

@end

NS_ASSUME_NONNULL_END
