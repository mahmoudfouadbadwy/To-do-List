//
//  AppDelegate.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskDetails/View/TasksDetails.h"
#import "AddTask/View/AddTask.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property TasksDetails *detailView;
@property AddTask* addView;
@property (strong, nonatomic) UIWindow *window;


@end

