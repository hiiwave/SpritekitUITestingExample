//
//  GameScene.h
//  SpritekitUIAccessExample
//
//  Created by hiiwave on 19/12/2017.
//  Copyright © 2017 pong. All rights reserved.
//

#import "SUEScene.h"
#import <GameplayKit/GameplayKit.h>
#import <SpriteKit/SpriteKit.h>

@interface SUEFirstScene : SUEScene

@property(nonatomic) NSMutableArray<GKEntity *> *entities;
@property(nonatomic) NSMutableDictionary<NSString *, GKGraph *> *graphs;

@end
