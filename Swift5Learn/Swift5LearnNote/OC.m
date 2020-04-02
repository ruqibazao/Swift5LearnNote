//
//  OC.m
//  Swift5LearnNote
//
//  Created by nenhall on 2020/3/4.
//  Copyright © 2020 nenhall. All rights reserved.
//

#import "OC.h"

@implementation OC

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
        });
        
        
    }
    return self;
}

@end
