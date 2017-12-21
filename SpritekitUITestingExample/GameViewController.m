//
//  GameViewController.m
//  SpritekitUIAccessExample
//
//  Created by hiiwave on 19/12/2017.
//  Copyright © 2017 pong. All rights reserved.
//

#import "GameViewController.h"
#import "SUEFirstScene.h"

@implementation GameViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
  // including entities and graphs.
  GKScene *scene = [GKScene sceneWithFileNamed:@"SUEFirstScene"];

  // Get the SKScene from the loaded GKScene
  SUEFirstScene *sceneNode = (SUEFirstScene *)scene.rootNode;

  // Copy gameplay related content over to the scene
  sceneNode.entities = [scene.entities mutableCopy];
  sceneNode.graphs = [scene.graphs mutableCopy];

  // Set the scale mode to scale to fit the window
  sceneNode.scaleMode = SKSceneScaleModeAspectFill;

  SKView *skView = (SKView *)self.view;

  // Present the scene
  [skView presentScene:sceneNode];

  skView.showsFPS = YES;
  skView.showsNodeCount = YES;
}

- (BOOL)shouldAutorotate {
  return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
  if ([[UIDevice currentDevice] userInterfaceIdiom] ==
      UIUserInterfaceIdiomPhone) {
    return UIInterfaceOrientationMaskAllButUpsideDown;
  } else {
    return UIInterfaceOrientationMaskAll;
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}

@end
