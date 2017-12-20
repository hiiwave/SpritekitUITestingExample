//
//  KIFTest.m
//  SpritekitUIAccessExampleTests
//
//  Created by hiiwave on 19/12/2017.
//  Copyright © 2017 pong. All rights reserved.
//

#import <KIF/KIF.h>
#import <KIF/KIFUITestActor-IdentifierTests.h>
#import <KIF/UIView-Debugging.h>

@interface KIFSimpleTest : KIFTestCase

@end

@implementation KIFSimpleTest

- (void)beforeEach {
}

- (void)afterEach {
  if([[[UIApplication sharedApplication] keyWindow] accessibilityElementWithLabel:@"lastBtn"] != nil) {
    [tester tapViewWithAccessibilityLabel:@"lastBtn"];
  } else {
  }
}

- (void)testSimple {
  [tester waitForViewWithAccessibilityLabel:@"helloLabel"];
  [UIView printViewHierarchy];
  [tester tapViewWithAccessibilityLabel:@"nextBtn"];
  [UIView printViewHierarchy];
  [tester tapViewWithAccessibilityLabel:@"lastBtn"];
}

- (void)testFailedSimple {
  [tester waitForViewWithAccessibilityLabel:@"helloLabel"];
  [tester tapViewWithAccessibilityLabel:@"nextBtn"];
  // Fail at this line
  [[tester usingTimeout:3] waitForViewWithAccessibilityLabel:@"helloLabel"];
}

//- (void)testThatUsesViewTestActorCategory
//{
//
//  [[viewTester redCell] tap];
//  [viewTester validateSelectedColor:@"Red"];
//  [[viewTester blueCell] tap];
//  [viewTester validateSelectedColor:@"Blue"];
//}
//
//- (void)testSelectingDifferentColors
//{
//  [[viewTester usingLabel:@"Purple"] tap];
//  [[viewTester usingLabel:@"Blue"] tap];
//  [[viewTester usingLabel:@"Red"] tap];
//  [viewTester waitForTimeInterval:5.0];
//  [[viewTester usingLabel:@"Selected: Red"] waitForView];
//}

@end
