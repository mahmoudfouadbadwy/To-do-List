//
//  AddProtocol.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Model/Tasks.h"
NS_ASSUME_NONNULL_BEGIN

@protocol AddProtocol <NSObject>
-(void)addTask:(Tasks*)task;
-(void)editTask:(Tasks*)task;
@end

NS_ASSUME_NONNULL_END
