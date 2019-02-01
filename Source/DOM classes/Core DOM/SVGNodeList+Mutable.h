/**
 Makes the writable properties all package-private, effectively
 */

#import "SVGNodeList.h"

@interface SVGNodeList()

@property(nonatomic,strong) NSMutableArray* internalArray;

@end
