//
//  ShowTableViewCell.m
//  天气预报仿写
//
//  Created by 张佳乔 on 2021/8/9.
//

#import "ShowTableViewCell.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@implementation ShowTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"show"]) {
        self.bigLabel = [[UILabel alloc] init];
        self.bigLabel.font = [UIFont systemFontOfSize:28];
        self.bigLabel.textAlignment = NSTextAlignmentCenter;
        self.bigLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.bigLabel];
        
        self.weatherLabel = [[UILabel alloc] init];
        self.weatherLabel.font = [UIFont systemFontOfSize:18];
        self.weatherLabel.textAlignment = NSTextAlignmentCenter;
        self.weatherLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.weatherLabel];
        
        self.temperatureLabel = [[UILabel alloc] init];
        self.temperatureLabel.font = [UIFont systemFontOfSize:88];
        self.temperatureLabel.textAlignment = NSTextAlignmentCenter;
        self.temperatureLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.temperatureLabel];
        
        self.minLabel = [[UILabel alloc] init];
        self.minLabel.font = [UIFont systemFontOfSize:18];
        self.minLabel.textAlignment = NSTextAlignmentCenter;
        self.minLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.minLabel];
        
        self.maxLabel = [[UILabel alloc] init];
        self.maxLabel.font = [UIFont systemFontOfSize:18];
        self.maxLabel.textAlignment = NSTextAlignmentCenter;
        self.maxLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.maxLabel];
        
        self.maxNameLabel = [[UILabel alloc] init];
        self.maxNameLabel.font = [UIFont systemFontOfSize:18];
        self.maxNameLabel.textAlignment = NSTextAlignmentCenter;
        self.maxNameLabel.textColor = [UIColor whiteColor];
        self.maxNameLabel.text = @"最高";
        [self.contentView addSubview:self.maxNameLabel];
        
        self.minNameLabel = [[UILabel alloc] init];
        self.minNameLabel.font = [UIFont systemFontOfSize:18];
        self.minNameLabel.textAlignment = NSTextAlignmentCenter;
        self.minNameLabel.textColor = [UIColor whiteColor];
        self.minNameLabel.text = @"最低";
        [self.contentView addSubview:self.minNameLabel];
    } else if ([self.reuseIdentifier isEqualToString:@"seven"]){
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.scrollEnabled = YES;
        self.scrollView.showsVerticalScrollIndicator = FALSE;
        self.scrollView.showsHorizontalScrollIndicator = FALSE;
        self.scrollView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.scrollView];
    } else if ([self.reuseIdentifier isEqualToString:@"weak"]) {
        self.bigLabel = [[UILabel alloc] init];
        self.bigLabel.font = [UIFont systemFontOfSize:18];
        self.bigLabel.textAlignment = NSTextAlignmentCenter;
        self.maxLabel = [[UILabel alloc] init];
        self.maxLabel.font = [UIFont systemFontOfSize:18];
        self.maxLabel.textAlignment = NSTextAlignmentCenter;
        self.minLabel = [[UILabel alloc] init];
        self.minLabel.font = [UIFont systemFontOfSize:18];
        self.minLabel.textAlignment = NSTextAlignmentCenter;
    } else if ([self.reuseIdentifier isEqualToString:@"tips"]) {
        self.bigLabel = [[UILabel alloc] init];
        self.bigLabel.numberOfLines = 0;
        self.bigLabel.font = [UIFont systemFontOfSize:18];
        self.bigLabel.textColor = [UIColor whiteColor];
        self.bigLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.bigLabel];
    } else if ([self.reuseIdentifier isEqualToString:@"air"]) {
        self.bigLabel = [[UILabel alloc] init];
        self.bigLabel.font = [UIFont systemFontOfSize:18];
        self.bigLabel.textColor = [UIColor whiteColor];
        self.bigLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.bigLabel];
        
        self.temperatureLabel = [[UILabel alloc] init];
        self.temperatureLabel.font = [UIFont systemFontOfSize:22];
        self.temperatureLabel.textColor = [UIColor whiteColor];
        self.temperatureLabel.numberOfLines = 0;
        self.temperatureLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.temperatureLabel];
    } else if ([self.reuseIdentifier isEqualToString:@"more"]) {
        self.bigLabel = [[UILabel alloc] init];
        self.bigLabel.font = [UIFont systemFontOfSize:18];
        
        self.weatherLabel = [[UILabel alloc] init];
        self.weatherLabel.font = [UIFont systemFontOfSize:18];
        
        self.temperatureLabel = [[UILabel alloc] init];
        
        self.minLabel = [[UILabel alloc] init];
    }
    return self;
}

- (void)layoutSubviews {
    if ([self.reuseIdentifier isEqualToString:@"show"]) {
        self.bigLabel.frame = CGRectMake(0, 5, width, 50);
        self.weatherLabel.frame = CGRectMake(0, 55, width, 30);
        self.temperatureLabel.frame = CGRectMake(0, 85, width, 80);
        self.maxNameLabel.frame = CGRectMake(135, 170, 40, 30);
        self.minNameLabel.frame = CGRectMake(220, 170, 40, 30);
        self.maxLabel.frame = CGRectMake(170, 170, 50, 30);
        self.minLabel.frame = CGRectMake(255, 170, 50, 30);
    } else if ([self.reuseIdentifier isEqualToString:@"seven"]) {
        self.scrollView.frame = CGRectMake(0, 0, width, 100);
        self.scrollView.contentSize = CGSizeMake(width * 2 + 100, 100);
    } else if ([self.reuseIdentifier isEqualToString:@"tips"]) {
        self.bigLabel.frame = CGRectMake(0, 0, width, 70);
    } else if ([self.reuseIdentifier isEqualToString:@"air"]) {
        self.bigLabel.frame = CGRectMake(10, 0, 100, 30);
        self.temperatureLabel.frame = CGRectMake(10, 20, width - 20, 60);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
