//
//  TodoViewProtocol.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 4/26/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TodoViewProtocol <NSObject>
-(void)goToDetailView;
-(void)goToAddView;
@end

NS_ASSUME_NONNULL_END
