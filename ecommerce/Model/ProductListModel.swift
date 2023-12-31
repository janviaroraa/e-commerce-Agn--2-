//
//  ProductListModel.swift
//  ecommerce
//
//  Created by Janvi Arora on 15/09/23.
//

import Foundation

struct ProductListModel: Codable {
    
    let id: Int?
    let brand: String?
    let name, price: String?
    let imageLink: String?
    let productLink: String?
    let websiteLink: String?
    let description: String?
    let rating: Double?
    let category: String?
    let productType: String?
    let productAPIURL: String?
    let apiFeaturedImage: String?
    let productColors: [ProductColor]?
    var isAddedToWishlist: Bool = false

    enum CodingKeys: String, CodingKey {
        case id, brand, name, price
        case imageLink = "image_link"
        case productLink = "product_link"
        case websiteLink = "website_link"
        case description, rating, category
        case productType = "product_type"
        case productAPIURL = "product_api_url"
        case apiFeaturedImage = "api_featured_image"
        case productColors = "product_colors"
    }
}

struct ProductColor: Codable {
    let hexValue: String?
    let colourName: String?

    enum CodingKeys: String, CodingKey {
        case hexValue = "hex_value"
        case colourName = "colour_name"
    }
}
