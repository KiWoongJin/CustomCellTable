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
#import "Cart.h"
#import "CartCell.h"
#import "CartItem.h"
#import "Catalog.h"
#import "CartDelegate.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CartDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart *cart;

@end

@implementation ViewController

// 카달로그 델리게이트 : 제품을 카트에 추가한다.
- (void)addItem:(id)sender
{
    // 제품 식별자를 위한 인덱스
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    [self.cart addProduct:product];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

}

// 카트 내 상품 수량 증가
- (void)incQuantity:(NSString *)productCode
{
    [self.cart incQuantity:productCode];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// 카트 내 상품 수량 감소
- (void)decQuantity:(NSString *)productCode
{
    [self.cart decQuantity:productCode];
    
    NSIndexSet *indexSet =[NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// 섹션 2개 설정(0: 카달로그, 1 : 카트)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == section)
        return [[Catalog defaultCatalog] numberOfProducts];
    else
        return [self.cart.items count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return (0 == section) ? @"Product" : @"Items in Cart";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 첫 번째 섹션(카달로그)
    if (0 == indexPath.section) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        
        // 뷰 컨트롤러(self)가 셀의 델리게이트 역할을 수행한다.
        cell.delegate = self;
        Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
        [cell setProductInfo:product];
    return cell;
    }
    
    // 두 번째 섹션(카트)
    else{
        CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        cell.delegate = self;
        CartItem *cartItem = self.cart.items[indexPath.row];
        [cell setCartItem:cartItem];
        
        return cell;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cart = [[Cart alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
