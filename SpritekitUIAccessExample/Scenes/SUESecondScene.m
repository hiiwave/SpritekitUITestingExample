//
//  SUESecondScene.m
//  SpritekitUIAccessExample
//
//  Created by hiiwave on 19/12/2017.
//  Copyright © 2017 pong. All rights reserved.
//

#import "SUESecondScene.h"

@implementation SUESecondScene

- (void)sceneDidLoad {
  [super sceneDidLoad];
  [self.accessibleSprites addObject:[self childNodeWithName:@"//lastBtn"]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  // Run 'Pulse' action from 'Actions.sks'
  UITouch *touch = [touches anyObject];
  SKNode *touchedNode = [self nodeAtPoint:[touch locationInNode:self]];
  if ([touchedNode.name isEqual:@"lastBtn"]) {
    [self transitToFirstScene];
  }
}

- (void)transitToFirstScene {
  SKScene *nextScene = [SKScene nodeWithFileNamed:@"SUEFirstScene"];
  nextScene.scaleMode = SKSceneScaleModeAspectFill;
  [self.view presentScene:nextScene];
}

@end
