//
//  DetailViewController.h
//  yoga
//
//  Created by venkatagovardhan on 7/28/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *translation;
@property (weak, nonatomic) NSString *instructions;
@property (weak, nonatomic) NSString *comments;
@property (weak, nonatomic) NSString *duration;
@property (weak, nonatomic) NSString *image;


@end
