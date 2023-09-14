//
//  ProductListCell.swift
//  ecommerce
//
//  Created by Janvi Arora on 14/09/23.
//

import UIKit

class ProductListCell: UITableViewCell {
    static let identifier = "productListCellIdentifier"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        self.contentView.backgroundColor = .brown
    }
    
    private func addConstraints() {
        
    }
}
