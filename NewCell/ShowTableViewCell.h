//
//  ShowTableViewCell.h
//  天气预报仿写
//
//  Created by 张佳乔 on 2021/8/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *bigLabel;
@property (nonatomic, strong) UILabel *weatherLabel;
@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UILabel *maxLabel;
@property (nonatomic, strong) UILabel *minLabel;
@property (nonatomic, strong) UILabel *maxNameLabel;
@property (nonatomic, strong) UILabel *minNameLabel;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

NS_ASSUME_NONNULL_END
