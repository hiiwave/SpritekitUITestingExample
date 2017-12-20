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


- (void)testSimple {
  NSLog(@"QQ");
  [UIView printViewHierarchy];
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
