//
//  ImageViewController.m
//  yoga
//
//  Created by venkatagovardhan on 11/3/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *mainpic;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: _entireimage]];
    _mainpic.image=[UIImage imageWithData: imageData];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
