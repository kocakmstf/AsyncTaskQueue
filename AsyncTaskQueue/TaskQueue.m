//
//  TaskQueu.m
//  AsyncSync
//
//  Created by kocakmstf on 03/03/15.
//  Copyright (c) 2015 mstf. All rights reserved.
//

#import "TaskQueue.h"

@implementation TaskQueue

static TaskQueue * instance;
dispatch_queue_t myQueue;

/**
 singeleton pattern
 **/
+(TaskQueue*)SharedInstance
{
    if(instance==NULL)
    {
        instance=[[TaskQueue alloc]init];
        instance.taskArray=[[NSMutableArray alloc]init];
        myQueue = dispatch_queue_create("My Queue",NULL);
    }
    return instance;
}

-(void)RunQueue:(void(^)(void))processBlock
{
    
    dispatch_async(myQueue, ^{
        processBlock();
        NSLog(@"something complated in queue");
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            
        });
        //remove complated task from queue
        [instance.taskArray removeObject:processBlock];
    
        if(instance.taskArray.count>0) //if queue contains any other process, go for it. FIFO structure
        {
            id process=[instance.taskArray objectAtIndex:0];
            [instance RunQueue:process];
        }
    });
}

//just helps to run.
-(void)AddTaskHelper:(void(^)(void))processBlock
{
    if(instance.taskArray.count==0){
        [instance.taskArray addObject:processBlock];
        [instance RunQueue:processBlock];
    }
    else
        [instance.taskArray addObject:processBlock];
}

//main methot to be used outside of class. Try to run process after time interval
-(void)AddTask:(void(^)(void))processBlock timeInterval:(int)timeInterval
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [instance AddTaskHelper:processBlock];
    });
}



@end
