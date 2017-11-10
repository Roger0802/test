//
//  main.m
//  NSString
//
//  Created by Victor on 15/7/8.
//  Copyright (c) 2015年 Victor. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - NSString创建
void stringCreate() {
    
    
//    char *s="Vcitor is handsome";  C语言中字符串
    
    // 不需要释放
    NSString *str1=@"Victor is handsome";
    
    //需要释放
    NSString *str2=[[NSString alloc] init ];
    
    str2=@"Victor is cool";
    
    [str2 release];
    
    
    NSString *str3=[[NSString alloc] initWithString:@"Victor is strong"] ;
    
    [str3 release];
    
    //不需要管理内存
    str3=[NSString stringWithString:@"Victor run!"];
    
    
    NSString *str4=[[NSString alloc] initWithUTF8String:"Victor is smart"];
    
    [str4 release];
    
    str4=[NSString stringWithUTF8String:"Victor drink"];
    
    
    NSString *str5=[[NSString alloc] initWithFormat:@"Victor's age is %i and height is %.2f",29,1.78f];
    
    
    //这句代码放这里是错误的，会造成2个错误 。  1. 前面的创建的字符串没有被释放 2后面创建的字符串会释放过度，野指针错误
//    str5=[NSString stringWithFormat:@"Victor's age is %i and height is %.2f",29,1.78f];
    
    NSLog(@"str5:%@",str5);
    
    [str5 release];
    
    str5=[NSString stringWithFormat:@"Victor's age is %i and height is %.2f",29,1.78f];
    
    
}


void stringCreate2() {

    NSError *error=nil;
    
    NSString *path=@"/Users/Victor/Desktop/text1";
    
    NSString *str1=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if (error==nil) {
        NSLog(@"读取文件成功：%@",str1);
    }else{
        NSLog(@"读取文件失败：%@",error);
    };
    
    
//    NSURL *url=[NSURL URLWithString:@"file:///Users/Victor/Library/Mobile\ Documents/com\~apple\~TextEdit/Documents/91.rtf"];
//    
//    NSString *str2=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
//    
//    if (error==nil) {
//        NSLog(@"读取文件成功：%@",str2);
//    }else{
//        NSLog(@"读取文件失败：%@",error);
//    };
    
    NSURL *url2=[NSURL URLWithString:@"http://www.baidu.com"];
    NSString *str3=[NSString stringWithContentsOfURL:url2 encoding:NSUTF8StringEncoding error:&error];
    
    if (error==nil) {
        NSLog(@"读取文件成功：%@",str3);
    }else{
        NSLog(@"读取文件失败：%@",error);
    };

}


void test(NSString **str) {
    
    (*str)=@"123";

}


#pragma mark - String 导出
void stringExport() {
    
    
    //如果文件不存在，会自动创建
    NSString *path=@"/Users/Victor/Desktop/text1";
    
    NSError *error=nil;
    
    NSString *str1=@"123456我是字符串！！";
    
   
    //YES 代表要进行原子性操作，也就是先创建一个temp临时文件，把内容写进去，写成功后，再把临时文件的内容拷贝到目标文件
    // encoding 制定错误也会报错  NSISOLatin1StringEncoding
    [str1 writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        // [error localizedDescription] 返回错误的主要信息
        NSLog(@"写入文件失败，错误：%@",[error localizedDescription]);
    } else {
        NSLog(@"写入文件成功");
    };
    
    
}


int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
//        stringCreate();
//        
//        stringCreate2();
        
//        NSString *s=@"456";
//        
//        test(&s);
//        
//        NSLog(@"%@",s);
        
        stringExport();
        
        
    }
    
    return 0;
}
