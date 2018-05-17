//
//  ViewController.m
//  WYLogKitDemo
//
//  Created by Weep Yan on 2018/5/16.
//  Copyright © 2018年 Weep Yan. All rights reserved.
//

#import "ViewController.h"
#import <WYLogKit/WYLogKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [WYLogManager sharedLogManager].openLog = NO;
    
    CFAbsoluteTime startNSLog = CFAbsoluteTimeGetCurrent();
    for (int i = 0; i < 10000; i++) {
        NSLog(@"%d", i);
    }
    CFAbsoluteTime endNSLog = CFAbsoluteTimeGetCurrent();
    
    CFAbsoluteTime startPrintf = CFAbsoluteTimeGetCurrent();
    for (int i = 0; i < 10000; i++) {
        printf("%d\n", i);
    }
    CFAbsoluteTime endPrintf = CFAbsoluteTimeGetCurrent();
    
    CFAbsoluteTime startWY = CFAbsoluteTimeGetCurrent();
    for (int i = 0; i < 10000; i++) {
        WYLog(@"%d", i);
    }
    CFAbsoluteTime endWY = CFAbsoluteTimeGetCurrent();
    
    NSLog(@"NSLog time: %lf, printf time: %lf, wy time: %lf", endNSLog - startNSLog, endPrintf - startPrintf, endWY-startWY);
    NSLog(@"%lf", endNSLog - startNSLog - (endWY-startWY));
    
    [WYLogManager sharedLogManager].openLog = YES;
    
    WYLog(@"str: %s", "我是str");
    
    WYLog(@"char: %c", 'c');
    WYLog(@"short: %hi %hx %ho", (short)10, (short)10, (short)10);
    WYLog(@"unsigned short: %hu %hx %ho", (unsigned short)10, (unsigned short)10, (unsigned short)10);
    WYLog(@"int: %i %x %o", 10, 10, 10);
    WYLog(@"int: %X", 10);
    
    WYLog(@"long: %li %lx %lo", (long)10, (long)10, (long)10);
    WYLog(@"unsigned long: %lu %lx %lo", (unsigned long)10, (unsigned long)10, (unsigned long)10);
    WYLog(@"long long: %lli %llx %llo", (long long)10, (long long)10, (long long)10);
    WYLog(@"unsigned long long: %llu %llx %llo", (unsigned long long)10, (unsigned long long)10, (unsigned long long)10);
    WYLog(@"d: %d", 10);
    WYLog(@"size_t: %zu", (size_t)10);
    
    WYLog(@"float: %f %e %g %a", (float)10, (float)10, (float)10, (float)10);
    WYLog(@"double: %f %e %g %a", (double)10, (double)10, (double)10, (double)10);
    
    WYLog(@"long double: %Lf %Le %Lg", (long double)10, (long double)10, (long double)10);
    WYLog(@"%dd@d%@@@%%%%", 10, self);
    WYLog(@"%p", self);
    
    [WYLogManager sharedLogManager].openLog = YES;
    WYLog(@"开启 Log");
    WYDevLog(@"DevLog 并没有开启，还是 Log");
    
    [WYLogManager sharedLogManager].openLog = NO;
    [WYLogManager sharedLogManager].openDevLog = YES;
    WYDevLog(@"开启 DevLog ");
    WYLog(@"Log 也开启");
    
    [WYLogManager sharedLogManager].openDevLog = YES;
    [WYLogManager sharedLogManager].openLog = NO;
    WYDevLog(@"关闭Log，DevLog 也关闭");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
