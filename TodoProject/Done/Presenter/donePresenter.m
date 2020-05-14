//
//  donePresenter.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 5/14/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import "donePresenter.h"
#import "../../Model/UserDefaultsStore.h"
#import "../../Model/Tasks.h"
@implementation donePresenter{
    UserDefaultsStore * store;
    Tasks * task ;
    NSMutableArray * allTasks;
    NSMutableArray * doneTasks;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        store = [UserDefaultsStore new];
        doneTasks = [NSMutableArray new];
    }
    return self;
}
- ( NSMutableArray *)getDoneTasks {
    allTasks = [store getTasks];
    for (int i =0; i<[allTasks count]; i++) {
        task = [allTasks objectAtIndex:i];
        if ([[task status]  isEqualToString:@"Done"]) {
            [doneTasks addObject:task];
        }
    }
    return doneTasks;
}

- ( NSString *)getTaskImage:(NSInteger)index {
    NSString* imageName;
    task = [doneTasks objectAtIndex:(int)index];
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
