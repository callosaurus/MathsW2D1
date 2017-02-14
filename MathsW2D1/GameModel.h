//
//  GameModel.h
//  MathsW2D1
//
//  Created by Callum Davies on 2017-02-13.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;

@interface GameModel : NSObject

@property Player *player1;
@property Player *player2;
@property NSString *questionString;
@property int correctAnswer;
@property int inputAnswer;
@property int currentPlayerNumber;


-(void)generateQuestionForPlayer:(Player *)player;
-(BOOL)checkAnswer;

@end
