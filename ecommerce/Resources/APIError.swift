//
//  APIError.swift
//  ecommerce
//
//  Created by Janvi Arora on 16/09/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case requestFailed(Error)
    case decodingFailed(Error)
}
