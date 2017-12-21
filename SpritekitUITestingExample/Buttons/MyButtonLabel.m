//
//  MyButtonLabel.m
//  SpritekitUITestingExample
//
//  Created by hiiwave on 20/12/2017.
//  Copyright © 2017 pong. All rights reserved.
//

#import "MyButtonLabel.h"
#import "MyButtonNode.h"

@implementation MyButtonLabel

+ (instancetype)labelNodeWithText:(NSString *)text {
  MyButtonLabel *nodeLabel = [super labelNodeWithText:text];
  nodeLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
  nodeLabel.userInteractionEnabled = YES;
  return nodeLabel;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  NSAssert(self.parent.class == [MyButtonNode class], @"");
  [self.parent touchesBegan:touches withEvent:event];
}

@end
