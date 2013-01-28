//
//  MyXML.h
//  xml
//
//  Created by ëÂêX íqéj on Wed Jan 07 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyXMLParser : NSXMLParser<NSXMLParserDelegate> {
//BOOL	    m_rdf;
    int		    m_stat;
    NSDictionary    *m_headerItems;
    NSMutableArray  *m_newsItems;
    NSString	    *m_version;
    
    NSString	    *m_name;
    NSMutableString *m_value;
    
    NSMutableDictionary *m_elemValue;
    NSMutableArray  *m_elements;
}

- (NSDictionary *)headerItems;
- (NSMutableArray *)newsItems;

@end
