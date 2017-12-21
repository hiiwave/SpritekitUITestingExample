# SpritekitUITestingExample
Demo on UI testing for ios game under SpriteKit framework


## Description

This is a simple demo on how to perform UI testing on ios game powered by [SpriteKit](https://developer.apple.com/spritekit/) framework.

The idea comes from [this stackoverflow answer](https://stackoverflow.com/questions/34293575/is-it-possible-to-use-xcode-ui-testing-on-an-app-using-spritekit/42676977#42676977),
where the accessibility materials for elements to be UI-tested are created. That's mean:

1. List all accessible elements contained in the scene

2. Configure settings for each of these elements, especially frame data.


In this demo, there are two scenes (`SKScene`) which can transit to each other by navigation buttons (`SKSpriteNode`).
Two UI testing targets are cretaed to automatically naviagate between scenes: 

1. `SpritekitUITestingExampleKIFTests`: implemented by [KIF](https://github.com/kif-framework/KIF)

2. `SpritekitUITestingExampleUITests`: implemented by [Xcode UI Testing Framework](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html)

Hope this helps for those who would like to do UI testing on a Spritekit game :)


## Special Thanks

Thanks to [Domsware](https://stackoverflow.com/users/540780/domsware) from Stackoverflow for this awesome idea!
