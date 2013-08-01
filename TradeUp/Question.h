//
//  Question.h
//  TradeUp
//
//  Created by Michelle Austria on 8/1/13.
//  Copyright (c) 2013 Michelle Austria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (strong, nonatomic) NSString *prompt;
@property (strong, nonatomic) NSString *questionID;


@property (strong, nonatomic) NSString *answer1;
@property (strong, nonatomic) NSString *answer2;
@property (strong, nonatomic) NSString *answer3;
@property (strong, nonatomic) NSString *answer4;

@property (strong, nonatomic) NSString *id1;
@property (strong, nonatomic) NSString *id2;
@property (strong, nonatomic) NSString *id3;
@property (strong, nonatomic) NSString *id4;

@property (nonatomic) BOOL *isCorrect1;
@property (nonatomic) BOOL *isCorrect2;
@property (nonatomic) BOOL *isCorrect3;
@property (nonatomic) BOOL *isCorrect4;

@property (nonatomic) float *time;






@end
