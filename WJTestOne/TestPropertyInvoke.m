//
//  TestPropertyInvoke.m
//  WJTestOne
//
//  Created by 王俊 on 2017/3/9.
//  Copyright © 2017年 王俊. All rights reserved.
//

#import "TestPropertyInvoke.h"

@implementation TestPropertyInvoke

- (void)changeAValue:(int)newValue
{
    _a = newValue;
}

//- (void)changeAValue:(int)newValue
//{
//    self.a = newValue;
//}

- (void)changeBValue:(NSString *)newBValue andCValue:(NSString *)newCValue
{
    self.b = newBValue;
    _c = newCValue;
    NSLog(@"%@,%@",self.b,_c);
}

@end
