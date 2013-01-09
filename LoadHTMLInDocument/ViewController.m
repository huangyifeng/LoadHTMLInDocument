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
    NSString *templatePath = [[NSBundle mainBundle] pathForResource:@"MyTemplate" ofType:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:templatePath]]];
}

- (void)loadContent:(NSString *)contentName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", [paths objectAtIndex:0],contentName];
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"setContent(%@)",content]];
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
