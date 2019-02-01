/**
 Makes the writable properties all package-private, effectively
 */
#import "SVGNode.h"

@interface SVGNode()
@property(nonatomic,strong,readwrite) NSString* nodeName;
@property(nonatomic,strong,readwrite) NSString* nodeValue;

@property(nonatomic,readwrite) DOMNodeType nodeType;
@property(nonatomic,weak,readwrite) SVGNode* parentNode;
@property(nonatomic,strong,readwrite) SVGNodeList* childNodes;
@property(nonatomic,strong,readwrite) SVGNamedNodeMap* attributes;

@property(nonatomic,weak,readwrite) Document* ownerDocument;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readwrite) NSString* namespaceURI;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readwrite) NSString* prefix;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readwrite) NSString* localName;

@end
