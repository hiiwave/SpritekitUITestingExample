//
//  SUEScene.m
//  SpritekitUIAccessExample
//
//  Created by hiiwave on 19/12/2017.
//  Copyright © 2017 pong. All rights reserved.
//

#import "SUEScene.h"

@implementation SUEScene

- (void)sceneDidLoad {
  self.scaleMode = SKSceneScaleModeAspectFill;
  _testableNodes = [NSMutableArray array];
  _accessibleElements = [NSMutableArray array];
  self.isAccessibilityElement = NO;
}

#pragma mark Accessbility

- (void)resetAccessibleElement {
  [_accessibleElements removeAllObjects];
}

- (NSInteger)accessibilityElementCount {
  [self initAccessibility];
  return _accessibleElements.count;
}

- (id)accessibilityElementAtIndex:(NSInteger)index {
  [self initAccessibility];
  if (index < _accessibleElements.count) {
    return [_accessibleElements objectAtIndex:index];
  } else {
    return nil;
  }
}

- (NSInteger)indexOfAccessibilityElement:(id)element {
  [self initAccessibility];
  return [_accessibleElements indexOfObject:element];
}

- (void)initAccessibility {
  if (_accessibleElements.count > 0) return;
  for (SKSpriteNode* sprite in _testableNodes) {
    UIAccessibilityElement* accessElement = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:self.view];
    CGRect frame = sprite.frame;
    frame.origin = [self.view convertPoint:frame.origin fromScene:self];
    frame.origin.y -= frame.size.height;
    accessElement.accessibilityLabel = sprite.name;
    accessElement.accessibilityFrame = frame;
    accessElement.accessibilityTraits = UIAccessibilityTraitButton;
    [_accessibleElements addObject:accessElement];
  }
  self.accessibilityElements = _accessibleElements;
}

@end
