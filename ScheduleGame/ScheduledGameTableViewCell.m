//
//  ScheduledTableViewCell.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "ScheduledGameTableViewCell.h"
#import "UIFont+TextFont.h"
#import "UIColor+TextColor.h"
#import "UILabel+TextLabel.h"
#import "UIImage+Logo.h"
#import "NSDate+Match.h"
@interface ScheduledGameTableViewCell()
@end;

@implementation ScheduledGameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    // Configure the view for the selected state
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //        self.separatorInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, self.bounds.size.width);
        self.teamFirstName = [[UILabel alloc]init];
        [self.teamFirstName createLabelWithAlignment:NSTextAlignmentLeft labelTextColor:[UIColor blackColorFromHexString] labelTextFont:[UIFont getSmallLeagueGothic]];
        
        self.teamOpponentName = [[UILabel alloc]init];
        [self.teamOpponentName createLabelWithAlignment:NSTextAlignmentRight labelTextColor:[UIColor blackColorFromHexString] labelTextFont:[UIFont getSmallLeagueGothic]];
        
        self.teamFirstScore = [[UILabel alloc]init];
        [self.teamFirstScore createLabelWithAlignment:NSTextAlignmentLeft labelTextColor:[UIColor grayColorFromHexString] labelTextFont:[UIFont getSmallMavenBold]];
        
        self.teamOpponentScore = [[UILabel alloc]init];
        [self.teamOpponentScore createLabelWithAlignment:NSTextAlignmentRight labelTextColor:[UIColor grayColorFromHexString] labelTextFont:[UIFont getSmallMavenBold]];
        
        
        self.teamFirstImage = [[UIImageView alloc] init];
        self.teamFirstImage.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.teamOpponentImage = [[UIImageView alloc] init];
        self.teamOpponentImage.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.lineImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_divider"]];
        self.lineImage.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.lineImage.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.atLabel = [[UILabel alloc] init];
        [self.atLabel createLabelWithAlignment:NSTextAlignmentLeft labelTextColor:[UIColor grayColorFromHexString] labelTextFont:[UIFont getSmallLeagueGothic]];
        
        self.matchDate = [[UILabel alloc]init];
        [self.matchDate createLabelWithAlignment:NSTextAlignmentLeft labelTextColor:[UIColor blackColorFromHexString] labelTextFont:[UIFont getExtraSmallMavenPro]];
        
        self.matchTime = [[UILabel alloc]init];
        [self.matchTime createLabelWithAlignment:NSTextAlignmentRight labelTextColor:[UIColor blackColorFromHexString] labelTextFont:[UIFont getExtraSmallMavenPro]];
        
        self.seasonWeek = [[UILabel alloc]init];
        [self.seasonWeek createLabelWithAlignment:NSTextAlignmentLeft labelTextColor:[UIColor grayColorFromHexString] labelTextFont:[UIFont getExtraSmallMavenPro]];
        
        self.broadcastChannel = [[UILabel alloc]init];
        [self.broadcastChannel createLabelWithAlignment:NSTextAlignmentLeft labelTextColor:[UIColor blackColorFromHexString] labelTextFont:[UIFont getExtraSmallMavenPro]];
        
        [self.contentView addSubview:self.teamFirstName];
        [self.contentView addSubview:self.teamOpponentScore];
        [self.contentView addSubview:self.teamFirstScore];
        [self.contentView addSubview:self.teamOpponentName];
        [self.contentView addSubview:self.teamFirstImage];
        [self.contentView addSubview:self.teamOpponentImage];
        [self.contentView addSubview:self.atLabel];
        [self.contentView addSubview:self.matchDate];
        [self.contentView addSubview:self.seasonWeek];
        [self.contentView addSubview:self.matchTime];
        [self.contentView addSubview:self.broadcastChannel];
        [self.contentView addSubview:self.lineImage];
    }
    return self;
}
- (void)updateCell:(Game *)game
{
    self.teamFirstScore.text = game.first.record;
    self.teamOpponentScore.text = game.opponent.record;
    self.teamFirstName.text = game.first.name;
    self.teamOpponentName.text = game.opponent.name;
    self.matchDate.text = [NSDate convertDateToDay:game.matchDate];
    self.matchTime.text = [NSDate convertDateToTime:game.matchDate];
    self.seasonWeek.text = game.seasonWeek;
    self.broadcastChannel.text = game.broadcastChannel;
    [UIImage fetchLogo:game.first.logo block:^(UIImage *image) {
        self.teamFirstImage.image =image;
    }];
    [UIImage fetchLogo:game.opponent.logo block:^(UIImage *image) {
        self.teamOpponentImage.image =image;
    }];
    self.atLabel.text = @"@";
    //     [self updateConstraints];
    
}

- (void)updateConstraints
{
    NSMutableArray<NSLayoutConstraint*> *layoutContraints = [[NSMutableArray alloc] init];
    NSDictionary *views = @{ @"teamFirstName"    : self.teamFirstName,
                             @"teamFirstScore"   : self.teamFirstScore,
                             @"matchDate"        : self.matchDate,
                             @"broadcastChannel" : self.broadcastChannel,
                             @"teamFirstImage"   : self.teamFirstImage,
                             @"teamOpponentName" : self.teamOpponentName,
                             @"teamOpponentScore": self.teamOpponentScore,
                             @"matchTime"        : self.matchTime,
                             @"teamOpponentImage": self.teamOpponentImage,
                             @"seasonWeek"       : self.seasonWeek,
                             @"lineImage"        : self.lineImage,
                             };
    NSDictionary *metrics = @{};
    
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[teamFirstName(==150)]" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[teamFirstName(==22)]" options:0 metrics:metrics views:views]];
    ////
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[teamFirstScore(==92)]" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[teamFirstName]-6-[teamFirstScore(==36)]" options:0 metrics:metrics views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[matchDate(==92)]" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[teamFirstScore]-8-[matchDate(==20)]" options:0 metrics:metrics views:views]];
    //
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-102-[teamFirstImage(==40)]" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[teamFirstImage(==40)]" options:0 metrics:metrics views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[lineImage]|" options:0 metrics:0 views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[lineImage(1)]" options:0 metrics:0 views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[teamOpponentName(==150)]-10-|" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[teamOpponentName(==22)]" options:0 metrics:metrics views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[teamOpponentScore(==92)]-10-|" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[teamOpponentName]-6-[teamOpponentScore(==36)]" options:0 metrics:metrics views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[matchTime(==92)]-10-|" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[teamOpponentScore]-8-[matchTime(==20)]" options:0 metrics:metrics views:views]];
    
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[teamOpponentImage(==40)]-102-|" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[teamOpponentImage(==40)]" options:0 metrics:metrics views:views]];
    
    [layoutContraints addObject:[self.seasonWeek.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor]];
    [layoutContraints addObject:[self.seasonWeek.centerYAnchor constraintEqualToAnchor:self.matchDate.centerYAnchor]];
    
    [layoutContraints addObject:[self.atLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor]];
    [layoutContraints addObject:[self.atLabel.centerYAnchor constraintEqualToAnchor:self.teamFirstScore.centerYAnchor]];
    
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[broadcastChannel]" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[matchDate]-8-[broadcastChannel]" options:0 metrics:metrics views:views]];
    
    
    [NSLayoutConstraint activateConstraints:layoutContraints];
    [super updateConstraints];
    
}


@end
