//
//  UIViewController+Swizzling.m
//  WJTestOne
//
//  Created by 王俊 on 2017/3/3.
//  Copyright © 2017年 王俊. All rights reserved.
//

#import <objc/runtime.h>
#import "UIViewController+Swizzling.h"

@implementation UIViewController (Swizzling)

+ (void)load
{
    [super load];
    Method ori_Method = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method my_Method = class_getInstanceMethod([self class], @selector(swizzlingViewDidLoad));
    if (!class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(my_Method), method_getTypeEncoding(my_Method))) {
        method_exchangeImplementations(ori_Method, my_Method);
    }
}

- (void)swizzlingViewDidLoad
{
    NSString *str = [NSString stringWithFormat:@"%@",[self class]];
    if (![str containsString:@"UI"]) {
        NSLog(@"统计打点： %@",self.class);
    }
    [self swizzlingViewDidLoad];
}

@end
