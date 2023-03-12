//
//  HttpMethod.swift
//  
//
//  Created by Regis Araujo Melo on 10/03/23.
//

import Foundation

internal enum HttpMethodtype: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}
