//
//  MyButtonNode.m
//  SpritekitUITestingExample
//
//  Created by hiiwave on 20/12/2017.
//  Copyright © 2017 pong. All rights reserved.
//

#import "MyButtonNode.h"
#import "MyButtonLabel.h"

@implementation MyButtonNode

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super initWithCoder:aDecoder]) {
    self.userInteractionEnabled = YES;
  }
  return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  [_delegate button:self touchBegan:touch];
  [self.scene touchesBegan:touches withEvent:event];
}

#pragma mark getter/setter

- (void)setLabelText:(NSString *)labelText {
  MyButtonLabel *nodeLabel = [MyButtonLabel labelNodeWithText:labelText];
  nodeLabel.fontSize = 32;
  nodeLabel.userInteractionEnabled = YES;
  [self addChild:nodeLabel];
}

@end
