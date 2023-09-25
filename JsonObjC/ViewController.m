//
//  ViewController.m
//  JsonObjC
//
//  Created by Alexander Zorinov on 2023-09-24.
//

#import "ViewController.h"
#import "Day.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, copy, nullable ) UIViewController* (^CreateController)(NSString *);
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _days = [NSMutableArray new];
    
    [self populateDays];
    
    [self populateTableView];
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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookmarkCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookmarkCell"];
    }
    
    Day *dayObject = [_days objectAtIndex:indexPath.row];
    cell.textLabel.text = dayObject.day;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_days count];
}

- (void)populateTableView {
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,  self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    [self.view addSubview:_myTableView];
}

@end
