//
//  ViewController.m
//  MathsW2D1
//
//  Created by Callum Davies on 2017-02-13.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *player1Lives;
@property (weak, nonatomic) IBOutlet UILabel *player2Lives;
@property (weak, nonatomic) IBOutlet UILabel *questionForPlayers;
@property (weak, nonatomic) IBOutlet UILabel *answerForPlayers;
@property (nonatomic, strong) GameModel *gameModel;
@property (nonatomic, strong) NSMutableArray *inputNumbers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gameModel = [GameModel new];
    self.inputNumbers = [NSMutableArray new];
    
    [self startGame];
    
}

-(void)startGame
{
    
    if (self.gameModel.player1.numberOfLives == 0 || self.gameModel.player2.numberOfLives == 0) {
        NSLog(@"GAME OVAH!");
        self.answerForPlayers.text = @"GAME OVER";
    } else {
        
        if (self.gameModel.currentPlayerNumber == 1) {
            [self.gameModel generateQuestionForPlayer:self.gameModel.player1];
            self.questionForPlayers.text = self.gameModel.questionString;
            self.player1Lives.text = [NSString stringWithFormat:@"Player1 Lives: %i", self.gameModel.player1.numberOfLives];
            self.player2Lives.text = [NSString stringWithFormat:@"Player2 Lives: %i", self.gameModel.player2.numberOfLives];
            
        } else {
            [self.gameModel generateQuestionForPlayer:self.gameModel.player2];
            self.questionForPlayers.text = self.gameModel.questionString;
            self.player1Lives.text = [NSString stringWithFormat:@"Player1 Lives: %i", self.gameModel.player1.numberOfLives];
            self.player2Lives.text = [NSString stringWithFormat:@"Player2 Lives: %i", self.gameModel.player2.numberOfLives];
        }
    }
}
-(void)enteredAnswer
{
    NSString *answerAsString = [self.inputNumbers componentsJoinedByString:@""];
    [self.inputNumbers removeAllObjects];
    self.gameModel.inputAnswer = [answerAsString intValue];
    NSLog(@"You entered %i!",self.gameModel.inputAnswer);
}

- (IBAction)enterButton:(id)sender {
    [self enteredAnswer];
    if ([self.gameModel checkAnswer]) {
        self.answerForPlayers.text = @"YES das right!";
        self.answerForPlayers.textColor = [UIColor greenColor];
        
    } else {
        self.answerForPlayers.text = @"NO das wrong";
        self.answerForPlayers.textColor = [UIColor redColor];
    }
    
    if (self.gameModel.currentPlayerNumber == 1) {
        self.gameModel.currentPlayerNumber = 2;
        [self startGame];
    } else {
        self.gameModel.currentPlayerNumber = 1;
        [self startGame];
    }
}

- (IBAction)button1:(id)sender {
    [self.inputNumbers addObject:@"1"];
}

- (IBAction)button2:(id)sender {
    [self.inputNumbers addObject:@"2"];
}

- (IBAction)button3:(id)sender {
    [self.inputNumbers addObject:@"3"];
}

- (IBAction)button4:(id)sender {
    [self.inputNumbers addObject:@"4"];
}

- (IBAction)button5:(id)sender {
    [self.inputNumbers addObject:@"5"];
}

- (IBAction)button6:(id)sender {
    [self.inputNumbers addObject:@"6"];
}

- (IBAction)button7:(id)sender {
    [self.inputNumbers addObject:@"7"];
}

- (IBAction)button8:(id)sender {
    [self.inputNumbers addObject:@"8"];
}

- (IBAction)button9:(id)sender {
    [self.inputNumbers addObject:@"9"];
}

- (IBAction)button0:(id)sender {
    [self.inputNumbers addObject:@"0"];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
