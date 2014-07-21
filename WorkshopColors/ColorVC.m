//
//  ColorVC.m
//  WorkshopColors
//
//  Created by Nicolas Alliaume on 21/07/14.
//  Copyright (c) 2014 ADMVD. All rights reserved.
//

#import "ColorVC.h"
#import "ColorsManager.h"

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
    
    self.view.backgroundColor = [[ColorsManager sharedManager] colorForRGBString:_selectedColor[@"rgb"]];
}

@end
