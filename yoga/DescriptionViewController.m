//
//  DescriptionViewController.m
//  yoga
//
//  Created by venkatagovardhan on 10/26/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

#import "DescriptionViewController.h"
#import "ImageViewController.h"

@interface DescriptionViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Benifits;

@property (weak, nonatomic) IBOutlet UIScrollView *benefitsview;
@property (weak, nonatomic) IBOutlet UILabel *BeginnersTip;
@property (weak, nonatomic) IBOutlet UILabel *cautions;

@property (weak, nonatomic) IBOutlet UIScrollView *tipview;
@property (weak, nonatomic) IBOutlet UIScrollView *CautionsView;
@property (weak, nonatomic) IBOutlet UILabel *instruct;
@property (weak, nonatomic) IBOutlet UIScrollView *instructview;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentcontroller;
@property (weak, nonatomic) IBOutlet UIImageView *asanpic;

@end

@implementation DescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=_name;
    _instructview.hidden=false;
    _tipview.hidden=true;
    _CautionsView.hidden=true;
    _benefitsview.hidden=true;
    _Benifits.text=_profit;
    _instruct.text=_instructions;
    _cautions.text=_caution;
    _BeginnersTip.text=_beginner;
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: _image]];
    _asanpic.image=[UIImage imageWithData: imageData];
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
- (IBAction)segmentaction:(id)sender {
    switch (_segmentcontroller.selectedSegmentIndex) {
        case 0:
            _instructview.hidden=false;
            _tipview.hidden=true;
            _CautionsView.hidden=true;
            _benefitsview.hidden=true;
            break;
        case 1:
            _instructview.hidden=true;
            _tipview.hidden=false;
            _CautionsView.hidden=true;
            _benefitsview.hidden=true;
            break;
        case 2:
            _instructview.hidden=true;
            _tipview.hidden=true;
            _CautionsView.hidden=false;
            _benefitsview.hidden=true;;
            break;
        case 3:
            _instructview.hidden=true;
            _tipview.hidden=true;
            _CautionsView.hidden=true;
            _benefitsview.hidden=false;;
            break;
        default:
            
            break;
    }
}
- (IBAction)clearImage:(id)sender {
    ImageViewController *imageinfo=[self.storyboard instantiateViewControllerWithIdentifier:@"entirepic"];
    [self.navigationController pushViewController:imageinfo animated:YES];
    imageinfo.entireimage=_image;
}

@end
