//
//  CartCell.m
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Cart.h"
#import "CartCell.h"
#import "CartItem.h"
#import "CartDelegate.h"

@interface CartCell()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *quantity;

- (IBAction)plusClicked:(id)sender;
- (IBAction)minusClicked:(id)sender;

@end

@implementation CartCell

// 수량 증가 버튼을 누르면
- (IBAction)plusClicked:(id)sender
{
    
}

// 수량 감소 버튼을 누르면
- (IBAction)minusClicked:(id)sender
{
    self.productCode = 
}

// 셀에 반영할 내용
- (void)setCartItem:(CartItem *)item
{
    // 제품 구별용 코드
    self.productCode = item.product.code;
    
    // 셀 반영
    
}

@end
