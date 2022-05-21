//
//  RSS_News_ReaderUITestsLaunchTests.m
//  RSS_News_ReaderUITests
//
//  Created by Mohd Raza on 18/05/22.
//

#import <XCTest/XCTest.h>

@interface RSS_News_ReaderUITestsLaunchTests : XCTestCase

@end

@implementation RSS_News_ReaderUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
