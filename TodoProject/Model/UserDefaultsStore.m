//
//  UserDefaultsStore.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 5/2/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import "UserDefaultsStore.h"

@implementation UserDefaultsStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tasksDefaults = [NSUserDefaults standardUserDefaults];
        _tasks = [NSMutableArray new ];
    }
    return self;
}

-(void)addTaskToDefaults:(NSMutableArray*) tasksArr
{
    _data=[NSKeyedArchiver archivedDataWithRootObject:tasksArr];
    [_tasksDefaults setObject:_data forKey:@"task"];
    [_tasksDefaults synchronize];
}
-(NSMutableArray*)getTasks{
    _data = [_tasksDefaults objectForKey:@"task"];
    _tasks = [NSKeyedUnarchiver unarchiveObjectWithData:_data];
    return _tasks;
}

-(NSInteger)getTasksNumber{
    [self getTasks];
    return [_tasks count];
}

-(void)clearUserDefaults{
    [_tasksDefaults removeObjectForKey:@"task"];
}


@end
