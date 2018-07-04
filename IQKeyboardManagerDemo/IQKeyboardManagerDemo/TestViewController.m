//
//  TestViewController.m
//  IQKeyboardManagerDemo
//
//  Created by shengyangyu on 2018/7/4.
//  Copyright © 2018年 godgnay. All rights reserved.
//

#import "TestViewController.h"

#import <Masonry/Masonry.h>

@interface TestViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *mIDTextField;
@property (nonatomic, strong) UIButton *mNextButton;
@property (nonatomic, assign) BOOL mShowKeyboard;

@end

@implementation TestViewController

- (instancetype)initWithShowKeyboard:(BOOL)show {
    
    if (self = [super init]) {
        _mShowKeyboard = show;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"Test";
    [self setUI];
}

- (void)setUI {
    UILabel * tip1Label = [UILabel new];
    tip1Label.backgroundColor = self.view.backgroundColor;
    tip1Label.font = [UIFont systemFontOfSize:20];
    tip1Label.textColor = [UIColor redColor];
    tip1Label.text = @"id number";
    [self.view addSubview:tip1Label];
    [tip1Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(30);
        make.centerX.offset(0);
    }];
    
    UILabel * tip2Label = [UILabel new];
    tip2Label.backgroundColor = self.view.backgroundColor;
    tip2Label.font = [UIFont systemFontOfSize:14];
    tip2Label.textColor = [UIColor redColor];
    tip2Label.text = @"please input your id number";
    [self.view addSubview:tip2Label];
    [tip2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tip1Label.mas_bottom).offset(10);
        make.centerX.offset(0);
    }];
    
    UIView *tContinerView = [UIView new];
    tContinerView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:tContinerView];
    [tContinerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tip2Label.mas_bottom).offset(20);
        make.right.offset(0);
        make.left.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    if (self.mShowKeyboard) {
        [self.mIDTextField becomeFirstResponder];
    }
    
    [tContinerView addSubview:self.mIDTextField];
    [self.mIDTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.offset(-15);
        make.left.offset(15);
        make.height.mas_equalTo(49);
    }];
    
    [self.view addSubview:self.mNextButton];
    [self.mNextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tContinerView.mas_bottom).offset(20);
        make.height.mas_equalTo(43);
        make.right.offset(-15);
        make.left.offset(15);
    }];
}

- (void)tjBtnClick:(UIButton *)sender {
    
    [self.view endEditing:YES];
}

- (void)textFieldDidChange:(UITextField *)textField {
    if (self.mIDTextField.text.length == 0) {
        self.mNextButton.enabled = NO;
    } else {
        self.mNextButton.enabled = YES;
    }
    if (textField.text.length > 30) {
        textField.text = [textField.text substringToIndex:30];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <setter getter>
- (UITextField *)mIDTextField {
    
    if(!_mIDTextField) {
        _mIDTextField = [UITextField new];
        _mIDTextField.delegate = self;
        _mIDTextField.textColor = [UIColor blueColor];
        _mIDTextField.font = [UIFont systemFontOfSize:16];
        _mIDTextField.placeholder = @"id number";
        [_mIDTextField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
        [_mIDTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _mIDTextField;
}

- (UIButton *)mNextButton {
    
    if(!_mNextButton) {
        _mNextButton = [UIButton new];
        [_mNextButton setTitle:@"next，phone code" forState:UIControlStateNormal];
        [_mNextButton addTarget:self action:@selector(tjBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _mNextButton.enabled = NO;
    }
    return _mNextButton;
}

@end
