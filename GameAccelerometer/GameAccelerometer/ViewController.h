//
//  ViewController.h
//  GameAccelerometer
//
//  Created by Riccardo on 12/04/13.
//  Copyright (c) 2013 Riccardo Salmaso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAccelerometerDelegate>{
    UIImageView* ball;
    CGPoint delata;
}

@property(nonatomic, retain)IBOutlet UIImageView *ball;
@property CGPoint delta;
@property (strong, nonatomic) IBOutlet UIView *percorso;


@end
