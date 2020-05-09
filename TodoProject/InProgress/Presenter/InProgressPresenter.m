//
//  InProgressPresenter.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 5/9/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import "InProgressPresenter.h"

@implementation InProgressPresenter
{
    UserDefaultsStore * store;
    Tasks * task ;
    NSMutableArray * allTasks;
    NSMutableArray * inProgressTasks;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        store = [UserDefaultsStore new];
        inProgressTasks = [NSMutableArray new];
    }
    return self;
}
- (NSMutableArray *)getInprogressTasks {
   allTasks = [store getTasks];
    for (int i =0; i<[allTasks count]; i++) {
        task = [allTasks objectAtIndex:i];
        if ([[task status]  isEqualToString:@"InProgress"]) {
            [inProgressTasks addObject:task];
        }
    }
    return inProgressTasks;
}

- (NSString *)getTaskImage:( NSInteger )index {
    NSString* imageName;
    task = [inProgressTasks objectAtIndex:(int)index];
    if([[task priority] isEqualToString:@"Low"]){
        imageName = @"low.png";
    }
    else if ([[task priority] isEqualToString:@"Medium"]){
        imageName = @"medium (2).png";
    }
    else
    {
        imageName = @"high.png";
    }
  
    return imageName;
}




@end
