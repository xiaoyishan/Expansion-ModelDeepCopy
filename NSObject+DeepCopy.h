//
//  NSObject+DeepCopy.h
//  ModelCheck
//
//  Created by Sundear on 2017/8/25.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@interface NSObject (DeepCopy)

- (void)DeepCopyModel:(NSObject*)model;
- (instancetype)initWithModel:(NSObject*)model;
- (NSDictionary *)ToDic;
@end

