//
//  NetworkServiceTests.swift
//  
//
//  Created by Regis Araujo Melo on 10/03/23.
//

import XCTest
@testable import Networking

struct Todo: Codable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

final class NetworkServiceTests: XCTestCase {

    let session = URLSession(configuration: .ephemeral)
    var networkService: NetworkService!

    override func setUp() {
        super.setUp()
        networkService = NetworkService(session: session)
    }

    override func tearDown() {
        networkService = nil
        super.tearDown()
    }

    func testRequestSuccess() {
        // Given
        let expectation = XCTestExpectation(description: "Request should succeed")
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        let mockTodo = Todo(userId: 1, id: 1, title: "delectus aut autem", completed: false)
        let data = try? JSONEncoder().encode(mockTodo)
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        let session = MockURLSession(data: data, response: response, error: nil)
        networkService = NetworkService(session: session)

        // When
        networkService.request(url: url) { (result: Result<Todo, Error>) in
            // Then
            switch result {
            case .success(let todo):
                XCTAssertEqual(todo, mockTodo)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Request should succeed: \(error.localizedDescription)")
            }
        }

//        wait(for: [expectation], timeout: 1.0)
    }

    func testRequestFailure() {
        // Given
        let expectation = XCTestExpectation(description: "Request should fail")
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        let response = HTTPURLResponse(url: url, statusCode: 404, httpVersion: nil, headerFields: nil)!
        let session = MockURLSession(data: nil, response: response, error: nil)
        networkService = NetworkService(session: session)

        // When
        networkService.request(url: url) { (result: Result<Todo, Error>) in
            // Then
            switch result {
            case .success(let todo):
                XCTFail("Request should fail: \(todo)")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "A operação não pôde ser concluída. (Networking.NetworkError erro 0.)")
                expectation.fulfill()
            }
        }

//        wait(for: [expectation], timeout: 1.0)
    }

}
