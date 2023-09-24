//
//  ViewController.m
//  JsonObjC
//
//  Created by Alexander Zorinov on 2023-09-24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *days = [self JSONFromFile];
    NSLog(@"Json data is here %@", days);
    for (NSDictionary * item in days)
    {
        NSString *date = (NSString *)item[@"date"];
        NSString *day = (NSString *)item[@"day"];
        NSString *ID = (NSString *)item[@"id"];
        NSLog(@"date: %@",date);
        NSLog(@"day: %@",day);
        NSLog(@"id: %@",ID);
    }
}

- (id)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}
@end
