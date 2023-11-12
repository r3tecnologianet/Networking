//
//  NetworkConfigurable.swift
//  Networking_iOS
//
//  Created by Regis Araujo Melo on 12/03/23.
//

import Foundation

public protocol NetworkConfigurable {
    var baseURL: URL { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String] { get }
}
