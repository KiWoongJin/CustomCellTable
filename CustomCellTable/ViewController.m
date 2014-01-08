//
//  ViewController.

//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *data;
}

@end

@implementation ViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
    
    Product *item = data[indexPath.row];
    [cell setPoductInfo:item];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    data = @[[Product product:@"BaseBall" price:@"100" image:@"baseball.png"],
             [Product product:@"BasketBall" price:@"200" image:@"basketball.png"],
             [Product product:@"FootBall" price:@"250" image:@"football.png"],
             [Product product:@"RugbyBall" price:@"300" image:@"rugbyball.png"],
             [Product product:@"VolleyBall" price:@"500" image:@"volleyball.png"]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
