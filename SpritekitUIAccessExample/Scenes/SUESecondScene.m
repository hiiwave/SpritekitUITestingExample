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
  [self.testableNodes addObject:[self childNodeWithName:@"//lastBtn"]];

  MyButtonNode *lastBtn = (MyButtonNode *)[self childNodeWithName:@"//lastBtn"];
  lastBtn.delegate = self;
  lastBtn.labelText = @"LAST";
}

- (void)transitToFirstScene {
  SKScene *nextScene = [SKScene nodeWithFileNamed:@"SUEFirstScene"];
  nextScene.scaleMode = SKSceneScaleModeAspectFill;
  [self.view presentScene:nextScene];
}

#pragma mark buttons

- (void)button:(MyButtonNode *)button touchBegan:(UITouch *)touch {
  if ([button.name isEqual:@"lastBtn"]) {
    [self transitToFirstScene];
  }
}

@end
