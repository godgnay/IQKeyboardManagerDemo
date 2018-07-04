//
//  TableViewController.m
//  IQKeyboardManagerDemo
//
//  Created by shengyangyu on 2018/7/4.
//  Copyright © 2018年 godgnay. All rights reserved.
//

#import "TableViewController.h"
#import "TestViewController.h"

@interface TableViewController ()

@property (nonatomic, copy) NSArray *mArrays;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mArrays = @[@"normal show", @"error show"];
    self.tableView.tableFooterView = UIView.new;
    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedRowHeight = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.mArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell1"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell1"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.mArrays[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TestViewController *tVC = [[TestViewController alloc] initWithShowKeyboard:indexPath.row==1];
    [self.navigationController pushViewController:tVC animated:YES];
}

@end
