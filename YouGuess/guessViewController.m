//
//  guessViewController.m
//  YouGuess
//
//  Created by blur on 14-3-11.
//  Copyright (c) 2014年 blur. All rights reserved.
//

#import "guessViewController.h"

@interface guessViewController ()
@end

@implementation guessViewController

- (IBAction)chooseJD:(UIButton *)sender
{
    int currentValue = 0;
    [self changResultLabel:currentValue];
}

- (IBAction)chooseST:(UIButton *)sender
{
    int currentValue = 1;
    [self changResultLabel:currentValue];
}

- (IBAction)chooseB:(UIButton *)sender
{
    int currentValue = 2;
    [self changResultLabel:currentValue];
}

//override setScoreValue method & update scoreLabel text
- (void)setScoreValue:(int)scoreValue
{
    _scoreValue = scoreValue;
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %d", _scoreValue];
    
}

//overfide setRoundValue method & update roundLabel text
- (void)setRoundValue:(int)roundValue
{
    _roundValue = roundValue;
    self.roundLabel.text = [NSString stringWithFormat:@"round: %d", _roundValue];
}

- (void)changResultLabel:(int) what
{
    int random = [self getRandom];
    if(what == random){
        //平局
        [self updateLabel:1];
    }else{
        if(what == 0){
            //剪刀
            if(random == 1){
                //lose
                [self updateLabel:2];
            }else{
                //win
                [self updateLabel:0];
            }
        }
        if(what == 1){
            //石头
            if(random == 0){
                //win
                [self updateLabel:0];
            }else{
                //lose
                [self updateLabel:2];
            }
        }
        if(what == 2){
            if(random == 1){
                //win
                [self updateLabel:0];
            }else{
                //lose
                [self updateLabel:2];
            }
        }
    }
}

//update label
- (void)updateLabel:(int)winOrLose
{
    if(winOrLose == 0){
        self.resultLabel.text = [NSString stringWithFormat:@"你赢了啊亲"];
        self.roundValue += 1;
        self.scoreValue += 1;
    }else if(winOrLose == 1){
        self.resultLabel.text = [NSString stringWithFormat:@"平局"];
        self.roundValue += 1;
    }else{
        self.resultLabel.text = [NSString stringWithFormat:@"你输了啊啊"];
        self.roundValue += 1;
        if(self.scoreValue>0){
            self.scoreValue -= 1;
        }else{
            self.resultLabel.text = [NSString stringWithFormat:@"内裤都输了还玩毛线"];
        }
    }
}

//get random value
- (int)getRandom
{
    int random = arc4random() % 3;
    return random;
}

@end
