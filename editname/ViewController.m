//
//  ViewController.m
//  editname
//
//  Created by eall_linger on 16/5/9.
//  Copyright © 2016年 eall_linger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getList];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)getList
{
    NSString *path = @"/Users/eall_linger/Desktop/万业源/JLEkeImages";
    NSFileManager* fm=[NSFileManager defaultManager];
    NSArray *files = [fm subpathsAtPath: path];
    NSLog(@"%@",files);

    for(NSInteger i = 0 ;i<files.count;i++){
        NSString *url = @"";
        if ([files[i] hasSuffix:@"png"]) {
            url = files[i];
        }else{
            continue;
        }
        NSError * error;
        
        NSArray *array = [url componentsSeparatedByString:@"@"];
        if (array.count>1) {
            if ([array[1] isEqualToString:@"2x.png"]) {
                NSLog(@"@2x 是  %@",url);
                NSString *path1 = [NSString stringWithFormat:@"/Users/eall_linger/Desktop/万业源/2xpng/%@.png",array[0]];
                NSString *currentPath = [NSString stringWithFormat:@"%@/%@",path,url];
                [fm copyItemAtPath:currentPath toPath:path1 error:&error];
            }
            if ([array[1] isEqualToString:@"3x.png"]) {
                NSLog(@"@3x 是  %@",url);
                NSString *path1 = [NSString stringWithFormat:@"/Users/eall_linger/Desktop/万业源/3xpng/%@.png",array[0]];
                NSString *currentPath = [NSString stringWithFormat:@"%@/%@",path,url];
                [fm copyItemAtPath:currentPath toPath:path1 error:&error];
            }

        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
