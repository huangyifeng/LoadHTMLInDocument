//
//  ViewController.h
//  LoadHTMLInDocument
//
//  Created by huang yifeng on 13-1-9.
//  Copyright (c) 2013年 aimob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
@private
    UIWebView   *_webView;
}

@property(nonatomic, strong)IBOutlet UIWebView *webView;

- (IBAction)btn1tap:(id)sender;

- (IBAction)btn2tap:(id)sender;

@end
