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
#import "CartDelegate.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CartDelegate>
{
    NSArray *data;
    NSMutableArray *cart;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

// 델리게이트 메소드
- (void)addItem:(id)sender
{
    // 제품 찾기 - 셀 객체로 indexPath 얻기
    UITable *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
    Product *item = data[indexPath.row];
    
    // 카트에 상품 추가
    [cart addObject:item];
    
    // 테이블 카트 섹션 리로드
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
    
    Product *item = data[indexPath.row];
    [cell setProductInfo:item];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    data = @[[Product product:@"BaseBall" price:@"$100" image:@"baseball.png"],
             [Product product:@"BasketBall" price:@"$200" image:@"basketball.png"],
             [Product product:@"FootBall" price:@"$250" image:@"football.png"],
             [Product product:@"RugbyBall" price:@"$300" image:@"rugbyball.png"],
             [Product product:@"VolleyBall" price:@"$500" image:@"volleyball.png"]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
