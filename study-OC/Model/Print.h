//
//  Print.h
//  study-OC
//
//  Created by 梁江斌 on 2023/7/27.
//

#ifndef Print_h
#define Print_h

#endif /* Print_h */

#import <Foundation/Foundation.h>

//@interface Print : NSObject {
//    NSString *a;
//    NSString *b;
//}
//
//@property(nonatomic, copy) NSString *caption;
//@property(nonatomic, copy) NSString *photo;
//
//+(NSString*) printName;
//
//@end


@interface Print : NSObject
{
    NSString *_caption;
    NSString *_photo;
}

@property(nonatomic, copy) NSString *caption;
@property(nonatomic, copy) NSString *photo;

+ (NSString*) printName;
- (void)setNewPhoto:(NSString*) newPhoto setNewCaption:(NSString*) newCaption;

@end
