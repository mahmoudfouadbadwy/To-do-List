//
//  Tasks.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tasks:NSObject<NSCoding>
@property NSString *name;
@property NSString *Description;
@property NSString *priority;
@property NSString *date;
@property NSString *status;
@end

NS_ASSUME_NONNULL_END

//complete in progress- done - priority action
// todo-progress-done visibility
// design
