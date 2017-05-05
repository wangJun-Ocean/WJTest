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

- (void)testActionWith:(Bblock)block
{
    _byBlock = block;
    
    NSString *striData = @"TestPropertyInvoke say hello to VC";
    _byBlock(striData,^(id testData){
        NSLog(@"TestPropertyInvoke get response from VC: %@",testData);
    });
}


- (NSString *)returnStringWithBlock:(void (^)(NSString * _Nonnull, id _Nullable))success
{
    NSString *str = [NSString stringWithFormat:@"%@",success];
    return str;
}

@end
