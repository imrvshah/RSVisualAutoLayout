//
//  NetworkManager.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "NetworkManager.h"
#import "XMLDictionary.h"
@implementation NetworkManager

+(void)fetchGameDataWithQuery:(NSString*)query
                        block:(void (^)(NSArray *scheduleArray, NSError *error))block

{
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:query]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        if ([httpResponse statusCode]==200) {
            NSError *error;
            NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *dict = [NSDictionary dictionaryWithXMLString:newStr];
            Team *selfTeam = [Team teamFromXML:dict[@"Team"]];
            NSArray* gameSection = dict[@"GameSection"];
            NSArray *arrSchedule;
            if ( [gameSection isKindOfClass:[NSArray class]] ) {
                arrSchedule = [Schedule scheduleFromXMLArray:gameSection withTeam:selfTeam ];
            }
            else if ([gameSection isKindOfClass:[NSDictionary class]]) {
                arrSchedule = [Schedule scheduleFromXMLArray:@[gameSection] withTeam:selfTeam];
            }
            else {
                NSLog(@"%@",@"Invalid type");
            }
            
            block(arrSchedule,error);
        }
        else{
            block(nil,error);
        }
    }];
    [dataTask resume];
}
@end
