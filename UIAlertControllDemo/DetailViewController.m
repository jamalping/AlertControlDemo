//
//  DetailViewController.m
//  UIAlertControllDemo
//
//  Created by jamalping on 15-3-11.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)dealloc
{
    NSLog(@"DetailViewController dead");
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(0, 200, 100, 50);
    [button setTitle:@"showAlert" forState:UIControlStateNormal];
    button.tag = 0;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button1.frame = CGRectMake(200, 200, 100, 50);
    [button1 setTitle:@"showsheet" forState:UIControlStateNormal];
    button1.tag = 1;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    UIPopoverController
}

- (void)buttonAction:(UIButton *)button {
    switch (button.tag) {
        case 0:{
            [self showAlert:button];
        }break;
        case 1:{
            [self showSheet:button];
        }break;
            
        default:
            break;
    }
}

- (void)showSheet:(UIButton *)sender {
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"测试Alert" message:@"这是默认的alert样式" preferredStyle:UIAlertControllerStyleActionSheet];
    UIPopoverPresentationController *popover = alertControl.popoverPresentationController;
    if (popover) {
        popover.sourceView = sender;
        popover.sourceRect = sender.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    }
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //        [detailVC dismissViewControllerAnimated:alertControl completion:nil];
        NSLog(@"确定");
    }];
    
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"第一个" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"点击了第一个按钮");
    }];
    UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"第二个" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"点击了第二个按钮");
    }];
    
    [alertControl addAction:alertAction];
    [alertControl addAction:alertAction1];
    [alertControl addAction:alertAction2];
    [self presentViewController:alertControl animated:NO completion:nil];
}

- (void)showAlert:(UIButton *)sender {
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"测试Alert" message:@"这是默认的alert样式" preferredStyle:UIAlertControllerStyleAlert];
    UIPopoverPresentationController *popover = alertControl.popoverPresentationController;
    if (popover) {
        popover.sourceView = sender;
        popover.sourceRect = sender.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionDown;
    }
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //        [detailVC dismissViewControllerAnimated:alertControl completion:nil];
        NSLog(@"确定");
    }];
    
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"第一个" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"点击了第一个按钮");
    }];
    UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"第二个" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"点击了第二个按钮");
    }];
    
    [alertControl addAction:alertAction];
    [alertControl addAction:alertAction1];
    [alertControl addAction:alertAction2];
    [self presentViewController:alertControl animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
