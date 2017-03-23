//
//  Author.h
//  GetGithubJson
//
//  Created by Abdul Haziq on 23/03/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Author : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSDate *date;
@property (nonatomic,strong) NSString *message;

@end
