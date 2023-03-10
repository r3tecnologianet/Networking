//
//  MockURLSessionDataTask.swift
//  
//
//  Created by Regis Araujo Melo on 10/03/23.
//

import UIKit

internal class MockURLSessionDataTask: URLSessionDataTask {

    var completionHandler: (() -> Void)?

    override func resume() {

        DispatchQueue.main.async { [weak self] in
            self?.completionHandler?()
        }
    }

}
