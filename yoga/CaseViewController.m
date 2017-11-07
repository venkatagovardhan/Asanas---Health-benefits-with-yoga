//
//  CaseViewController.m
//  yoga
//
//  Created by venkatagovardhan on 10/26/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

#import "CaseViewController.h"
#import "problemViewCell.h"
#import "CategoryViewController.h"

@interface CaseViewController (){
NSArray *arrayList;

}

@end

@implementation CaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=_selectedCategory;
    arrayList=_data; 
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayList.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableidentifier=@"caselist";
    problemViewCell *cell=[tableView  dequeueReusableCellWithIdentifier:tableidentifier];
    
  //  NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[arrayList objectAtIndex:indexPath.row] valueForKey:@"image"]]];
   // cell.casepic.image=[UIImage imageWithData: imageData];
    cell.casename.text=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Problem"];
    cell.CaseDescription.text=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Description"];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void){
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[arrayList objectAtIndex:indexPath.row] valueForKey:@"image"]]];
        if (imageData) {
            UIImage *image = [UIImage imageWithData:imageData];
            if(image){
            dispatch_sync(dispatch_get_main_queue(), ^(void) {
                UIImage *image = [UIImage imageWithData:imageData];
                if (image) {
                    cell.casepic.image = image;
                }
            });
            }
        }
    });
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryViewController *categoryinfo=[self.storyboard instantiateViewControllerWithIdentifier:@"categorystoryboard"];
    [self.navigationController pushViewController:categoryinfo animated:YES];
    NSArray *asanatype= [[arrayList objectAtIndex:indexPath.row] valueForKey:@"Asanas"];
    categoryinfo.categoryAsanas=asanatype;
    categoryinfo.selectedCase=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Problem"];
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
