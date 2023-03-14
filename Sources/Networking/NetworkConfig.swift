//
//  NetworkConfig.swift
//  Networking_iOS
//
//  Created by Regis Araujo Melo on 12/03/23.
//

import Foundation

public struct NetworkConfig: NetworkConfigurable {

    public let baseURL: URL
    public let headers: [String: String]
    public let queryParameters: [String: String]

    public init(baseURL: URL,
                headers: [String: String] = [:],
                queryParameters: [String: String] = [:]) {
        self.baseURL = baseURL
        self.headers = headers
        self.queryParameters = queryParameters
    }

}
