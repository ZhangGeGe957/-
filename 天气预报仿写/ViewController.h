//
//  ViewController.h
//  天气预报仿写
//
//  Created by 张佳乔 on 2021/8/8.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, NSURLSessionDataDelegate, NSURLSessionDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tableArray;
@property (nonatomic, strong) NSMutableArray *temperatureNowArray;
@property (nonatomic, strong) NSMutableArray *nameNowArray;
@property (nonatomic, strong) NSMutableArray *timeNowArray;
@property (nonatomic, strong) NSString *cityName;

@property (nonatomic, strong) NSMutableArray *oneData;

@property (nonatomic, copy) NSString *maxString;
@property (nonatomic, copy) NSString *minString;
@property (nonatomic, copy) NSString *nowString;
@property (nonatomic, copy) NSString *weaString;
@property (nonatomic, strong) NSMutableArray *weaArray;
@property (nonatomic, strong) NSMutableArray *timeArray;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *weaLabel;
@property (nonatomic, strong) NSMutableArray *weakDayArray;
@property (nonatomic, strong) NSMutableArray *weakImageArray;
@property (nonatomic, strong) NSMutableArray *weakmaxArray;
@property (nonatomic, strong) NSMutableArray *weakminArray;
@property (nonatomic, copy) NSString *airQuality;
@property (nonatomic, strong) NSMutableArray *endArray;
@property (nonatomic, strong) NSMutableArray *informationArray;

@property (nonatomic, strong) NSMutableArray *allInformationArray;

@end

