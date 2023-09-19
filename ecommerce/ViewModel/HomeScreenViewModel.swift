//
//  HomeScreenViewModel.swift
//  ecommerce
//
//  Created by Janvi Arora on 16/09/23.
//

import UIKit

class HomeScreenViewModel {
    
    var productListModel = [ProductListModel]()
    
//    var prodImage: String
//    var prodTitle: String
//    var prodDescription: String
//    var prodCompany: String
//    var prodPrice: String
//    var prodColors: [ProductColor]
//
//    var viewModels: [HomeScreenViewModel] = []
//
//    weak var productListCellDelegate: ProductListCellDelegate?
//    weak var homeScreenDelegate: HomeScreenViewModelDelegate?
    
//    init(prodImage: String, prodTitle: String, prodDescription: String, prodCompany: String, prodPrice: String, prodColors: [ProductColor]) {
//        self.prodImage = prodImage
//        self.prodTitle = prodTitle
//        self.prodDescription = prodDescription
//        self.prodCompany = prodCompany
//        self.prodPrice = prodPrice
//        self.prodColors = prodColors
//    }
    
    func updateTableViewCells(completion: @escaping () -> Void) {
        APIClient.shared.request(from: Constants.productListURL, method: .GET) { [weak self] (result: Result<[ProductListModel], APIError>) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.productListModel = response
                    completion()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
