//
//  NetworkError.swift
//  
//
//  Created by Regis Araujo Melo on 10/03/23.
//

import Foundation

internal enum NetworkError: Error {
    case invalidResponse
    case httpError(statusCode: Int, data: Data?)
    case emptyData
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
}
