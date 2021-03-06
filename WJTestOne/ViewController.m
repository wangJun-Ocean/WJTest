//
//  ViewController.m
//  WJTestOne
//
//  Created by 王俊 on 2016/12/8.
//  Copyright © 2016年 王俊. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Swizzling.h"
#import "TestPropertyInvoke.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self rangTest:@"nsmj2"];
//    [self testRange];
    [self rangTest:@"nsmj2"];
    NSLog(@"123");
    [self testRange];
    NSLog(@"456");
    NSLog(@"测试分支");
    NSLog(@"测试分支2");
    [self testBlock];
    
    [self testManyBlocks];
    
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    
}
- (IBAction)goToNextVCButtonClick:(id)sender {
}

//测试NSRange NSMutableCharacterSet
- (void)rangTest: (NSString *)str
{
     NSLog(@"测试分支aaa");
    NSLog(@"测试分支bbb");
    
    NSLog(@"78910");
    NSMutableCharacterSet *allowedCharacterset = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterset removeCharactersInString:str];
    static NSUInteger const batchSize = 2;
    
    NSUInteger index = 0;
    NSMutableString *escaped = @"".mutableCopy;
    while (index < str.length) {
        NSUInteger length = MIN(str.length - index, batchSize);
        NSRange range = NSMakeRange(index, length);
        range = [str rangeOfComposedCharacterSequencesForRange:range];
        
        NSString *substr = [str substringWithRange:range];
        
        NSString *encoded = [substr stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterset];
        [escaped appendString:encoded];
        
        index += range.length;
    }
    NSLog(@"%@",escaped);
}
//反转字符串
- (void)testRange
{
    NSLog(@"abc");
    NSString *temp1 = @"";
//    NSString *temp2 = @"";
    NSString *str1 = @"1234";
//    NSString *str2 = @"56789";
//    int i = 0;
//    int j = 0;
    int length1 = (int)str1.length;
//    int length2 = (int)str2.length;
    
    for (int i = length1 - 1; i >= 0 ; i--) {
        NSRange range = NSMakeRange(i, 1);
//
//        NSMakeRange(位置, 长度)
        temp1 = [temp1 stringByAppendingString:[str1 substringWithRange:range]];
        NSLog(@"%@",temp1);
    }
//    for (j = length2 - 1; j >= 0; j--) {
//        NSRange range = NSMakeRange(j, 1);
//        temp2 = [temp2 stringByAppendingString:[str2 substringWithRange:range]];
//        NSLog(@"%@",temp2);
//    }
    NSLog(@"test分支");
}

- (void)testBlock
{
    int x = 123;
    int y = 456;
    NSLog(@"test分支4");
    
    void(^aBlock)(int) = ^(int z) {
        printf("%d %d %d\n",x,y,z);
    };
    aBlock(789);
}

- (void)testBlockB
{
    int x = 123;
    int y = 456;
    void(^bBlock)(int) = ^(int z) {
        NSLog(@"%d %d %d",x,y,z);
    };
    bBlock(789);
}

- (void)testManyBlocks
{
    TestPropertyInvoke *testBlocks = [[TestPropertyInvoke alloc] init];
    [testBlocks testActionWith:^(id data, Ablock testBlock) {
        NSLog(@"get message from TestPropertyInvoke:%@",data);
        if (testBlock) {
            testBlock(@"response for message from VC");
        }
    }];
    
    void(^success)() = ^(NSString *dataStr, id test){
        
    };
}

@end
