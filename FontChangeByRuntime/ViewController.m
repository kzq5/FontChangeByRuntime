//
//  ViewController.m
//  FontChangeByRuntime
//
//  Created by kangzhiqiang on 2018/12/24.
//  Copyright © 2018 kangxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *testLab = [UILabel new];
    testLab.frame = CGRectMake(20, 370, [UIScreen mainScreen].bounds.size.width-40, 20);
    testLab.textAlignment = NSTextAlignmentCenter;
    testLab.font = [UIFont systemFontOfSize:18];
    testLab.text = @"test label with code";
    [self.view addSubview:testLab];
}
//MarkerFelt-Thin

@end
