//
//  Done.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../DonePresenterProtocol.h"
#import "../Presenter/donePresenter.h"
NS_ASSUME_NONNULL_BEGIN

@interface Done : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *doneTable;
@property id <DonePresenterProtocol>presenter;
@end

NS_ASSUME_NONNULL_END
