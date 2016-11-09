//
//  SMEmojiDetailsViewController.m
//  Emojis
//
//  Created by Gauri Tikekar on 11/8/16.
//  Copyright © 2016 Gauri Tikekar. All rights reserved.
//

#import "SMEmojiDetailsViewController.h"
#import "UIImageView+WebCache.h"

@interface SMEmojiDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SMEmojiDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.emoji.emojiName;
    NSString *urlString_ = self.emoji.emojiURL;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlString_]
                      placeholderImage:nil
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                 
                             }];
   
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
