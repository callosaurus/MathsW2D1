//
//  Player.m
//  MathsW2D1
//
//  Created by Callum Davies on 2017-02-13.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberOfLives = 3;
        
    }
    return self;
}

-(void)loseOneLife
{
    self.numberOfLives--;
}

@end
