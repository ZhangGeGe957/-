//
//  ShowViewController.h
//  天气预报仿写
//
//  Created by 张佳乔 on 2021/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *backImage;
@property (nonatomic, strong) UIButton *increaseButton;
@property (nonatomic, strong) UIButton *weatherButton;

@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *weaLabel;
@property (nonatomic, strong) NSMutableArray *endArray;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray *transArray;
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) NSMutableArray *allInformationArray;

@end

NS_ASSUME_NONNULL_END
