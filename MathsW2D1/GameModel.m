//
//  GameModel.m
//  MathsW2D1
//
//  Created by Callum Davies on 2017-02-13.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "GameModel.h"
#import "Player.h"


@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.player1 = [Player new];
        self.player2 = [Player new];
        self.currentPlayerNumber = 1;
    }
    return self;
}

-(void)generateQuestionForPlayer:(Player *)player
{
    int number1 = arc4random_uniform(21)+1;
    int number2 = arc4random_uniform(21)+1;
    self.correctAnswer = number1 + number2;
    self.questionString = [NSString stringWithFormat:@"%i + %i?", number1, number2];
    
    
    
}

-(BOOL)checkAnswer
{
    if (self.inputAnswer == self.correctAnswer) {
        if (self.currentPlayerNumber == 1) {
            self.player1.numberOfLives += 1;
        } else {
            self.player1.numberOfLives += 1;
        }
        return YES;
    } else {
        if (self.currentPlayerNumber == 1) {
            self.player2.numberOfLives -= 1;
        } else {
            self.player2.numberOfLives -= 1;
        }
    }
    return NO;
}

@end
