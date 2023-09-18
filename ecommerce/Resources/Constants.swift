//
//  Constants.swift
//  ecommerce
//
//  Created by Janvi Arora on 16/09/23.
//

import Foundation

struct Constants {
    static let productListURLString = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"
    
    static let productListURL = URL(string: productListURLString)!
}
