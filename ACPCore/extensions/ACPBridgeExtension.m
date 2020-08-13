/*
Copyright 2018 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

#import <objc/runtime.h>
#import "ACPBridgeExtension.h"
#import "ACPExtensionApi.h"

static NSMutableDictionary *extensionVersionDict_; // maps the bridged extension name to the extension name
static NSLock *extensionVersionLock_;
static NSMutableDictionary *extensionClassDict_; // maps the bridged extension name to the ACPExtension implementation
static NSLock *extensionClassLock_;

@implementation ACPBridgeExtension {
    ACPExtension *underlyingExtension_;
    id<AEPExtensionRuntime> runtime_;
}

@synthesize metadata;
@synthesize runtime;

+ (void) load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        extensionClassDict_ = [[NSMutableDictionary alloc] init];
        extensionClassLock_ = [[NSLock alloc] init];
        extensionVersionDict_ = [[NSMutableDictionary alloc] init];
        extensionVersionLock_ = [[NSLock alloc] init];
    });
}

+ (void) setExtensionClass: (Class)extensionClass withName: (NSString *)extensionName {
    [extensionClassLock_ lock];
    extensionClassDict_[extensionName] = extensionClass;
    [extensionClassLock_ unlock];
}

+ (NSString * _Nonnull)extensionVersion {
    NSString *className = NSStringFromClass([self class]);
    [extensionVersionLock_ lock];
    NSString *version = extensionVersionDict_[className];
    [extensionVersionLock_ unlock];
    return version;
}

- (nullable instancetype)initWithRuntime:(id<AEPExtensionRuntime> _Nonnull)runtime {
    self = [super init];
    runtime_ = runtime;
    
    [extensionClassLock_ lock];
    Class extensionClass = extensionClassDict_[NSStringFromClass([self class])];
    [extensionClassLock_ unlock];
    // create the extension api
    ACPExtensionApi *api = [[ACPExtensionApi alloc] initWithRuntime:runtime_];
    // create the extension with the api
    underlyingExtension_ = [[extensionClass alloc] initWithApi:api];
    [self setExtensionVersion:underlyingExtension_.version];
    
    return self;
}

- (NSString *)friendlyName {
    return underlyingExtension_.name;
}

- (NSString *)name {
    return underlyingExtension_.name;
}

- (void)onRegistered {
    // nothing
}

- (void)onUnregistered {
    [underlyingExtension_ onUnregister];
}

- (BOOL)readyForEvent:(AEPEvent * _Nonnull)event {
    return true;
}

- (void)setExtensionVersion: (NSString *) version {
    NSString *className = NSStringFromClass([self class]);
    [extensionVersionLock_ lock];
    extensionVersionDict_[className] = version;
    [extensionVersionLock_ unlock];
}

@end
