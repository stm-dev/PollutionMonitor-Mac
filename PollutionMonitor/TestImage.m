//
//  TestImage.m
//  ProjectName
//
//  Created by Demian Turner on 14/12/2016.
//  Copyright (c) 2016 Seagull Systems. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "TestImage.h"


@implementation TestImage

#pragma mark Cache

static NSImage* _imageOfMyImage = nil;

//// Color Declarations
static NSColor* green;
static NSColor* yellow;
static NSColor* orange;
static NSColor* red;
static NSColor* purple;
static NSColor* burgandy;

#pragma mark Initialization

+ (void)initialize
{
    // standard AQI colours
    green = [NSColor colorWithCalibratedRed: 0.07 green: 0.541 blue: 0.325 alpha: 1];
    yellow = [NSColor colorWithCalibratedRed: 0.997 green: 0.849 blue: 0.157 alpha: 1];
    orange = [NSColor colorWithCalibratedRed: 0.991 green: 0.524 blue: 0.154 alpha: 1];
    red = [NSColor colorWithCalibratedRed: 0.746 green: 0 blue: 0.152 alpha: 1];
    purple = [NSColor colorWithCalibratedRed: 0.32 green: 0 blue: 0.531 alpha: 1];
    burgandy = [NSColor colorWithCalibratedRed: 0.415 green: 0 blue: 0.104 alpha: 1];
}

#pragma mark Drawing Methods

+ (void)drawMyImage:(int)measurement
{
    //// background Drawing
    NSBezierPath* backgroundPath = [NSBezierPath bezierPathWithRect: NSMakeRect(0, 0, 60, 21)];
    
    NSColor *theColor;
    if (measurement >= 0 && measurement <= 50) {
        theColor = green;
    } else if (measurement >= 51 && measurement <= 100) {
        theColor = yellow;
    } else if (measurement >= 101 && measurement <= 150) {
        theColor = orange;
    } else if (measurement >= 151 && measurement <= 200) {
        theColor = red;
    } else if (measurement >= 201 && measurement <= 300) {
        theColor = purple;
    } else if (measurement >= 300 ) {
        theColor = burgandy;
    }
    
    NSColor *textColor;
    if (measurement >= 51 && measurement <= 100) {
        textColor = NSColor.blackColor;
    } else {
        textColor = NSColor.whiteColor;
    }
    
    
    [theColor setFill];
    [backgroundPath fill];

    //// Text Drawing
    NSRect textRect = NSMakeRect(0, 0, 60, 21);
    {
        NSString* textContent = [NSString stringWithFormat:@"%d", measurement];
        NSMutableParagraphStyle* textStyle = [NSMutableParagraphStyle new];
        textStyle.alignment = NSTextAlignmentCenter;

        NSDictionary* textFontAttributes = @{NSFontAttributeName: [NSFont menuBarFontOfSize: NSFont.systemFontSize], NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName: textStyle};

        CGFloat textTextHeight = NSHeight([textContent boundingRectWithSize: textRect.size options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes]);
        NSRect textTextRect = NSMakeRect(NSMinX(textRect), NSMinY(textRect) + (NSHeight(textRect) - textTextHeight) / 2, NSWidth(textRect), textTextHeight);
        [NSGraphicsContext saveGraphicsState];
        NSRectClip(textRect);
        [textContent drawInRect: NSOffsetRect(textTextRect, 0, 1) withAttributes: textFontAttributes];
        [NSGraphicsContext restoreGraphicsState];
    }
}

#pragma mark Generated Images

+ (NSImage *)imageOfMyImage:(int)measurement
{
    _imageOfMyImage = [NSImage imageWithSize: NSMakeSize(60, 21) flipped:NO drawingHandler: ^(NSRect dstRect)
    {
        [TestImage drawMyImage:measurement];
        return YES;
    }];

    return _imageOfMyImage;
}

@end
