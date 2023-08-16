//
//  Student.h
//  study-OC
//
//  Created by 梁江斌 on 2023/7/31.
//

#ifndef Student_h
#define Student_h


#endif /* Student_h */

#import <Foundation/Foundation.h>
#import "myProtocol.h"

@interface Student : NSObject <myProtocol>

@property(nonatomic, copy) NSString *name;
@property(nonatomic) NSInteger *age;
@property(nonatomic) NSInteger *score;



@end
