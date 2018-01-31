//
//  Mediator.m
//  Component-based
//
//  Created by mac on 2018/1/29.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator.h"
#import <objc/runtime.h>

@implementation MediatorOptions

+(instancetype)optionsWithTargetName:(NSString *)targetName actionName:(NSString *)actionName {
    
    MediatorOptions *options = [[MediatorOptions alloc] init];
    if (options) {
        options.targetName = targetName;
        options.actionName = actionName;
    }
    return options;
}

@end

@interface Mediator ()

@property(nonatomic,strong) NSMutableDictionary<NSString*, id> *cacheTargetDictionary;

@end



@implementation Mediator

+(instancetype)sharedInstance {
    
    static Mediator *mediator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        mediator = [[Mediator alloc] init];
    });
    return mediator;
}

-(id)performActionWithUrl:(NSURL *)url completion:(void (^)(NSDictionary * _Nullable))completion {
    
    return nil;
}
-(id)performWithOptions:(MediatorOptions *)options {
    return [self performTarget:options.targetName action:options.actionName params:options.parameters shouldCacheTarget:options.shouldCacheTarget cacheTargetKey:options.cacheKey];
}
-(id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary<NSString *,id> *)params shouldCacheTarget:(BOOL)shouldCacheTarget cacheTargetKey:(NSString *)cacheKey {
    
    id target;
    if(cacheKey) {
        target = _cacheTargetDictionary[cacheKey];
    }
    
    if(!target) {
        target = [[NSClassFromString(targetName) alloc] init];
    }
    
    if(!target) {
        NSLog(@"target does not exist");
        return nil;
    }
    
    if(shouldCacheTarget) {
        if(cacheKey) {
            [_cacheTargetDictionary setObject:target forKey:cacheKey];
        } else {
            NSLog(@"cacheKey is nil");
            return nil;
        }
    }
    
    if(!actionName) {
        NSLog(@"actionName is nil");
        return nil;
    }
    
    SEL action = NSSelectorFromString(actionName);
    if([target respondsToSelector:action]) {
        
        //        _Nullable id returnValue = ((_Nullable id (*)(void *, SEL, NSDictionary<NSString*, id>*))objc_msgSend)((__bridge void *)(target), action, params);
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
        
        // return returnValue;
    } else {
        NSLog(@"%@ not found", actionName);
        
        return nil;
    }
}
-(void)removeCacheTargetWithKey:(NSString *)cacheKey {
    [_cacheTargetDictionary removeObjectForKey:cacheKey];
}

+(NSString *)generateCacheKey {
    NSString *key = [[[NSUUID UUID] UUIDString] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return key;
}

#pragma mark ==================getters and setters==================
- (NSMutableDictionary *)cachedTarget
{
    if (_cacheTargetDictionary == nil) {
        _cacheTargetDictionary = [[NSMutableDictionary alloc] init];
    }
    return _cacheTargetDictionary;
}
@end
