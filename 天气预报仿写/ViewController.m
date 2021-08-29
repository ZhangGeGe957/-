//
//  ViewController.m
//  天气预报仿写
//
//  Created by 张佳乔 on 2021/8/8.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "MainTableViewCell.h"
#import "ShowViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableArray = [[NSMutableArray alloc] init];
    [self.tableArray addObject:@""];
    [self loadControl];
}

- (void)loadControl {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.allInformationArray = [[NSMutableArray alloc] init];
    
    self.timeNowArray = [[NSMutableArray alloc] init];
    self.nameNowArray = [[NSMutableArray alloc] init];
    self.cityName = [[NSString alloc] init];
    self.temperatureNowArray = [[NSMutableArray alloc] init];
    self.oneData = [[NSMutableArray alloc] init];
    
    self.maxString = [[NSString alloc] init];
    self.minString= [[NSString alloc] init];
    self.nowString = [[NSString alloc] init];
    self.weaString = [[NSString alloc] init];
    self.timeArray = [[NSMutableArray alloc] init];
    self.weaArray = [[NSMutableArray alloc] init];
    self.imageArray = [[NSMutableArray alloc] init];
    self.timeLabel = [[UILabel alloc] init];
    self.weaLabel = [[UILabel alloc] init];
    self.imageView = [[UIImageView alloc] init];
    self.weakDayArray = [[NSMutableArray alloc] init];
    self.weakImageArray = [[NSMutableArray alloc] init];
    self.weakmaxArray = [[NSMutableArray alloc] init];
    self.weakminArray = [[NSMutableArray alloc] init];
    self.airQuality = [[NSString alloc] init];
    self.endArray = [[NSMutableArray alloc] initWithObjects:@"日出", @"日落", @"能见度", @"气压hPa", @"空气质量", @"湿度", @"风向", @"风力等级", nil];
    self.informationArray = [[NSMutableArray alloc] init];
    
    self.cityName = _tableArray[0];
    [self creatUrl];
    
    [self.allInformationArray addObject:self.oneData];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, width, height - 50) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"main"];
    [self.tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"head"];
    [self.tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"button"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(increaseCity:) name:@"city" object:nil];
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == self.temperatureNowArray.count) {
        MainTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"button" forIndexPath:indexPath];
        [cell.button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.button setImage:[UIImage imageNamed:@"sousuo.png"] forState:UIControlStateNormal];
        cell.backgroundColor = [UIColor blackColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        if (indexPath.row == 0) {
            MainTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"head" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor whiteColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.timeLabel.text = @"我的位置";
            cell.cityLabel.text = _nameNowArray[0];
            cell.temperatureLabel.text = _temperatureNowArray[0];
            return cell;
        } else {
            MainTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"main" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor whiteColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.timeLabel.text = _timeNowArray[indexPath.row];
            cell.cityLabel.text = _nameNowArray[indexPath.row];
            cell.temperatureLabel.text = _temperatureNowArray[indexPath.row];
            return cell;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _temperatureNowArray.count + 1;
}

- (void)increaseCity:(NSNotification*)message {
    NSInteger num = 0;
    NSString *stringOne = [[NSString alloc] init];
    NSString *stringTwo = message.userInfo[@"now"];
    NSDate *timeDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *locationString = [dateFormatter stringFromDate:timeDate];
    stringOne = message.userInfo[@"city"];
    
    NSMutableArray *all = [[NSMutableArray alloc] init];
    all = message.userInfo[@"all"];
    
    for (int i = 0; i < self.nameNowArray.count; i++) {
        if ([stringOne isEqualToString:self.nameNowArray[i]]) {
            num = 1;
        }
    }
    if (num == 0) {
        [self.nameNowArray addObject:stringOne];
        [self.temperatureNowArray addObject:stringTwo];
        [self.timeNowArray addObject:locationString];
        [self.allInformationArray addObject:all];
        [self.tableView reloadData];
    }
}

- (void)pressButton:(UIButton*)button {
    SearchViewController *search = [[SearchViewController alloc] init];
    [self presentViewController:search animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != _temperatureNowArray.count) {
        ShowViewController *show = [[ShowViewController alloc] init];
        show.modalPresentationStyle = UIModalPresentationFullScreen;
        MainTableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
        show.transArray = [[NSMutableArray alloc] init];
        show.transArray = self.nameNowArray;
        show.number = self.nameNowArray.count;
        for (int i = 0; i < self.nameNowArray.count; i++) {
            if ([cell.cityLabel.text isEqualToString:self.nameNowArray[i]]) {
                show.index = i;
            }
        }
        show.allInformationArray = [[NSMutableArray alloc] init];
        show.allInformationArray = self.allInformationArray;
        [self presentViewController:show animated:YES completion:nil];
    }
}

- (void)creatUrl {
    NSString *urlString = [NSString stringWithFormat:@"https://tianqiapi.com/api?version=v1&appid=99184696&appsecret=JS3pjzUZ&city=%@", _cityName];
    //处理字符
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //创建URL
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *session1 = [NSURLSession sharedSession];
    
    NSURLSessionTask *task1 = [session1 dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            //解析数据
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            NSMutableString *stringOne = [NSMutableString stringWithFormat:@"%@",dic[@"data"][0][@"tem"]];
            NSMutableString *stringTwo = [NSMutableString stringWithFormat:@"%@",dic[@"city"]];
            NSDate *timeDate = [NSDate date];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"HH:mm"];
            NSString *locationString = [dateFormatter stringFromDate:timeDate];
            [self->_temperatureNowArray addObject:stringOne];
            [self->_nameNowArray addObject:stringTwo];
            [self->_timeNowArray addObject:locationString];
            
            NSDictionary *secondDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            self.maxString = secondDictionary[@"data"][0][@"tem1"];
            self.minString = secondDictionary[@"data"][0][@"tem2"];
            self.nowString = secondDictionary[@"data"][0][@"tem"];
            self.weaString = secondDictionary[@"data"][0][@"wea"];
            self.airQuality = secondDictionary[@"data"][0][@"air_tips"];
            NSMutableArray *allArray = [[NSMutableArray alloc] init];
            allArray = secondDictionary[@"data"][0][@"hours"];
            for (int i = 0; i < allArray.count; i++) {
                [self->_timeArray addObject:allArray[i][@"hours"]];
                [self->_weaArray addObject:allArray[i][@"tem"]];
                [self->_imageArray addObject:allArray[i][@"wea_img"]];
            }
            NSMutableArray *weakArray = [[NSMutableArray alloc] init];
            weakArray = secondDictionary[@"data"];
            for (int i = 0; i < weakArray.count - 1; i++) {
                [self->_weakDayArray addObject:weakArray[i + 1][@"week"]];
                [self->_weakImageArray addObject:weakArray[i + 1][@"wea_img"]];
                [self->_weakmaxArray addObject:weakArray[i + 1][@"tem1"]];
                [self->_weakminArray addObject:weakArray[i + 1][@"tem2"]];
            }
            [self->_informationArray addObject:secondDictionary[@"data"][0][@"sunrise"]];
            [self->_informationArray addObject:secondDictionary[@"data"][0][@"sunset"]];
            [self->_informationArray addObject:secondDictionary[@"data"][0][@"visibility"]];
            [self->_informationArray addObject:secondDictionary[@"data"][0][@"pressure"]];
            [self->_informationArray addObject:secondDictionary[@"data"][0][@"air"]];
            [self->_informationArray addObject:secondDictionary[@"data"][0][@"humidity"]];
            [self->_informationArray addObject:secondDictionary[@"data"][0][@"win"][0]];
            [self->_informationArray addObject:secondDictionary[@"data"][0][@"win_speed"]];
            
            if ([self.cityName isEqualToString:@""]) {
                [self->_oneData addObject:stringTwo];
                [self->_oneData addObject:self.maxString];
                [self->_oneData addObject:self.minString];
                [self->_oneData addObject:self.nowString];
                [self->_oneData addObject:self.weaString];
                [self->_oneData addObject:self.airQuality];
                [self->_oneData addObject:self.timeArray];
                [self->_oneData addObject:self.weaArray];
                [self->_oneData addObject:self.imageArray];
                [self->_oneData addObject:self.weakDayArray];
                [self->_oneData addObject:self.weakImageArray];
                [self->_oneData addObject:self.weakmaxArray];
                [self->_oneData addObject:self.weakminArray];
                [self->_oneData addObject:self.informationArray];
            }
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self->_tableView reloadData];
            }];
        }
    }];
    [task1 resume];
}


@end
