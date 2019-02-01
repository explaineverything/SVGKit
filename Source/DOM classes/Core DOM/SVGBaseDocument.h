/*
//  Document.h

 NOT a Cocoa / Apple document,
 NOT an SVG document,
 BUT INSTEAD: a DOM document (blame w3.org for the too-generic name).
 
 Required for SVG-DOM
 
 c.f.:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#i-Document
 
 interface Document : Node {
 readonly attribute DocumentType     doctype;
 readonly attribute DOMImplementation  implementation;
 readonly attribute Element          documentElement;
 Element            createElement(in DOMString tagName)
 raises(DOMException);
 DocumentFragment   createDocumentFragment();
 Text               createTextNode(in DOMString data);
 Comment            createComment(in DOMString data);
 CDATASection       createCDATASection(in DOMString data)
 raises(DOMException);
 ProcessingInstruction createProcessingInstruction(in DOMString target, 
 in DOMString data)
 raises(DOMException);
 Attr               createAttribute(in DOMString name)
 raises(DOMException);
 EntityReference    createEntityReference(in DOMString name)
 raises(DOMException);
 NodeList           getElementsByTagName(in DOMString tagname);
 // Introduced in DOM Level 2:
 Node               importNode(in Node importedNode, 
 in boolean deep)
 raises(DOMException);
 // Introduced in DOM Level 2:
 Element            createElementNS(in DOMString namespaceURI, 
 in DOMString qualifiedName)
 raises(DOMException);
 // Introduced in DOM Level 2:
 Attr               createAttributeNS(in DOMString namespaceURI, 
 in DOMString qualifiedName)
 raises(DOMException);
 // Introduced in DOM Level 2:
 NodeList           getElementsByTagNameNS(in DOMString namespaceURI, 
 in DOMString localName);
 // Introduced in DOM Level 2:
 Element            getElementById(in DOMString elementId);
 };

 
 */

#import <Foundation/Foundation.h>

/** ObjectiveC won't allow this: @class Node; */
#import "SVGNode.h"
@class SVGBaseElement;
#import "SVGBaseElement.h"
//@class SVGComment;
#import "SVGComment.h"
@class SVGCDATASection;
#import "SVGCDATASection.h"
@class SVGDocumentFragment;
#import "SVGDocumentFragment.h"
@class SVGEntityReference;
#import "SVGEntityReference.h"
@class SVGNodeList;
#import "SVGNodeList.h"
@class SVGProcessingInstruction;
#import "SVGProcessingInstruction.h"
@class SVGDocumentType;
#import "SVGDocumentType.h"
@class AppleSucksDOMImplementation;
#import "AppleSucksDOMImplementation.h"

@interface SVGBaseDocument : SVGNode

@property(nonatomic,strong,readonly) SVGDocumentType*     doctype;
@property(nonatomic,strong,readonly) AppleSucksDOMImplementation*  implementation;
@property(nonatomic,strong,readonly) SVGBaseElement*          documentElement;


-(SVGBaseElement*) createElement:(NSString*) tagName __attribute__((ns_returns_retained));
-(SVGDocumentFragment*) createDocumentFragment __attribute__((ns_returns_retained));
-(SVGText*) createTextNode:(NSString*) data __attribute__((ns_returns_retained));
-(SVGComment*) createComment:(NSString*) data __attribute__((ns_returns_retained));
-(SVGCDATASection*) createCDATASection:(NSString*) data __attribute__((ns_returns_retained));
-(SVGProcessingInstruction*) createProcessingInstruction:(NSString*) target data:(NSString*) data __attribute__((ns_returns_retained));
-(SVGAttr*) createAttribute:(NSString*) data __attribute__((ns_returns_retained));
-(SVGEntityReference*) createEntityReference:(NSString*) data __attribute__((ns_returns_retained));

-(SVGNodeList*) getElementsByTagName:(NSString*) data;

// Introduced in DOM Level 2:
-(SVGNode*) importNode:(SVGNode*) importedNode deep:(BOOL) deep;

// Introduced in DOM Level 2:
-(SVGBaseElement*) createElementNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName __attribute__((ns_returns_retained));

// Introduced in DOM Level 2:
-(SVGAttr*) createAttributeNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName;

// Introduced in DOM Level 2:
-(SVGNodeList*) getElementsByTagNameNS:(NSString*) namespaceURI localName:(NSString*) localName;

// Introduced in DOM Level 2:
-(SVGBaseElement*) getElementById:(NSString*) elementId;

@end
