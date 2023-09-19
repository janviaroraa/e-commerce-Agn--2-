//
//  UserDefaultsManager.swift
//  ecommerce
//
//  Created by Janvi Arora on 19/09/23.
//

import UIKit

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    func addToWishlist(productId: Int) {
        UserDefaults.standard.set(true, forKey: "wishlist_\(productId)")
    }
    
    func removeFromWishlist(productId: Int) {
        UserDefaults.standard.removeObject(forKey: "wishlist_\(productId)")
    }
    
    func isInWishlist(productId: Int) -> Bool {
        return UserDefaults.standard.bool(forKey: "wishlist_\(productId)")
    }
}
