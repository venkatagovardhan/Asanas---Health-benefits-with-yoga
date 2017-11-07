//
//  problemViewCell.h
//  yoga
//
//  Created by venkatagovardhan on 10/27/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface problemViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *CaseDescription;
@property (weak, nonatomic) IBOutlet UILabel *casename;
@property (weak, nonatomic) IBOutlet UIImageView *casepic;

@end
