//
//  SetMatchingGame.h
//  Matchismo
//
//  Created by Michael Burk on 3/1/14.
//  Copyright (c) 2014 Michael Burk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface SetMatchingGame : NSObject

// designated initalizer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
