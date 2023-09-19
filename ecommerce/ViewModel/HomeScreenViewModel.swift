//
//  HomeScreenViewModel.swift
//  ecommerce
//
//  Created by Janvi Arora on 16/09/23.
//

import UIKit

class HomeScreenViewModel {
    
    var productListModel = [ProductListModel]()
    
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
