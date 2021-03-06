//
//  SUEScene.h
//  SpritekitUITestingExample
//
//  Created by hiiwave on 19/12/2017.
//  Copyright © 2017 pong. All rights reserved.
//

#import <GamePlayKit/GamePlayKit.h>
#import <SpriteKit/SpriteKit.h>

#import "MyButtonNode.h"

@interface SUEScene : SKScene <MyButtonNodeDelegate>

@property(nonatomic) NSMutableArray *testableNodes;
@property(nonatomic) NSMutableArray *accessibleElements;

@end
