
#import "DOMHelperUtilities.h"

#import "SVGBaseElement.h"
#import "SVGNodeList.h"
#import "SVGNodeList+Mutable.h" // needed for access to underlying array, because SVG doesnt specify how lists are made mutable

@implementation DOMHelperUtilities

/*! This useful method provides both the DOM level 1 and the DOM level 2 implementations of searching the tree for a node - because THEY ARE DIFFERENT
 yet very similar
 */
+(void) privateGetElementsByName:(NSString*) name inNamespace:(NSString*) namespaceURI childrenOfElement:(SVGNode*) parent addToList:(SVGNodeList*) accumulator
{
	/** According to spec, this is only valid for ELEMENT nodes */
	if( [parent isKindOfClass:[SVGBaseElement class]] )
	{
		if( namespaceURI != nil && ! [parent.namespaceURI isEqualToString:namespaceURI] )
		{
			// skip
		}
		else
		{
			SVGBaseElement* parentAsElement = (SVGBaseElement*) parent;
			
			/** According to spec, "tag name" for an Element is the value of its .nodeName property; that means SOMETIMES its a qualified name! */
			BOOL includeThisNode = FALSE;
			
			
			if( [name isEqualToString:@"*"] )
				includeThisNode = TRUE;
			
			if( !includeThisNode )
			{
				if( namespaceURI == nil ) // No namespace? then do a qualified compare
				{
					includeThisNode = [parentAsElement.tagName isEqualToString:name];
				}
				else // namespace? then do an UNqualified compare
				{
					includeThisNode = [parentAsElement.localName isEqualToString:name];
				}
			}
			
			if( includeThisNode )
			{
				[accumulator.internalArray addObject:parent];
			}
		}
	}
	
	for( SVGNode* childNode in parent.childNodes )
	{
		[self privateGetElementsByName:name inNamespace:namespaceURI childrenOfElement:childNode addToList:accumulator];
	}
}

+(SVGBaseElement*) privateGetElementById:(NSString*) idValue childrenOfElement:(SVGNode*) parent
{
	/** According to spec, this is only valid for ELEMENT nodes */
	if( [parent isKindOfClass:[SVGBaseElement class]] )
	{
		SVGBaseElement* parentAsElement = (SVGBaseElement*) parent;

		if( [[parentAsElement getAttribute:@"id"] isEqualToString:idValue])
			return parentAsElement;
#if DEBUG_DOM_MATCH_ELEMENTS_IDS_AND_NAMES
		else
		{
			SVGKitLogVerbose(@"parent <%@ id='%@'..> does not match id='%@'", parentAsElement.nodeName, [parentAsElement getAttribute:@"id"], idValue );
			SVGKitLogVerbose(@"parent <%@ id='%@'..> has %li child nodes = %@", parentAsElement.nodeName, [parentAsElement getAttribute:@"id"], parent.childNodes.length, parent.childNodes );
		}
#endif
	}
	
	for( SVGNode* childNode in parent.childNodes )
	{
		SVGBaseElement* childResult = [self privateGetElementById:idValue childrenOfElement:childNode];
		
		if( childResult != nil )
			return childResult;
	}
	
	return nil;
}

@end
