//
//  ColorsManager.m
//  WorkshopColors
//
//  Created by Nicolas Alliaume on 21/07/14.
//  Copyright (c) 2014 ADMVD. All rights reserved.
//

#import "ColorsManager.h"
#import "AFNetworking.h"

@implementation ColorsManager

+ (id)sharedManager {
    static ColorsManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)fetchColors:(void(^)(NSArray *colors))success failed:(void(^)(NSString *error))failed
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://on-lab.com/admvd/workshop/colors.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failed(error.localizedDescription);
        
    }];
}

- (UIColor *)colorForRGBString:(NSString *)rgbString
{
    NSArray *colors = [rgbString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"(,)"]];
    
    // positions 0 and 4 have empty strings
    
    CGFloat red = [[colors objectAtIndex:1] intValue];
    CGFloat green = [[colors objectAtIndex:2] intValue];
    CGFloat blue = [[colors objectAtIndex:3] intValue];
    
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:1.0];
}

@end
