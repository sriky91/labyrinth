//
//  ViewController.m
//  GameAccelerometer
//
//  Created by Riccardo on 12/04/13.
//  Copyright (c) 2013 Riccardo Salmaso. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize ball,delta;


int xBorder;
int yBorder;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIAccelerometer *accel =[UIAccelerometer sharedAccelerometer];
    accel.delegate = self;
    accel.updateInterval= 1.0f/60.0f;
    [super viewDidLoad];
    xBorder=(50)/2;
    yBorder=(50)/2;
    
    
    
    //NSLog(@"viewdidload: %f",ball.frame.size.width);
    
	// Do any additional setup after loading the view, typically from a nib.
}




-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    /*
    NSLog(@"x: %g",acceleration.x);
    NSLog(@"y: %g",acceleration.y);
    NSLog(@"y: %g",acceleration.z);
    */
    delta.x=acceleration.x*5;
    delta.y=acceleration.y*5;

    // NSLog(@"%f",ball.frame.size.width);
    float yHold=ball.center.y;
    ball.center=CGPointMake(ball.center.x+ delta.x, ball.center.y - delta.y);
    
    
    if(delta.y<0 && yHold+yBorder<=70){
        
        NSLog(@"entrato: %f",delta.y);
        
        if(ball.center.y>=70-yBorder && ball.center.x <= (257+xBorder)){
            ball.center= CGPointMake(ball.center.x,70-yBorder);
        }
    }
    
    if(delta.y>0 && yHold-yBorder>70){
        
        NSLog(@"uauuuu: %f",delta.y);
        
        if(ball.center.y<=70+yBorder && ball.center.x <= (257+xBorder)){
            ball.center= CGPointMake(ball.center.x,70+yBorder);
        }
    }
    
    if(delta.y<0 && yHold+yBorder>70 && yHold+yBorder<=130){
        
        NSLog(@"entrato: %f",delta.y);
        
        if(ball.center.y>=130-yBorder && ball.center.x >= ((320-257)-xBorder)){
            ball.center= CGPointMake(ball.center.x,130-yBorder);
        }
    }
    /*
    if(delta.y>0 && yHold+yBorder>70 && yHold+yBorder<=130){
        
        NSLog(@"siiii: %f",delta.y);
        
        if(ball.center.y>=130-yBorder && ball.center.x >= ((320-257)-xBorder)){
            ball.center= CGPointMake(ball.center.x,130+yBorder);
        }
    }
    */
    
    if(ball.center.x<= xBorder){
        ball.center= CGPointMake(xBorder,ball.center.y);
    }
    if(ball.center.x >= (320-xBorder)){
        ball.center= CGPointMake(320-xBorder,ball.center.y);
    }
    if(ball.center.y<= yBorder){
        ball.center= CGPointMake(ball.center.x,yBorder);
    }
    if(ball.center.y>=460-yBorder){
        ball.center= CGPointMake(ball.center.x,460-yBorder);
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
