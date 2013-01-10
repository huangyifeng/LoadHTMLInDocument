//
//  ViewController.m
//  LoadHTMLInDocument
//
//  Created by huang yifeng on 13-1-9.
//  Copyright (c) 2013年 aimob. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)loadTemplate;
- (void)loadContent:(NSString *)contentName;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTemplate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private

- (void)loadTemplate
{
//    NSBundle *tempBundle = [NSBundle bundleWithIdentifier:@"com.aimob.tempBundle"];
    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Temp" ofType:@"bundle"];
    NSBundle *tempBundle = [NSBundle bundleWithPath:bundlePath];
    
    NSError *error = nil;
    [tempBundle loadAndReturnError:&error];
    
    NSString *templatePath = [NSString  stringWithFormat:@"%@/Contents/MyTemplate.html",bundlePath];
//    NSString *templatePath = [tempBundle pathForResource:@"MyTemplate" ofType:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:templatePath]]];
}

- (void)loadContent:(NSString *)contentName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", [paths objectAtIndex:0],contentName];
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSString *js = [NSString stringWithFormat:@"setContent(\"%@\");",content];
//    [self.webView stringByEvaluatingJavaScriptFromString:@"setContent('a\na')"];
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}

#pragma mark - IBAction

- (void)btn1tap:(id)sender
{
    [self loadContent:@"content1.html"];
}

- (void)btn2tap:(id)sender
{
    [self loadContent:@"content2.html"];
}

@end
