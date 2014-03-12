//
//  PlayingCard.h
//  Matchismo
//
//  Created by Michael Burk on 2/24/14.
//  Copyright (c) 2014 Michael Burk. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
