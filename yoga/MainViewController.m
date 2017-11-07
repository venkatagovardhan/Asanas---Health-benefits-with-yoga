//
//  MainViewController.m
//  yoga
//
//  Created by venkatagovardhan on 7/28/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

#import "MainViewController.h"
#import "TypeViewController.h"

@interface MainViewController (){
    NSArray *array;
    NSString *URLString;
    NSString *protype;
    NSString *Identifier;
    
}
@property (weak, nonatomic) IBOutlet UIButton *Healthbutton;
@property (weak, nonatomic) IBOutlet UIButton *Intermediatebutton;
@property (weak, nonatomic) IBOutlet UIButton *Advanced;
@property (weak, nonatomic) IBOutlet UIButton *beginnerbutton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"Asanas";

    _beginnerbutton.layer.cornerRadius = 20;
   _beginnerbutton.layer.borderWidth = 3;
    _beginnerbutton.layer.borderColor = [UIColor whiteColor].CGColor;
    _Advanced.layer.cornerRadius = 20;
    _Advanced.layer.borderWidth = 3;
    _Advanced.layer.borderColor = [UIColor whiteColor].CGColor;
    _Intermediatebutton.layer.cornerRadius = 20;
    _Intermediatebutton.layer.borderWidth = 3;
    _Intermediatebutton.layer.borderColor = [UIColor whiteColor].CGColor;
    _Healthbutton.layer.cornerRadius = 20;
    _Healthbutton.layer.borderWidth = 3;
    _Healthbutton.layer.borderColor = [UIColor whiteColor].CGColor;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getInfo{
    
    
    NSURL *url = [NSURL URLWithString:URLString];
    
    
    
    [self downloadDataFromURL:url withCompletionHandler:^(NSData *data) {
        
        // Check if any data returned.
        
        if (data != nil) {
            // Convert the returned data into a dictionary.
            
            NSError *error;
            
            NSArray *returnedArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            
            
            if (error != nil) {
                
                NSLog(@"%@", [error localizedDescription]);
                
            }
            
            else{
                NSDictionary *dict = [returnedArray objectAtIndex:0];
                array = [dict  valueForKey:@"items"];
                [self getdataout];
               
                
            }
        }
        
    }];
    
    
}
-(void)downloadDataFromURL:(NSURL *)url withCompletionHandler:(void (^)(NSData *))completionHandler{
    
    // Instantiate a session configuration object.
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Instantiate a session object.
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    
    // Create a data task object to perform the data downloading.
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        
        if (error != nil) {
            
            // If any error occurs then just display its description on the console.
            
            NSLog(@"%@", [error localizedDescription]);
            
        }
        
        else{
            
            // If no error occurs, check the HTTP status code.
            
            NSInteger HTTPStatusCode = [(NSHTTPURLResponse *)response statusCode];
            
            // If it's other than 200, then show it on the console.
            
            if (HTTPStatusCode != 200) {
                
                NSLog(@"HTTP status code = %ld", (long)HTTPStatusCode);
                
            }
            
            // Call the completion handler with the returned data on the main thread.
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                completionHandler(data);
                
            }];
            
        }
        
    }];
    
    // Resume the task.
    
    [task resume];
    
}
-(void)getdataout{
    NSLog(@"total news %lu",(unsigned long)array.count);
    
    
    TypeViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:Identifier];
    [self.navigationController pushViewController:nvc animated:YES];
    nvc.data=array;
    nvc.selectedCategory=protype;
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)beginnerlevel:(id)sender {
    URLString = @"https://api.mongolab.com/api/1/databases/yoga/collections/beginner?apiKey=API Key" ;
    [self getInfo];
    protype=@"beginner";
    Identifier=@"typesview";
}

- (IBAction)IntermediateLevel:(id)sender {
    URLString = @"https://api.mongolab.com/api/1/databases/yoga/collections/moderate?apiKey=API Key" ;
    [self getInfo];
    protype=@"moderate";
    Identifier=@"typesview";
}

- (IBAction)AdvancedLevel:(id)sender {
    URLString = @"https://api.mongolab.com/api/1/databases/yoga/collections/Advanced?apiKey=API Key" ;
    [self getInfo];
    protype=@"Advanced";
    Identifier=@"typesview";
}
- (IBAction)Health:(id)sender {
    URLString = @"https://api.mongolab.com/api/1/databases/yoga/collections/Health?apiKey=API Key" ;
    [self getInfo];
    protype=@"Health";
    Identifier=@"caseview";
}

@end
