#import "SVGBaseDocument.h"
#import "Document+Mutable.h"

#import "DOMHelperUtilities.h"

#import "SVGNodeList+Mutable.h" // needed for access to underlying array, because SVG doesnt specify how lists are made mutable

@implementation SVGBaseDocument

@synthesize doctype;
@synthesize implementation;
@synthesize documentElement;



-(SVGBaseElement*) createElement:(NSString*) tagName
{
	SVGBaseElement* newElement = [[SVGBaseElement alloc] initWithLocalName:tagName attributes:nil];
	
	SVGKitLogVerbose( @"[%@] WARNING: SVG Spec, missing feature: if there are known attributes with default values, Attr nodes representing them SHOULD BE automatically created and attached to the element.", [self class] );
	
	return newElement;
}

-(SVGDocumentFragment*) createDocumentFragment
{
	return [[SVGDocumentFragment alloc] init];
}

-(SVGText*) createTextNode:(NSString*) data
{
	return [[SVGText alloc] initWithValue:data];
}

-(SVGComment*) createComment:(NSString*) data
{
	return [[SVGComment alloc] initWithValue:data];
}

-(SVGCDATASection*) createCDATASection:(NSString*) data
{
	return [[SVGCDATASection alloc] initWithValue:data];
}

-(SVGProcessingInstruction*) createProcessingInstruction:(NSString*) target data:(NSString*) data
{
	return [[SVGProcessingInstruction alloc] initProcessingInstruction:target value:data];
}

-(SVGAttr*) createAttribute:(NSString*) n
{
	return [[SVGAttr alloc] initWithName:n value:@""];
}

-(SVGEntityReference*) createEntityReference:(NSString*) data
{
	NSAssert( FALSE, @"Not implemented. According to spec: Creates an EntityReference object. In addition, if the referenced entity is known, the child list of the EntityReference  node is made the same as that of the corresponding Entity  node. Note: If any descendant of the Entity node has an unbound namespace prefix, the corresponding descendant of the created EntityReference node is also unbound; (its namespaceURI is null). The DOM Level 2 does not support any mechanism to resolve namespace prefixes." );
	return nil;
}

-(SVGNodeList*) getElementsByTagName:(NSString*) data
{
	SVGNodeList* accumulator = [[SVGNodeList alloc] init];
	[DOMHelperUtilities privateGetElementsByName:data inNamespace:nil childrenOfElement:self.documentElement addToList:accumulator];
	
	return accumulator;
}

// Introduced in DOM Level 2:
-(SVGNode*) importNode:(SVGNode*) importedNode deep:(BOOL) deep
{
	NSAssert( FALSE, @"Not implemented." );
	return nil;
}

// Introduced in DOM Level 2:
-(SVGBaseElement*) createElementNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName
{
	SVGBaseElement* newElement = [[SVGBaseElement alloc] initWithQualifiedName:qualifiedName inNameSpaceURI:namespaceURI attributes:nil];
	
	SVGKitLogVerbose( @"[%@] WARNING: SVG Spec, missing feature: if there are known attributes with default values, Attr nodes representing them SHOULD BE automatically created and attached to the element.", [self class] );
	
	return newElement;
}

// Introduced in DOM Level 2:
-(SVGAttr*) createAttributeNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName
{
	NSAssert( FALSE, @"This should be re-implemented to share code with createElementNS: method above" );
	SVGAttr* newAttr = [[SVGAttr alloc] initWithNamespace:namespaceURI qualifiedName:qualifiedName value:@""];
	return newAttr;
}

// Introduced in DOM Level 2:
-(SVGNodeList*) getElementsByTagNameNS:(NSString*) namespaceURI localName:(NSString*) localName
{
	SVGNodeList* accumulator = [[SVGNodeList alloc] init];
	[DOMHelperUtilities privateGetElementsByName:localName inNamespace:namespaceURI childrenOfElement:self.documentElement addToList:accumulator];
	
	return accumulator;
}

// Introduced in DOM Level 2:
-(SVGBaseElement*) getElementById:(NSString*) elementId
{
	return [DOMHelperUtilities privateGetElementById:elementId childrenOfElement:self.documentElement];
}

@end
