//
//  SMEmojisCollection.h
//  Emojis
//  For storing the emojis feed
//
//  Created by Gauri Tikekar on 11/8/16.
//  Copyright © 2016 Gauri Tikekar. All rights reserved.
//

#import <Foundation/Foundation.h>

// Delegate implemented by SMRootViewController
@protocol SMEmojisCollectionDelegate <NSObject>

@optional

// call this delegate method once the response comes back with json feed
- (void) populateEmojis;

@end


@interface SMEmojisCollection : NSObject

// store json feed
@property (nonatomic, strong) NSMutableDictionary *emojis;
// store only the keys(emoji names) for lookup.
@property (nonatomic, strong) NSArray *emojiNames;
@property (strong, nonatomic) id delegate;

-(void) initialize;

@end
