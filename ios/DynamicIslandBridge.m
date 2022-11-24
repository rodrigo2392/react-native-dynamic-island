//
//  DynamicIslandBridge.m
//  Demo
//
//  Created by Rodrigo Mendez on 23/11/22.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(DynamicIslandModule, NSObject)

RCT_EXTERN_METHOD(testFunc:(NSString) title withMessage:(NSString) b
                 withResolver:(RCTPromiseResolveBlock) resolve
                 withRejecter:(RCTPromiseRejectBlock) reject)


RCT_EXTERN_METHOD(startNotificationActivity:(NSString) title withMessage:(NSString) message)
RCT_EXTERN_METHOD(updateNotificationActivity:(NSString) message)
RCT_EXTERN_METHOD(endNotificationActivity)

@end
