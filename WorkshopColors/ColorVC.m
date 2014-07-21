//
//  ColorVC.m
//  WorkshopColors
//
//  Created by Nicolas Alliaume on 21/07/14.
//  Copyright (c) 2014 ADMVD. All rights reserved.
//

#import "ColorVC.h"

@interface ColorVC ()

@end

@implementation ColorVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _nameLabel.text = _selectedColor[@"name"];
    _hexLabel.text = _selectedColor[@"hex"];
    _rgbLabel.text = _selectedColor[@"rgb"];
    
    NSString *rgbColor = _selectedColor[@"rgb"];
    NSArray *colors = [rgbColor componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"(,)"]];
    
    // positions 0 and 4 have empty strings
    
    CGFloat red = [[colors objectAtIndex:1] intValue];
    CGFloat green = [[colors objectAtIndex:2] intValue];
    CGFloat blue = [[colors objectAtIndex:3] intValue];
    
    self.view.backgroundColor = [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:1.0];
}

@end
