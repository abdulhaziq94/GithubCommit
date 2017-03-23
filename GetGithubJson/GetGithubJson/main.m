//
//  main.m
//  GetGithubJson
//
//  Created by Abdul Haziq on 23/03/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpringBoot.h"
#import "Author.h"
#import "ListCommit.h"
#import "CommitInfo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        NSError *error;
        NSString *url_string = [NSString stringWithFormat:@"https://api.github.com/repos/spring-projects/spring-boot"];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url_string]];
        NSDictionary *SpringBootJson = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//        NSLog(@"SpringBootJson list: %@",SpringBootJson);
        
        SpringBoot *SBObject = [[SpringBoot alloc] init];
        SBObject.commit_url = [SpringBootJson objectForKey:@"commits_url"];
        NSString *new_string = [SBObject.commit_url stringByReplacingOccurrencesOfString:@"{/sha}" withString:@""];
        NSData *new_data = [NSData dataWithContentsOfURL:[NSURL URLWithString:new_string]];
        id CommitJson = [NSJSONSerialization JSONObjectWithData:new_data options:kNilOptions error:&error];
//        NSLog(@"Get CommitJson: %@", CommitJson);
        
    
        NSMutableArray * CommitArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *ListCommitDict in CommitJson) {
            
            ListCommit *listCommit = [[ ListCommit alloc] init];
            NSDictionary *CommitDict = [[NSDictionary alloc] init];
            listCommit.commit = CommitDict;
            
            for (NSDictionary *CommitInfoDict in [ListCommitDict objectForKey:@"commit"]) {
                CommitInfo *commitInfo = [[CommitInfo alloc]init];
                commitInfo.Message = [CommitInfoDict objectForKey:@"message"];
                NSDictionary *authorDict = [[NSDictionary alloc] init];
                commitInfo.AuthorDict = authorDict;
                
                
                for (NSDictionary *AuthorDict in [CommitInfoDict objectForKey:@"author"]) {
                    Author *commitAuthor = [[Author alloc]init];
                    commitAuthor.name = [CommitDict objectForKey:@"name"];
                    commitAuthor.email = [CommitDict objectForKey:@"email"];
                    commitAuthor.date = [CommitDict objectForKey:@"date"];
                    [authorDict allKeysForObject:commitAuthor];
                }
                
                [CommitDict allKeysForObjects : authorDict,com];
            }
            

//            
//            [CommitArray addObject:commitAuthor];
            
            
        }
        
        Author *commitAuthor = [[Author alloc]init];
        NSLog(@"Name: %@",commitAuthor.name);
        NSLog(@"Email : %@", commitAuthor.email);
        NSLog(@"Date: %@", commitAuthor.date);
        NSLog(@"Message: %@", commitAuthor.message);
        
    }
    return 0;
}
