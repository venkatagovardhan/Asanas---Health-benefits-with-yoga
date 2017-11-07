//
//  DetailViewController.m
//  yoga
//
//  Created by venkatagovardhan on 7/28/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

#import "DetailViewController.h"
#import "ImageViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentcontrol;
@property (weak, nonatomic) IBOutlet UIImageView *yogapic;
@property (weak, nonatomic) IBOutlet UIView *instructionview;
@property (weak, nonatomic) IBOutlet UILabel *AsanaName;
@property (weak, nonatomic) IBOutlet UILabel *yogaInstructions;
@property (weak, nonatomic) IBOutlet UILabel *yogaTranslation;
@property (weak, nonatomic) IBOutlet UIView *commentview;
@property (weak, nonatomic) IBOutlet UIView *Durationview;
@property (weak, nonatomic) IBOutlet UILabel *yogacomments;
@property (weak, nonatomic) IBOutlet UILabel *yogaduration;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=_name;
    _instructionview.hidden=false;
    _commentview.hidden=true;
    _Durationview.hidden=true;
    _AsanaName.text=_name;
    _yogaTranslation.text=_translation;
    _yogaInstructions.text=_instructions;
    _yogacomments.text=_comments;
    _yogaduration.text=_duration;
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: _image]];
    _yogapic.image=[UIImage imageWithData: imageData];
    // Do any additional setup after loading the view.
}
- (IBAction)fullImage:(id)sender {
    ImageViewController *imageinfo=[self.storyboard instantiateViewControllerWithIdentifier:@"entirepic"];
    [self.navigationController pushViewController:imageinfo animated:YES];
    imageinfo.entireimage=_image;
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

- (IBAction)segmentvaluechange:(id)sender {
    switch (_segmentcontrol.selectedSegmentIndex) {
        case 0:
            _instructionview.hidden=false;
            _commentview.hidden=true;
            _Durationview.hidden=true;
            break;
        case 1:
            _instructionview.hidden=true;
            _commentview.hidden=false;
            _Durationview.hidden=true;
            break;
        case 2:
            _instructionview.hidden=true;
            _commentview.hidden=true;
            _Durationview.hidden=false;
            break;
            
        default:
            
            break;
    }
}


@end
