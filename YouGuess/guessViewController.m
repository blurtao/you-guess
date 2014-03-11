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

- (void)setScoreValue:(int)scoreValue
{
    _scoreValue = scoreValue;
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %d", _scoreValue];
    
}

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
        self.resultLabel.text = [NSString stringWithFormat:@"平局啊"];
        self.roundValue += 1;
    }else{
        if(what == 0){
            //剪刀
            if(random == 1){
                //lose
                self.resultLabel.text = [NSString stringWithFormat:@"你输了亲"];
                self.roundValue += 1;
            }else{
                //win
                self.resultLabel.text = [NSString stringWithFormat:@"你赢了啊"];
                self.roundValue += 1;
                self.scoreValue += 1;
            }
        }
        if(what == 1){
            //石头
            if(random == 0){
                //win
                self.resultLabel.text = [NSString stringWithFormat:@"你赢了啊"];
                self.roundValue += 1;
                self.scoreValue += 1;
            }else{
                //lose
                self.resultLabel.text = [NSString stringWithFormat:@"你输了亲"];
                self.roundValue += 1;
            }
        }
        if(what == 2){
            if(random == 1){
                //win
                self.resultLabel.text = [NSString stringWithFormat:@"你赢了啊"];
                self.roundValue += 1;
                self.scoreValue += 1;
            }else{
                //lose
                self.resultLabel.text = [NSString stringWithFormat:@"你输了亲"];
                self.roundValue += 1;
            }
        }
    }
    
}

- (int)getRandom
{
    int random = arc4random() % 3;
    return random;
}

@end
