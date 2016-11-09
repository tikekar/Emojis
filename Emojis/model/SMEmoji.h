//
//  SMEmoji.h
//  Emojis
//  Model class for an Emoji
//
//  Created by Gauri Tikekar on 11/8/16.
//  Copyright © 2016 Gauri Tikekar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMEmoji : NSObject

@property (nonatomic, copy) NSString *emojiName;
@property (nonatomic, copy) NSString *emojiURL;
-(void) setEmoji:(NSString *) aName url:(NSString*) aUrl;

@end
