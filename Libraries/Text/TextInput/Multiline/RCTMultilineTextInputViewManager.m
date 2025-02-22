/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <React/RCTMultilineTextInputViewManager.h>
#import <React/RCTMultilineTextInputView.h>
#import <React/RCTUITextView.h> // TODO(macOS GH#774)

@implementation RCTMultilineTextInputViewManager

RCT_EXPORT_MODULE()

- (RCTUIView *)view // TODO(macOS ISS#3536887)
{
  return [[RCTMultilineTextInputView alloc] initWithBridge:self.bridge];
}

#pragma mark - Multiline <TextInput> (aka TextView) specific properties

RCT_REMAP_NOT_OSX_VIEW_PROPERTY(dataDetectorTypes, backedTextInputView.dataDetectorTypes, UIDataDetectorTypes) // TODO(macOS GH#774)
RCT_REMAP_OSX_VIEW_PROPERTY(dataDetectorTypes, backedTextInputView.enabledTextCheckingTypes, NSTextCheckingTypes) // TODO(macOS GH#774)

#if TARGET_OS_OSX // [TODO(macOS GH#774)
RCT_CUSTOM_VIEW_PROPERTY(pastedTypes, NSArray<NSPasteboardType>*, RCTUITextView)
{
  NSArray<NSPasteboardType> *types = json ? [RCTConvert NSPasteboardTypeArray:json] : nil;
  if ([view respondsToSelector:@selector(setReadablePasteBoardTypes:)]) {
    [view setReadablePasteBoardTypes: types];
  }
}
#endif // ]TODO(macOS GH#774)

@end
