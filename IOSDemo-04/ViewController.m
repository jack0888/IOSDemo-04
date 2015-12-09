//
//  ViewController.m
//  IOSDemo-04
//
//  Created by Jack on 15/12/9.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import "ViewController.h"
#import "NewsView.h"
#import "ATLabel.h"

@interface ViewController (){
    int countInt;
    NSArray *rssArray;
    
}

@property (strong, nonatomic) NewsView *newsView;
@end

@implementation ViewController
@synthesize newsView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    rssArray = @[@"Label-1",
       @"Label-2",
       @"Label-3",
       @"Label-4",
       @"Label-5",
       @"Label-6",];
    countInt = 0;
    
    newsView=[[NewsView alloc] initWithFrame:CGRectMake(50.0f, 50.0f, 200.0f, 21.0f)];
    [self.view addSubview:newsView];
    
    [newsView.titleLabel setText:[rssArray objectAtIndex:countInt]];
    [newsView.descriptionLabel setText:@"TESTDESCRIPTION"];
    [newsView.newsButton addTarget:self action:@selector(topNewsInfoClicked:) forControlEvents:UIControlEventTouchUpInside];
    [UIView animateWithDuration:0.7 delay:0 options:0 animations:^(){
        newsView.alpha = 0.2;
        [newsView exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
        newsView.alpha = 1;
    } completion:^(BOOL finished){
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
    }];
    
    ATLabel *alLabel=[[ATLabel alloc] initWithFrame:CGRectMake(50.0f, 100.0f, 200.0f, 21.0f)];
    [self.view addSubview:alLabel];
    [alLabel animateWithWords:@[@"Label-1",@"Label-2",@"Label-3",@"Label-4",@"Label-5",@"Label-6"] forDuration:2.0f];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayNews{
    countInt++;
    if (countInt >= [rssArray count])
        countInt=0;
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f ;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = @"cube";
    
    [newsView.layer addAnimation:animation forKey:@"animationID"];
    [newsView setViewWithTitle:[rssArray objectAtIndex:countInt] description:@"test"];
}

-(void)topNewsInfoClicked:(id)sender{
//TODO
}

@end
