//
//  NSObject+DeepCopy.m
//  ModelCheck
//
//  Created by Sundear on 2017/8/25.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import "NSObject+DeepCopy.h"

@implementation NSObject (DeepCopy)


- (void)DeepCopyModel:(NSObject*)model{
    [self setValuesForKeysWithDictionary:[model ToDic]];
}

- (instancetype)initWithModel:(NSObject*)model{
    self = [self init];
    if(self)[self setValuesForKeysWithDictionary:[model ToDic]];
    return self;
}



// model → dic
- (NSDictionary *)ToDic
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++) {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

@end



