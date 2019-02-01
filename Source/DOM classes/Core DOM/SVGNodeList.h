/*
 Implemented internally via an NSArray
 
 NB: contains a slight "upgrade" from the SVG Spec to make it support Objective-C's
 Fast Enumeration feature
 
 From SVG DOM, via CoreDOM:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-536297177
 
 interface SVGNodeList {
 Node               item(in unsigned long index);
 readonly attribute unsigned long    length;
 };

 */
#import <Foundation/Foundation.h>

@class SVGNode;
#import "SVGNode.h"

@interface SVGNodeList : NSObject <NSFastEnumeration>

@property(readonly) NSUInteger length;

-(SVGNode*) item:(NSUInteger) index;

@end
