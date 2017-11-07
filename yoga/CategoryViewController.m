//
//  CategoryViewController.m
//  yoga
//
//  Created by venkatagovardhan on 10/26/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

#import "CategoryViewController.h"
#import "AsanalistCell.h"
#import "DescriptionViewController.h"

@interface CategoryViewController (){
    NSArray *AsanaList;
    
}

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=_selectedCase;
    AsanaList=_categoryAsanas;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return AsanaList.count;
    
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
    static NSString *tableidentifier=@"Asanalist";
    AsanalistCell *Asanacell=[tableView  dequeueReusableCellWithIdentifier:tableidentifier];
    
    //NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[AsanaList objectAtIndex:indexPath.row] valueForKey:@"image"]]];
   // Asanacell.AsanaPic.image=[UIImage imageWithData: imageData];
    Asanacell.AsanaName.text=[[AsanaList objectAtIndex:indexPath.row] valueForKey:@"Asana Name"];
    Asanacell.AsanaEnglishName.text=[[AsanaList objectAtIndex:indexPath.row] valueForKey:@"English Name"];
    Asanacell.AsanaDescription.text=[[AsanaList objectAtIndex:indexPath.row] valueForKey:@"Description"];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void){
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[AsanaList objectAtIndex:indexPath.row] valueForKey:@"image"]]];
        if (imageData) {
            UIImage *image = [UIImage imageWithData:imageData];
            if(image){
            dispatch_sync(dispatch_get_main_queue(), ^(void) {
                UIImage *image = [UIImage imageWithData:imageData];
                if (image) {
                    Asanacell.AsanaPic.image = image;
                }
            });
            }
            
        }
    });
    
    return Asanacell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DescriptionViewController *descriptioninfo=[self.storyboard instantiateViewControllerWithIdentifier:@"AsanaDescription"];
    [self.navigationController pushViewController:descriptioninfo animated:YES];
   
    descriptioninfo.beginner=[[AsanaList objectAtIndex:indexPath.row] valueForKey:@"Beginner's Tip"];
    descriptioninfo.instructions=[[AsanaList objectAtIndex:indexPath.row] valueForKey:@"Instructions"];
    descriptioninfo.caution=[[AsanaList objectAtIndex:indexPath.row] valueForKey:@"Cautions"];
    descriptioninfo.profit=[[AsanaList objectAtIndex:indexPath.row] valueForKey:@"Benifits"];
    descriptioninfo.image=[[AsanaList objectAtIndex:indexPath.row] valueForKey:@"image"];
    descriptioninfo.name=[[AsanaList objectAtIndex:indexPath.row] valueForKey:@"Asana Name"];
}

@end
