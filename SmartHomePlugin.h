/*
 *  SmartHomePlugin.h
 *  SmartHome
 *
 *  Created by Matthew Stuart on 02/07/09.
 *  Copyright 2009 Surge Ingenuities Inc. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import "CodaPluginsController.h"

@class CodaPlugInsController;

@interface SmartHomePlugIn : NSObject <CodaPlugIn>
{
	CodaPlugInsController* controller;
}

- (id)initWithPlugInController:(CodaPlugInsController*)controller bundle:(NSBundle*)aBundle;
- (void)smart_home:(id)sender;

@end
