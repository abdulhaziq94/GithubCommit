//
//  CommitInfo.h
//  GetGithubJson
//
//  Created by Abdul Haziq on 23/03/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommitInfo : NSObject

@property (nonatomic,strong) NSDictionary *AuthorDict;
@property (nonatomic,strong) NSString *Message;

@end
