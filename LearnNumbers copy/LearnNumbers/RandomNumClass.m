//
//  RandomNumClass.m
//  LearnNumbers
//
//  Created by BSA Univ15 on 17/07/14.
//  Copyright (c) 2014 BSA Univ15. All rights reserved.
//

#import "RandomNumClass.h"

@implementation RandomNumClass
{
    
    NSArray *array;
    
   
}

-(NSArray *) doRandom{
    
    array=[[NSArray alloc]init];
    int D[20];
    BOOL flag;
    for (int i=0; i<5; i++)
    {
        //int randum= random()%100;
        int  randum = arc4random_uniform(10);
        flag= true;
        int size= (sizeof D);
        
        for (int x=0; x<=size; x++)
        {
            if (randum == D[x])
            {
                i--;
                flag= false;
                break;
            }
        }
        
        if (flag) D[i]=randum;
        
    }
    for (int j=0; j<5; j++)
    {
        array=[array arrayByAddingObject:[NSNumber numberWithInt:D[j]]];
    }
    
    //NSLog(@"Another set..%@",array.description);
    return array;
}
@end
