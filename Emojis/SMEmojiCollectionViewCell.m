//
//  SMEmojiCollectionViewCell.m
//  Emojis
//
//  Created by Gauri Tikekar on 11/8/16.
//  Copyright © 2016 Gauri Tikekar. All rights reserved.
//

#import "SMEmojiCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation SMEmojiCollectionViewCell

-(void) setEmoji:(NSString *) aUrlString {
    self.urlString = aUrlString;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.urlString]
     placeholderImage:nil
     completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    
     }];
}

@end
