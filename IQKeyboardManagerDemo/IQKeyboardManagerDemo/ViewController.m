//
//  ViewController.m
//  IQKeyboardManagerDemo
//
//  Created by shengyangyu on 2018/7/4.
//  Copyright © 2018年 godgnay. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)startTestAction:(id)sender {
    
    TableViewController *tVC = TableViewController.new;
    [self.navigationController pushViewController:tVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
