//
//  ViewController.m
//  JsonObjC
//
//  Created by Alexander Zorinov on 2023-09-24.
//

#import "ViewController.h"
#import "Day.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _days = [NSMutableArray new];
    
    [self populateDays];
}

- (void)populateDays {
    NSArray *jsonItems = [self JSONFromFile];
    NSLog(@"Json data: %@", jsonItems);
    
    for (NSDictionary * item in jsonItems) {
        NSString *date = (NSString *)item[@"date"];
        NSString *day = (NSString *)item[@"day"];
        NSString *ID = (NSString *)item[@"id"];
        
        Day *dayObject = [Day new];
        dayObject.day =  day;
        dayObject.date = date;
        dayObject.ID = ID;
        
        [_days addObject:dayObject];
        for (Day *day in _days) {
            NSLog(@"Date:- %@ Day:-%@ ID:-%@", day.date, day.day, day.ID);
        }
    }
}

- (id)JSONFromFile {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
