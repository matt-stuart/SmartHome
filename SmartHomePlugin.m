//
//  SmartHomePlugin.m
//  SmartHome
//
//  Created by Matthew Stuart on 02/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SmartHomePlugin.h"
#import "CodaPlugInsController.h"

@implementation SmartHomePlugIn

- (id)initWithPlugInController:(CodaPlugInsController*)inController bundle:(NSBundle*)aBundle
{
	if ( (self = [super init]) != nil )
	{
		controller = inController;
		[controller registerActionWithTitle:NSLocalizedString(@"SmartHome", @"SmartHome")
                      underSubmenuWithTitle:nil
                                     target:self
                                   selector:@selector(smart_home:)
                          representedObject:nil
                              keyEquivalent:@"@"
                                 pluginName:NSLocalizedString( @"SmartHome", @"SmartHome" )];
		
	}
	return self;
}


- (NSString*)name
{
	return @"SmartHome";
}


- (void)smart_home:(id)sender
{
	CodaTextView* tv = [controller focusedTextView:self];
	if ( tv )
	{
		NSString* lineText = [tv currentLine];
		NSRange ws = [lineText rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
		int last_pos = 0;
		
		//Add EOL protection
		//Add empty line protection
		
		while ( ws.location == last_pos ) {
			last_pos = ws.location + ws.length;
			ws = [lineText rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet] options:NSLiteralSearch range:NSMakeRange( last_pos, 1 ) ];
		}
		
		//Get current location and compare to smart start of line. If Current location is AHEAD of the SSOL then
		NSRange current_range = [tv currentWordRange];
		NSRange range = NSMakeRange( [tv startOfLine], 0 );
		if ( current_range.location > (range.location + last_pos) )
			range.location += last_pos;
		[tv setSelectedRange:range];
	}
}

@end
