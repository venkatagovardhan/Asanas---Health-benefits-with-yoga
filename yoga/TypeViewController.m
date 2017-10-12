//
//  TypeViewController.m
//  yoga
//
//  Created by venkatagovardhan on 7/28/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

#import "TypeViewController.h"
#import "yogaTypeList.h"
#import "DetailViewController.h"

@interface TypeViewController (){
    NSArray *arrayList;
    NSString *keyvalue;
    
}

@end

@implementation TypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    keyvalue=_selectedCategory;
    arrayList=_data;
    NSLog(@"%@",arrayList);
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayList.count;
    
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableidentifier=@"list";
    yogaTypeList *cell=[tableView  dequeueReusableCellWithIdentifier:tableidentifier];
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[arrayList objectAtIndex:indexPath.row] valueForKey:@"image"]]];
    cell.yogapic.image=[UIImage imageWithData: imageData];
    cell.yoganame.text=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Asana Name"];
    cell.EnglishName.text=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"English Name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailedinfo=[self.storyboard instantiateViewControllerWithIdentifier:@"detailview"];
    [self.navigationController pushViewController:detailedinfo animated:YES];
    detailedinfo.name=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Asana Name"];
    detailedinfo.translation=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Translation"];
    detailedinfo.instructions=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Instructions"];
    detailedinfo.comments=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Comments"];
    detailedinfo.duration=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Duration"];
    detailedinfo.image=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"image"];
}

@end
