//
//  ViewController.m
//  Emojis
//
//  Created by Gauri Tikekar on 11/8/16.
//  Copyright © 2016 Gauri Tikekar. All rights reserved.
//

#import "SMRootViewController.h"
#import "SMEmojiCollectionViewCell.h"
#import "SMEmojiDetailsViewController.h"
#import "SVProgressHUD.h"

@interface SMRootViewController () <SMEmojisCollectionDelegate, SMEmojisViewCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *emojiNames;
@property (nonatomic) int startIndex;
@property (nonatomic) int endIndex;

@end

@implementation SMRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SVProgressHUD show];
    self.startIndex = 0;
    self.endIndex = 50;
    // [self.collectionView setPrefetchingEnabled:NO];
    self.emojiNames = [[NSMutableArray alloc] init];
    self.emojisCollection = [[SMEmojisCollection alloc] init];
    self.emojisCollection.delegate = (id)self;
    [self.emojisCollection initialize];
}

-(void) populateEmojis {
    [self addMoreEmojis];
}

-(void) addMoreEmojis {
    for(int i=self.startIndex; i<self.endIndex; i++) {
        [self.emojiNames addObject:self.emojisCollection.emojiNames[i]];
        
    }
    self.startIndex = self.endIndex;
    self.endIndex = self.endIndex + 50;
    if(self.emojisCollection.emojiNames.count < self.endIndex) {
        self.endIndex = (int)self.emojisCollection.emojiNames.count;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
    
}

-(void) emojiDownloaded:(SMEmoji *) aEmojiObject {
    [SVProgressHUD dismiss];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.emojiNames.count;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"EmojiCell";
    SMEmojiCollectionViewCell *cell_ = (SMEmojiCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell_ == nil)
    {
        cell_ =  (SMEmojiCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    }
    cell_.delegate = (id)self;
    NSString *key_ = self.emojiNames[indexPath.row];
    if(key_ != nil) {
        SMEmoji *smEmoji_ = [[SMEmoji alloc] init];
        [smEmoji_ setEmoji:key_ url:[self.emojisCollection.emojis objectForKey:key_]];
        [cell_ setEmoji:smEmoji_];
    }
    if(self.emojiNames.count-1 == indexPath.row) {
        [self addMoreEmojis];
    }
    
    return cell_;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key_ = self.emojisCollection.emojiNames[indexPath.row];
    if(key_ != nil) {
        SMEmoji *smEmoji_ = [[SMEmoji alloc] init];
        [smEmoji_ setEmoji:key_ url:[self.emojisCollection.emojis objectForKey:key_]];
        [self performSegueWithIdentifier:@"Show Emoji Details" sender:smEmoji_];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"Show Emoji Details"]){
        SMEmojiDetailsViewController* vc_ = (SMEmojiDetailsViewController*) segue.destinationViewController;
        
        vc_.emoji = (SMEmoji *)sender;
    }
}


@end
