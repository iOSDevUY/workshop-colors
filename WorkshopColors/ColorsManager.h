//
//  ColorsManager.h
//  WorkshopColors
//
//  Created by Nicolas Alliaume on 21/07/14.
//  Copyright (c) 2014 ADMVD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorsManager : NSObject

+ (id)sharedManager;

- (void)fetchColors:(void(^)(NSArray *colors))success failed:(void(^)(NSString *error))failed;

@end
