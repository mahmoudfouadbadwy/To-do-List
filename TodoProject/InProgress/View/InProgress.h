//
//  InProgress.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../InProgressPresenterProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface InProgress : UIViewController
<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *inProgressTable;
@property id <InProgressPresenterProtocol>presenter;
@end

NS_ASSUME_NONNULL_END
