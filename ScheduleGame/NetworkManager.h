//
//  NetworkManager.h
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Schedule.h"
@interface NetworkManager : NSObject
+(void)fetchGameDataWithQuery:(NSString*)query
                        block:(void (^)(NSArray *scheduleArray, NSError *error))block;
@end
