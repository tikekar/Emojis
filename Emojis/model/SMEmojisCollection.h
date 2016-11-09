//
//  SMEmojisCollection.h
//  Emojis
//
//  Created by Gauri Tikekar on 11/8/16.
//  Copyright © 2016 Gauri Tikekar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SMEmojisCollectionDelegate <NSObject>

@optional

- (void) populateEmojis;

@end


@interface SMEmojisCollection : NSObject

@property (nonatomic, strong) NSMutableDictionary *emojis;
@property (nonatomic, strong) NSArray *emojiNames;
@property (strong, nonatomic) id delegate;
-(void) initialize;

@end
