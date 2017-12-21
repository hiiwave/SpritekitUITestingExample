//
//  MyButtonNode.h
//  SpritekitUITestingExample
//
//  Created by hiiwave on 20/12/2017.
//  Copyright © 2017 pong. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@protocol MyButtonNodeDelegate;

@interface MyButtonNode : SKSpriteNode

@property(nonatomic, nullable) id<MyButtonNodeDelegate> delegate;
@property(nonatomic, nullable) NSString *labelText;

@end

@protocol MyButtonNodeDelegate <NSObject>

- (void)button:(MyButtonNode *_Nonnull)button
    touchBegan:(UITouch *_Nonnull)touch;

@end
