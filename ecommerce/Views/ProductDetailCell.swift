//
//  ProductDetailCell.swift
//  ecommerce
//
//  Created by Janvi Arora on 15/09/23.
//

import Foundation
import UIKit

class ProductDetailCell: UITableViewCell {
    
    static let identifier = "productDetailCellIdentifier"
    
    private lazy var productDetailStack: UIStackView = {
        let stk = UIStackView()
        stk.axis = .vertical
        stk.spacing = 10
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private lazy var imageAndWishlistView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var productImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "Image1"))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var addToWishlistButton: UIButton = {
        let btn = UIButton()
        
        if let heartImage = UIImage(systemName: "heart.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal) {
            let imageSize = CGSize(width: 50, height: 35)
            let resizedImage = heartImage.resizeImage(to: imageSize)
            btn.setImage(resizedImage, for: .normal)
        }
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(addToWishlistButtonClicked), for: .touchUpInside)
        return btn
    }()
    
    @objc private func addToWishlistButtonClicked() {
        print("add To Wishlist Button Clicked")
    }
    
    private lazy var productCompanyName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Maybelline"
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var productTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Maybelline Face Studio Master Hi-Light Light Booster Bronzer"
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var productInfoStackView: UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private lazy var priceAndCategoryStack: UIStackView = {
        let stk = UIStackView()
        stk.axis = .vertical
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private lazy var productPrice: UILabel = {
        let lbl = UILabel()
        lbl.text = "USD 14.99"
        lbl.textAlignment = .left
        lbl.textColor = .red
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var productCategory: UILabel = {
        let lbl = UILabel()
        lbl.text = "Blush"
        lbl.textAlignment = .left
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var starsView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var numberOfStars: UILabel = {
        let lbl = UILabel()
        lbl.text = "⭐"
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var colorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    private lazy var productDescription: UILabel = {
        let lbl = UILabel()
        lbl.text = "Maybelline Face Studio Master Hi-Light Light Boosting bronzer formula has an expert balance of shade + shimmer illuminator for natural glow. Skin goes soft-lit with zero glitz. For Best Results: Brush over all shades in palette and gently sweep over cheekbones, brow bones, and temples, or anywhere light naturally touches the face."
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var spacerView: UIView = {
        UIView()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        self.contentView.backgroundColor = .clear
        contentView.addSubview(productDetailStack)
        productDetailStack.addArrangedSubview(imageAndWishlistView)
        imageAndWishlistView.addSubview(productImage)
        imageAndWishlistView.addSubview(addToWishlistButton)
        productDetailStack.addArrangedSubview(productCompanyName)
        productDetailStack.addArrangedSubview(productTitle)
        productDetailStack.addArrangedSubview(productInfoStackView)
        productInfoStackView.addArrangedSubview(priceAndCategoryStack)
        productInfoStackView.addArrangedSubview(spacerView)
        productInfoStackView.addArrangedSubview(starsView)
        starsView.addSubview(numberOfStars)
        priceAndCategoryStack.addArrangedSubview(productPrice)
        priceAndCategoryStack.addArrangedSubview(productCategory)
        productDetailStack.addArrangedSubview(colorsCollectionView)
        productDetailStack.addArrangedSubview(productDescription)
    }
    
    private func addConstraints() {
        let constraintsToAdd: [NSLayoutConstraint] = [
            productDetailStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productDetailStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productDetailStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            productDetailStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageAndWishlistView.heightAnchor.constraint(equalToConstant: 300),
            productImage.topAnchor.constraint(equalTo: imageAndWishlistView.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: imageAndWishlistView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: imageAndWishlistView.trailingAnchor),
            productImage.bottomAnchor.constraint(equalTo: imageAndWishlistView.bottomAnchor),
            addToWishlistButton.trailingAnchor.constraint(equalTo: imageAndWishlistView.trailingAnchor),
            addToWishlistButton.bottomAnchor.constraint(equalTo: imageAndWishlistView.bottomAnchor),
            addToWishlistButton.heightAnchor.constraint(equalToConstant: 40),
            addToWishlistButton.widthAnchor.constraint(equalToConstant: 40),
            
            productInfoStackView.heightAnchor.constraint(equalToConstant: 40),
            starsView.widthAnchor.constraint(equalToConstant: 30),
            starsView.heightAnchor.constraint(equalToConstant: 30),
            colorsCollectionView.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(constraintsToAdd)
    }
    
}

extension ProductDetailCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let colorsView = UIView()
        colorsView.translatesAutoresizingMaskIntoConstraints = false
        colorsView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        colorsView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        colorsView.layer.cornerRadius = 25
        colorsView.backgroundColor = UIColor.lightGray
        
        cell.contentView.addSubview(colorsView)
        
        NSLayoutConstraint.activate([
            colorsView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            colorsView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
        ])
        
        return cell
    }
}

extension UIImage {
    func resizeImage(to newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
}
