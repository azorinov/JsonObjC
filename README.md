# JsonObjC
Simple Objective C project to parse Json.

1. Parsing sample.json file.
2. Creates an array of custom objects(Day).
3. Creates table view programatically.
4. Dispalays  day in table view.

Remove Storyboard
1. Remove Main file. <img width="260" alt="Remove Main" src="https://github.com/azorinov/JsonObjC/assets/137667539/e63f2f1c-6277-4fd6-b479-9a9f031f830a">
2. Remove from info. <img width="710" alt="Remove from Info" src="https://github.com/azorinov/JsonObjC/assets/137667539/93539ec9-5327-4a4a-a297-36b29e36345a">
3. Remove from info. <img width="719" alt="remove from info 2" src="https://github.com/azorinov/JsonObjC/assets/137667539/0790ef74-36ec-460c-88eb-a2e7bb825b0b">
4.Add #import "ViewController.h" in SceneDelegate.
5. Add in SceneDelegate:
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.windowScene = (UIWindowScene *)scene;
    
    ViewController *viewController = [[ViewController alloc] init];
    viewController.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController: viewController];
    [self.window makeKeyAndVisible];
