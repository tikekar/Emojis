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

-(void) setEmoji:(SMEmoji *) aSMEmoji {
    self.emojiObject = aSMEmoji;
    self.urlString = self.emojiObject.emojiURL;
    self.imageView.layer.opacity = 0.0f;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.urlString] placeholderImage:nil options:SDWebImageRefreshCached];
    
    if(self.imageView.image == nil) {
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.urlString]
                   placeholderImage:nil
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                              if(error) {
                                  NSLog(@"%@", error);
                              }
                              else {
                                  self.imageView.layer.opacity = 1.0f;
                                  [self.delegate emojiDownloaded:self.emojiObject];
                              }
                          }];
    }
    else {
        self.imageView.layer.opacity = 1.0f;
        [self.delegate emojiDownloaded:self.emojiObject];
    }
}

@end
