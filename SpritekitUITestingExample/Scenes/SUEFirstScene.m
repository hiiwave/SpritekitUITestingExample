//
//  GameScene.m
//  SpritekitUIAccessExample
//
//  Created by hiiwave on 19/12/2017.
//  Copyright © 2017 pong. All rights reserved.
//

#import "SUEFirstScene.h"

#import "SUESecondScene.h"

@implementation SUEFirstScene {
  NSTimeInterval _lastUpdateTime;
  SKShapeNode *_spinnyNode;
  SKLabelNode *_label;
}

- (void)sceneDidLoad {
  [super sceneDidLoad];
  _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
  _label.alpha = 0.0;
  [_label runAction:[SKAction fadeInWithDuration:2.0]];

  MyButtonNode *nextBtn = (MyButtonNode *)[self childNodeWithName:@"//nextBtn"];
  nextBtn.delegate = self;
  nextBtn.labelText = @"NEXT";

  [self addTestableNodes];
}

- (void)addTestableNodes {
  [self.testableNodes addObject:[self childNodeWithName:@"//nextBtn"]];
  [self.testableNodes addObject:[self childNodeWithName:@"//helloLabel"]];
  [self.testableNodes addObject:[self childNodeWithName:@"//node1"]];
  [self.testableNodes addObject:[self childNodeWithName:@"//node2"]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  // Run 'Pulse' action from 'Actions.sks'
  [_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
}

- (void)transitToSecondScene {
  SKScene *nextScene = [SKScene nodeWithFileNamed:@"SUESecondScene"];
  nextScene.scaleMode = SKSceneScaleModeAspectFill;
  [self.view presentScene:nextScene];
}

#pragma mark buttons

- (void)button:(MyButtonNode *)button touchBegan:(UITouch *)touch {
  if ([button.name isEqual:@"nextBtn"]) {
    [self transitToSecondScene];
  }
}

@end
