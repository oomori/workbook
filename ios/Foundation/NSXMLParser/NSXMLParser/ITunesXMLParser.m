//
//  ITunesXMLParser.m
//  NSXMLParser
//
//  Created by 大森 智史 on 2012/09/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "ITunesXMLParser.h"

@implementation ITunesXMLParser
- (ITunesXMLParser *)initWithURL:(NSURL *)url
{
    self = [ super initWithContentsOfURL: url ];
    if ( self ) {
        [ self setDelegate: self ];
        m_stat = 0;
    }
    return self;
}

- (ITunesXMLParser *)initWithData:(NSData *)data
{
    self = [ super initWithData: data ];
    if ( self ) {
        [ self setDelegate: self ];
    }
    return self;
}

- (NSDictionary *)headerItems
{
    return (m_headerItems);
}

- (NSMutableArray *)newsItems
{
    return (m_newsItems);
}

- (NSString *)version
{
    return (m_version);
}

#pragma mark -
#pragma mark == Delegate ==
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog( @"parserDidStartDocument" );
    
    m_stat = 0;
    m_value = [ NSMutableString string ];
    m_elemValue = [ NSMutableDictionary dictionary ];
    m_elements = [ NSMutableArray array ];
	
    NSLog( @"columnNumber : %d", [ parser columnNumber ] );
    NSLog( @"lineNumber : %d", [ parser lineNumber ] );
    
}

//
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog( @"parserDidEndDocument" );
    
    m_newsItems = [ m_elements copy ];
}

//
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName //ÉGÉåÉÅÉìÉgñº
  namespaceURI:(NSString *)namespaceURI //ñºëOãÛä‘
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict
{
    NSLog( @"didStartElement : %@, %@, %@, %@", elementName, namespaceURI, qName, [ attributeDict description ] );
    
    
    
    
}
//
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    NSLog( @"contents : %@", m_value );
    [m_elements addObject:[NSDictionary dictionaryWithObjectsAndKeys:elementName,@"elementName",[m_value copy],@"contents", nil] ];
    [m_value setString:@""];
    /*
     [parser abortParsing];
     NSError *error = nil;
     error = [parser parserError];
     NSLog( @"error : %@", [error description] );
     */
    
    NSLog( @"didEndElement : %@, %@, %@", elementName, namespaceURI, qName );
    
}

//
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //NSLog( @"foundCharacters : %@", string );
    [m_value appendString:string];
}

//
-(void)parser:(NSXMLParser *)parser didEndMappingPrefix:(NSString *)prefix
{
    NSLog( @"didEndMappingPrefix : %@", prefix );
}

//
-(void)parser:(NSXMLParser *)parser didStartMappingPrefix:(NSString *)prefix toURI:(NSString *)namespaceURI
{
    NSLog( @"didEndMappingPrefix : %@ %@ ", prefix , namespaceURI );
}

//
-(void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue
{
    NSLog( @"foundAttributeDeclarationWithName : %@ %@ ", attributeName , elementName );
}

//
-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
    NSLog( @"foundCDATA : %@  ", [CDATABlock description] );
}
-(void)parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName model:(NSString *)model
{
    NSLog( @"foundElementDeclarationWithName : %@ %@ ", elementName , model );
}

//
-(void)parser:(NSXMLParser *)parser foundExternalEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID
{
    NSLog( @"foundExternalEntityDeclarationWithName : %@ %@ %@", name , publicID ,  systemID);
}

-(void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString
{
    NSLog( @"foundIgnorableWhitespace : %@ ", whitespaceString);
}


//
-(void)parser:(NSXMLParser *)parser foundInternalEntityDeclarationWithName:(NSString *)name value:(NSString *)value
{
    NSLog( @"foundInternalEntityDeclarationWithName : %@ %@", name , value);
}

//
-(void)parser:(NSXMLParser *)parser foundNotationDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID
{
    NSLog( @"foundNotationDeclarationWithName : %@ %@ %@", name , publicID ,  systemID);
}

//
-(void)parser:(NSXMLParser *)parser foundProcessingInstructionWithTarget:(NSString *)name data:(NSString *)data
{
    NSLog( @"foundProcessingInstructionWithTarget : %@ %@", name , data);
}

//
-(void)parser:(NSXMLParser *)parser foundUnparsedEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID notationName:(NSString *)notationName
{
    NSLog( @"foundUnparsedEntityDeclarationWithName : %@ %@ %@ %@", name , publicID ,  systemID,notationName);
}

//ÉRÉÅÉìÉgÇî≠å©
- (void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment
{
    NSLog( @"foundComment : %@  ", comment );
    [parser abortParsing];
}
//
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError*)parseError
{
    NSLog( @"parseErrorOccurred : %@  ", [parseError description] );
    
}
//
-(NSData *)parser:(NSXMLParser *)parser resolveExternalEntityName:(NSString *)name systemID:(NSString *)systemID
{
    NSLog( @"resolveExternalEntityName : %@ %@", name , systemID);
    return nil;
}



@end

