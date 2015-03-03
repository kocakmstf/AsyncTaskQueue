# AsyncTaskQueue

This is a sample app to run sync tasks (queue tasks) in async thread. You can define timeinterval too. 
Usage:


	[[TaskQueue SharedInstance] AddTask:^{
        [self SendEmail];
        //do other stuff you want to do in async thread
    } timeInterval:1];
    
