//
//  MSDGameOverScene.m
//  SpriteKitGreeting
//
//  Created by Matthew Dobson on 6/7/14.
//  Copyright (c) 2014 Matthew Dobson. All rights reserved.
//

#import "MSDGameOverScene.h"
#import "MSDMyScene.h"

@implementation MSDGameOverScene

-(id)initWithSize:(CGSize)size won:(BOOL)won {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        NSString *message;
        if (won) {
            message = @"You Won!";
        } else {
            message = @"You Lost...";
        }
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"HelveticaNeue"];
        label.text = message;
        label.fontSize = 40;
        label.fontColor = [SKColor blackColor];
        label.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:label];
        
        [self runAction:
            [SKAction sequence:@[
                [SKAction waitForDuration:3.0],
                [SKAction runBlock:^{
                    SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                    SKScene * myScene = [[MSDMyScene alloc] initWithSize:self.size];
                    [self.view presentScene:myScene transition:reveal];
                }]
            ]]];
    }
    
    return self;
}

@end
