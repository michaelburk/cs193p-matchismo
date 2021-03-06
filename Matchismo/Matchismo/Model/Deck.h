//
//  Deck.h
//  Matchismo
//
//  Created by Michael Burk on 2/24/14.
//  Copyright (c) 2014 Michael Burk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
