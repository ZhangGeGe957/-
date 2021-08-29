//
//  MainTableViewCell.h
//  天气预报仿写
//
//  Created by 张佳乔 on 2021/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UIButton *button;

@end

NS_ASSUME_NONNULL_END
