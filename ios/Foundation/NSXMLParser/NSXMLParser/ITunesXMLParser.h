//
//  ITunesXMLParser.h
//  NSXMLParser
//
//  Created by 大森 智史 on 2012/09/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITunesXMLParser : NSXMLParser<NSXMLParserDelegate> {
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
