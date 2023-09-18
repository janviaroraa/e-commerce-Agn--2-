//
//  HomeScreenViewModel.swift
//  ecommerce
//
//  Created by Janvi Arora on 16/09/23.
//

import UIKit

struct HomeScreenViewModel {
    var prodImage: String
    var prodTitle: String
    var prodDescription: String
    var prodCompany: String
    var prodPrice: String
    var prodColors: [String]
    
    init(prodImage: String, prodTitle: String, prodDescription: String, prodCompany: String, prodPrice: String, prodColors: [String]) {
            self.prodImage = prodImage
            self.prodTitle = prodTitle
            self.prodDescription = prodDescription
            self.prodCompany = prodCompany
            self.prodPrice = prodPrice
            self.prodColors = prodColors
        }
        
        func updateTableViewCells() {
            DispatchQueue.main.async {
                APIClient.shared.request(from: Constants.productListURL, method: .GET) { (result: Result<[ProductListModel], APIError>) in
                    switch result {
                    case .success(let response):
                        print(response)
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
        }
    }
}
