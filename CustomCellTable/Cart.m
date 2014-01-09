//
//  Cart.m
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Cart.h"
#import "CartItem.h"
#import "CartDelegate.h"

@interface Cart()

@end


@implementation Cart

// 카트에 제품 추가
- (void)addProduct:(Product *)item
{
    // 카트 내 동일상품 검색
    // 동일제품 검색 성공 시 제품수량 증가
    // 동일제품 검색 실패 시 새로운 상품을 카트에 추가
}

// 카트 내 상품수량 증가
- (void)incQuantity:(NSString *)productCode
{
    CartItem *item = [self cartItemWith:productCode];
    item.quantity++;
}

// 카트 내 상품수량 감소
- (void)decQuantity:(NSString *)productCode {
    CartItem *item = [self cartItemWith:productCode];
    item.quantity--;
    
    // 제품수량이 0이면 삭제
    if (0 == item.quantity) {
        [self.items removeObject:item];
    }
}

// 상품코드로 카트 내 동일상품 찾기
- (CartItem *)cartItemWith:(NSString *)productCode
{
    for (CartItem *item in self.items) {
        if([item.product isEqualProduct:productCode]) {
            return item;
        }
    }
    return nil;
}

@end
