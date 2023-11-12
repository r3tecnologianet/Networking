//
//  MockURLSession.swift
//  
//
//  Created by Regis Araujo Melo on 10/03/23.
//

import Foundation

internal class MockURLSession: URLSession {

    var data: Data?
    var response: URLResponse?
    var error: Error?

    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
        super.init()
    }

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = MockURLSessionDataTask()
        task.completionHandler = {
            completionHandler(self.data, self.response, self.error)
        }
        return task
    }

}
