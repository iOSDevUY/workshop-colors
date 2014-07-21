//
//  ColorVC.h
//  WorkshopColors
//
//  Created by Nicolas Alliaume on 21/07/14.
//  Copyright (c) 2014 ADMVD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorVC : UIViewController

@property (nonatomic, strong) NSDictionary *selectedColor;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *rgbLabel;
@property (strong, nonatomic) IBOutlet UILabel *hexLabel;


@end
