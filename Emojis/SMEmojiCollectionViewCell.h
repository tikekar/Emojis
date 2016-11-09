//
//  SMEmojiCollectionViewCell.h
//  Emojis
//
//  Created by Gauri Tikekar on 11/8/16.
//  Copyright © 2016 Gauri Tikekar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMEmojiCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, copy) NSString *urlString;

-(void) setEmoji:(NSString *) aUrlString;

@end
