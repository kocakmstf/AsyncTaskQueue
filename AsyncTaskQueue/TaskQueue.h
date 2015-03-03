//
//  TaskQueu.h
//  AsyncSync
//
//  Created by kocakmstf on 03/03/15.
//  Copyright (c) 2015 mstf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskQueue : NSObject
@property (nonatomic,retain) NSMutableArray *taskArray;
-(void)AddTask:(void(^)(void))processBlock timeInterval:(int)timeInterval;
+(TaskQueue*)SharedInstance;
@end
