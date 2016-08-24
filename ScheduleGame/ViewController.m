//
//  ViewController.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "ViewController.h"
#import "ScheduledGameTableViewCell.h"
#import "FinishedGameTableViewCell.h"
#import "ByeGameTableViewCell.h"
#import "NetworkManager.h"
#import "Game.h"
#import "UIFont+TextFont.h"
#import "UIColor+TextColor.m"



@interface ViewController (){
    NSArray * _arraySchedule;
}

@end

@implementation ViewController
static NSString* kScheduleGameCellIdentifier = @"ScheduleGameCellIdentifier";
static NSString* kFinishedGameCellIdentifier = @"FinishedGameCellIdentifier";
static NSString* kByeGameCellIdentifier =      @"ByeGameCellIdentifier";
static NSString* kFetchData =                  @"http://files.yinzcam.com.s3.amazonaws.com/iOS/interviews/ScheduleExercise/schedule.xml";
static NSInteger kSectionHeight = 30;
static NSInteger kScheduleGameRowHeight = 145;
static NSInteger kFinishedGameRowHeight = 120;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[ScheduledGameTableViewCell class] forCellReuseIdentifier:kScheduleGameCellIdentifier];
    [self.tableView registerClass:[FinishedGameTableViewCell class] forCellReuseIdentifier:kFinishedGameCellIdentifier];
    [self.tableView registerClass:[ByeGameTableViewCell class] forCellReuseIdentifier:kByeGameCellIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationController.navigationBar.barTintColor = [UIColor bottleGreenColorFromHexString];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.title = NSLocalizedString(@"SCHEDULE", @"") ;
    UIImage *barImage = [UIImage imageNamed:@"menu.png"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:barImage style:UIBarButtonItemStylePlain target:nil action:@selector(leftBarButtonPressed)];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)leftBarButtonPressed
{
    //TODO: Add body
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.estimatedRowHeight = 71;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self fetchSchedule];
}

- (void)fetchSchedule
{
    __weak typeof(self) weakSelf = self;
    [NetworkManager fetchGameDataWithQuery:kFetchData block:^(NSArray *scheduleArray, NSError *error) {
        if ( ! error) {
            _arraySchedule = scheduleArray;
            dispatch_async(dispatch_get_main_queue(), ^{
                __typeof(self) strongSelf = weakSelf;
                [strongSelf.tableView reloadData];
                [strongSelf.tableView setHidden:NO];
            });
        }
        else {
            NSLog(@"%@",error.description);
        }
    }];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  _arraySchedule.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Schedule *objSchedule = [_arraySchedule objectAtIndex:section];
    return [objSchedule.scheduleGames count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Schedule *objSchedule = [_arraySchedule objectAtIndex:section];
    return  objSchedule.sectionHeader;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Schedule *objSchedule = _arraySchedule[indexPath.section];
    Game *game = objSchedule.scheduleGames[indexPath.row];
    if( [game.matchType isEqualToString:@"B"]){
        ByeGameTableViewCell* cell =[tableView dequeueReusableCellWithIdentifier:kByeGameCellIdentifier forIndexPath:indexPath];
        [cell updateCell:game];
        [cell updateConstraints];
        return cell;
    }
    if ([game.matchType isEqualToString:@"S"]) {
        ScheduledGameTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kScheduleGameCellIdentifier forIndexPath:indexPath];
        [cell updateCell:game];
        [cell updateConstraints];
        return cell;
    }
    FinishedGameTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kFinishedGameCellIdentifier forIndexPath:indexPath];
    [cell updateCell:game];
    [cell updateConstraints];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Schedule *objSchedule = [_arraySchedule objectAtIndex:indexPath.section];
    Game* game = [objSchedule.scheduleGames objectAtIndex:indexPath.row];
    if( [game.matchType isEqualToString:@"S"] ){ // Has no result yet
        return kScheduleGameRowHeight;
    }
    return kFinishedGameRowHeight;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, kSectionHeight)];
    UILabel* sectionTitle = [[UILabel alloc] init];
    sectionTitle.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = @{ @"view":sectionTitle};
    sectionTitle.text = [self tableView:tableView titleForHeaderInSection:section];
    [sectionTitle setTextAlignment:NSTextAlignmentCenter];
    sectionTitle.font = [UIFont getSmallMavenBold];
    sectionTitle.textColor = [UIColor grayColorFromHexString];
    [header setBackgroundColor:[UIColor lightGrayColorFromHexString]];
    [header addSubview:sectionTitle];
    [header addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view]-|" options:NSLayoutFormatAlignAllCenterX metrics:0 views:views]];
    [header addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-7-[view]-7-|" options:0 metrics:0 views:views]];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kSectionHeight;
}

@end
