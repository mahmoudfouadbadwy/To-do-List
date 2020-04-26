//
//  Tasks.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import "Tasks.h"

@implementation Tasks
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.Description forKey:@"desc"];
    [aCoder encodeObject:self.priority forKey:@"pro"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.status forKey:@"status"];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init])
    {
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.Description=[aDecoder decodeObjectForKey:@"desc"];
        self.priority=[aDecoder decodeObjectForKey:@"pro"];
        self.date=[aDecoder decodeObjectForKey:@"date"];
        self.status=[aDecoder decodeObjectForKey:@"status"];
    }
    return self;
}
@end
