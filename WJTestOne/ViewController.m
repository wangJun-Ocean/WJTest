//
//  ViewController.m
//  WJTestOne
//
//  Created by 王俊 on 2016/12/8.
//  Copyright © 2016年 王俊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self rangTest:@"nsmj2"];
    NSLog(@"123");
    [self testRange];
    NSLog(@"456");
}

//测试NSRange NSMutableCharacterSet
- (void)rangTest: (NSString *)str
{
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

}

@end
