//
//  UIViewController+WSPMethod.m
//  WMSetting
//
//  Created by auto on 16/4/14.
//  Copyright © 2016年 Beijing TianyingJiuzhou Network Technology Co. Ltd. All rights reserved.
//

#import "UIViewController+WSPMethod.h"
#import <objc/runtime.h>

@implementation UIViewController (WSPMethod)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        
        SEL swizzledSelector = @selector(wsp_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class,
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
        /**
         *  Method originalMethod = class_getInstanceMethod(class, originalSelector);
         Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
         
         // When swizzling a class method, use the following:
         // Class class = object_getClass((id)self);
         // ...
         // Method originalMethod = class_getClassMethod(class, originalSelector);
         // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
         */
        
        
    });
}
#pragma mark - Method Swizzling

- (void)wsp_viewWillAppear:(BOOL)animated {
    [self wsp_viewWillAppear:animated];
    NSLog(@"wsp_viewWillAppear: %@", self);
}
@end
