//
//  TestPropertyInvoke.h
//  WJTestOne
//
//  Created by 王俊 on 2017/3/9.
//  Copyright © 2017年 王俊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestPropertyInvoke : NSObject

@property int a;
@property (copy) NSString *b, *c;
- (void)changeAValue:(int)newValue;
- (void)changeBValue:(NSString *)newBValue andCValue:(NSString *)newCValue;

@end
