//
//  SMEmoji.m
//  Emojis
//
//  Created by Gauri Tikekar on 11/8/16.
//  Copyright © 2016 Gauri Tikekar. All rights reserved.
//

#import "SMEmoji.h"

@implementation SMEmoji

-(void) setEmoji:(NSString *) aName url:(NSString*) aUrl {
    self.emojiName = aName;
    self.emojiURL = aUrl;
}

@end
