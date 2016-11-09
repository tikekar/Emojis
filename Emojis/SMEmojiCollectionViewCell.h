//
//  SMEmojiCollectionViewCell.h
//  Emojis
//
//  Created by Gauri Tikekar on 11/8/16.
//  Copyright © 2016 Gauri Tikekar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMEmoji.h"

@protocol SMEmojisViewCellDelegate <NSObject>

@optional

- (void) emojiDownloaded:(SMEmoji *) aEmojiObject;

@end


@interface SMEmojiCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, strong) SMEmoji *emojiObject;
@property (strong, nonatomic) id delegate;

-(void) setEmoji:(SMEmoji *) aSMEmoji;

@end
