//
//  TasksDetails.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/14/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TasksDetails : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *taskName;
@property (weak, nonatomic) IBOutlet UILabel *TaskDescription;
@property (weak, nonatomic) IBOutlet UILabel *taskPriority;
@property (weak, nonatomic) IBOutlet UILabel *taskDate;
@property (weak, nonatomic) IBOutlet UILabel *taskStatus;

@property NSString *detailName;
@property NSString *detailPriority;
@property NSString *detailDescription;
@property NSString *detailDate;
@property NSString *detailStatus;

@end

NS_ASSUME_NONNULL_END
