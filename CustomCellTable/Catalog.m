//
//  Catalog.m
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Catalog.h"
#import "Product.h"

@implementation Catalog
{
    NSArray *data;
}

// 싱글톤 메소드
static Catalog *_instance = nil;

+ (id)defaultCatalog
{
    if (nil == _instance) {
        _instance = [[Catalog alloc] init];
    }
    return _instance;
}

- (id) init
{
    self = [super init];
    if (self) {
        data = @[[Product product:@"BaseBall" price:@"$100" image:@"baseball.png"],
                 [Product product:@"BasketBall" price:@"$200" image:@"basketball.png"],
                 [Product product:@"FootBall" price:@"$250" image:@"football.png"],
                 [Product product:@"RugbyBall" price:@"$300" image:@"rugbyball.png"],
                 [Product product:@"VolleyBall" price:@"$500" image:@"volleyball.png"]];
    }
    return self;
}


- (id)productAt:(int)index
{
    return [data objectAtIndex:index];
}

- (int)numberOfProducts
{
    return [data count];
}

@end
