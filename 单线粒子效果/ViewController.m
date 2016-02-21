//
//  ViewController.m
//  单线粒子效果
//
//  Created by 王志盼 on 16/2/16.
//  Copyright © 2016年 王志盼. All rights reserved.
//

#import "ViewController.h"
#import "ZYDrawView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ZYDrawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)startAnimation:(id)sender {
    [self.drawView startAnimation];
}
- (IBAction)reDraw:(id)sender {
    [self.drawView reDraw];
}
@end
