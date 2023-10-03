//
//  NetworkService.swift
//  
//
//  Created by Regis Araujo Melo on 10/03/23.
//

import Foundation

public class NetworkService {

    public typealias CompletionHandler<T: Decodable> = (Result<T, Error>) -> Void

    private let session: URLSession

    public init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    /// Método para fazer uma requisição de rede.
    ///
    /// - Parameters:
    ///   - url: A URL para a qual fazer a requisição.
    ///   - method: O método HTTP a ser usado.
    ///   - headers: Os cabeçalhos HTTP a serem enviados.
    ///   - body: O corpo da requisição.
    ///   - completion: A closure chamada após a conclusão da requisição.
    public func request<T: Decodable>(url: URL,
                                      method: HttpMethodtype = .get,
                                      headers: [String: String]? = nil,
                                      body: Data? = nil,
                                      completion: @escaping CompletionHandler<T>) {

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        headers?.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }

        session.dataTask(with: request) { data, response, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }

            guard (200..<300).contains(httpResponse.statusCode) else {
                let error = NetworkError.httpError(statusCode: httpResponse.statusCode, data: data)
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.emptyData))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }

        }.resume()
    }

}
