//
//  AsanalistCell.h
//  yoga
//
//  Created by venkatagovardhan on 10/27/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AsanalistCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *AsanaDescription;
@property (weak, nonatomic) IBOutlet UILabel *AsanaEnglishName;
@property (weak, nonatomic) IBOutlet UILabel *AsanaName;
@property (weak, nonatomic) IBOutlet UIImageView *AsanaPic;

@end
