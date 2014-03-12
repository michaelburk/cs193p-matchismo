//
//  Card.h
//  Matchismo
//
//  Created by Michael Burk on 2/24/14.
//  Copyright (c) 2014 Michael Burk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
