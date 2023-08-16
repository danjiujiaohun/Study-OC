//
//  Print.m
//  study-OC
//
//  Created by 梁江斌 on 2023/7/27.
//

#import <Foundation/Foundation.h>
#import "Print.h"

@implementation Print

@synthesize photo = _photo;
@synthesize caption = _caption;

+ (NSString *) printName {
    return (@"printName");
}

- (void)setNewPhoto: (NSString *)newPhoto setNewCaption: (NSString *)newCaption {
    _photo = newPhoto;
    _caption = newCaption;
    NSLog(@"print newPhoto:%@, newCaption %@", newPhoto, newCaption);
}



@end
