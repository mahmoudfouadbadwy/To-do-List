//
//  InProgressPresenterProtocol.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 4/26/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol InProgressPresenterProtocol <NSObject>
-(NSMutableArray*)getInprogressTasks;
-(NSString*)getTaskImage:(NSInteger )index;
@end

NS_ASSUME_NONNULL_END
