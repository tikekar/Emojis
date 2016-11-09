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

@interface SMRootViewController () <SMEmojisCollectionDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SMRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SVProgressHUD show];
    self.emojisCollection = [[SMEmojisCollection alloc] init];
    self.emojisCollection.delegate = (id)self;
    [self.emojisCollection initialize];
}

-(void) populateEmojis {
    [self.collectionView reloadData];
    [SVProgressHUD dismiss];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.emojisCollection.emojis.count;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SMEmojiCollectionViewCell* cell_ = (SMEmojiCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"EmojiCell" forIndexPath:indexPath];
    NSString *key_ = self.emojisCollection.emojiNames[indexPath.row];
    if(key_ != nil) {
        [cell_ setEmoji:[self.emojisCollection.emojis objectForKey:key_]];
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
