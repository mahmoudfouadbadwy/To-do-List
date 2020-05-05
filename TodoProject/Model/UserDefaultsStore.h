//
//  UserDefaultsStore.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 5/2/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultsStore : NSObject

@property NSUserDefaults*  tasksDefaults;
@property NSMutableArray* tasks;
@property NSData* data;

-(void)addTaskToDefaults:(NSMutableArray*) tasksArr;
-(NSInteger)getTasksNumber;
-(NSMutableArray*)getTasks;
-(void)clearUserDefaults;
@end

NS_ASSUME_NONNULL_END
