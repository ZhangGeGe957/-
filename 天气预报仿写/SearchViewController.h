//
//  SearchViewController.h
//  天气预报仿写
//
//  Created by 张佳乔 on 2021/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, NSURLSessionDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) NSMutableArray *cityArray;


@end

NS_ASSUME_NONNULL_END
