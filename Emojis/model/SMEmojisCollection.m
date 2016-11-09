//
//  SMEmojisCollection.m
//  Emojis
// 

//  Created by Gauri Tikekar on 11/8/16.
//  Copyright © 2016 Gauri Tikekar. All rights reserved.
//

#import "SMEmojisCollection.h"

@implementation SMEmojisCollection

-(void) initialize {
    NSString *filePath = @"https://api.github.com/emojis";
    
    
    NSURL *myURL = [NSURL URLWithString: filePath];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:myURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              NSError *e = nil;
                                              self.emojis = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
                                              self.emojiNames = [self.emojis allKeys];
                                              [self.delegate populateEmojis];
                                          }];
    
    [downloadTask resume];
}

@end
