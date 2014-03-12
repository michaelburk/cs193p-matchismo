//
//  SetMatchingGame.m
//  Matchismo
//
//  Created by Michael Burk on 3/1/14.
//  Copyright (c) 2014 Michael Burk. All rights reserved.
//

#import "SetMatchingGame.h"

@interface SetMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@property (nonatomic) NSInteger matchCount; //of Card
@end

@implementation SetMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;
{
    self = [super init];
    
    if (self ) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
            
        }
    }
    
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)incrementMatchCount
{
    self.matchCount ++;
}

- (void)decrementMatchCount
{
    self.matchCount --;
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
            [self decrementMatchCount];
        } else if (self.matchCount < 2)
        {
            for (Card *otherCard in self.cards )
            {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [self incrementMatchCount];
                    int matchResult = [card match:@[otherCard]];
                    if (matchResult) {
                        self.score += MATCH_BONUS;
                        break;
                    } else
                    {
                        self.score -= MISMATCH_PENALTY;
                    }
                }
                break;
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}


- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
