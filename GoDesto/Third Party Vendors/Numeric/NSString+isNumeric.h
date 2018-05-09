// Inspired by StackOverflow
// http://stackoverflow.com/questions/6644004/how-to-check-if-nsstring-is-numeric

#import <Foundation/Foundation.h>

@interface NSString (isNumeric)

- (BOOL) isAllDigits;
- (BOOL) isNumeric;

@end