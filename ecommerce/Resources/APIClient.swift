//
//  APIClient.swift
//  ecommerce
//
//  Created by Janvi Arora on 16/09/23.
//

import Foundation

class APIClient {
    
    static let shared = APIClient()
    
    private init() { }
    
    func request<T: Codable>(from url: URL, method: HTTPMethod, params: [String: Any]? = nil, completion: @escaping (Result<T, APIError>) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let params = params, method == .POST || method == .PUT {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params)
            } catch {
                completion(.failure(.requestFailed(error)))
            }
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error.localizedDescription)")
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let data = data else {
                print("Invalid response: Data is nil")
                completion(.failure(.invalidResponse))
                return
            }
            
            print(String(data: data, encoding: .utf8) ?? "default Value")
            
            do {
                let decodedData = try JSONDecoder().decode([ProductListModel].self, from: data)
                completion(.success(decodedData as! T))
                print(decodedData)
            } catch {
                print("Decoding failed with error: \(error.localizedDescription)")
                completion(.failure(.decodingFailed(error)))
            }
        }
        task.resume()
    }
}
