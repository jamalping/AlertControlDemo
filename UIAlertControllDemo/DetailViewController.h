//
//  DetailViewController.h
//  UIAlertControllDemo
//
//  Created by jamalping on 15-3-11.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

