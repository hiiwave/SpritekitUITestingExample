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
  // Setup your scene here
  
  // Initialize update time
  _lastUpdateTime = 0;
  
  // Get label node from scene and store it for use later
  _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
  
  _label.alpha = 0.0;
  [_label runAction:[SKAction fadeInWithDuration:2.0]];
  
  CGFloat w = (self.size.width + self.size.height) * 0.05;
  
  // Create shape node to use during mouse interaction
  _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
  _spinnyNode.lineWidth = 2.5;
  
  [_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
  [_spinnyNode runAction:[SKAction sequence:@[
                                              [SKAction waitForDuration:0.5],
                                              [SKAction fadeOutWithDuration:0.5],
                                              [SKAction removeFromParent],
                                              ]]];
  
  [self addTestableNodes];
}

- (void)addTestableNodes {
  [self.testableNodes addObject:[self childNodeWithName:@"//nextBtn"]];
  [self.testableNodes addObject:[self childNodeWithName:@"//helloLabel"]];
  [self.testableNodes addObject:[self childNodeWithName:@"//node1"]];
  [self.testableNodes addObject:[self childNodeWithName:@"//node2"]];
}


- (void)touchDownAtPoint:(CGPoint)pos {
  SKShapeNode *n = [_spinnyNode copy];
  n.position = pos;
  n.strokeColor = [SKColor greenColor];
  [self addChild:n];
}

- (void)touchMovedToPoint:(CGPoint)pos {
  SKShapeNode *n = [_spinnyNode copy];
  n.position = pos;
  n.strokeColor = [SKColor blueColor];
  [self addChild:n];
}

- (void)touchUpAtPoint:(CGPoint)pos {
  SKShapeNode *n = [_spinnyNode copy];
  n.position = pos;
  n.strokeColor = [SKColor redColor];
  [self addChild:n];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  // Run 'Pulse' action from 'Actions.sks'
  UITouch *touch = [touches anyObject];
  SKNode *touchedNode = [self nodeAtPoint:[touch locationInNode:self]];
  if ([touchedNode.name isEqual:@"nextBtn"]) {
    [self transitToSecondScene];
  }
  
  [_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
  for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
  for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
  for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}


- (void)update:(CFTimeInterval)currentTime {
  // Called before each frame is rendered
  
  // Initialize _lastUpdateTime if it has not already been
  if (_lastUpdateTime == 0) {
    _lastUpdateTime = currentTime;
  }
  
  // Calculate time since last update
  CGFloat dt = currentTime - _lastUpdateTime;
  
  // Update entities
  for (GKEntity *entity in self.entities) {
    [entity updateWithDeltaTime:dt];
  }
  
  _lastUpdateTime = currentTime;
}

- (void)transitToSecondScene {
  SKScene *nextScene = [SKScene nodeWithFileNamed:@"SUESecondScene"];
  nextScene.scaleMode = SKSceneScaleModeAspectFill;
  [self.view presentScene:nextScene];
}

@end












