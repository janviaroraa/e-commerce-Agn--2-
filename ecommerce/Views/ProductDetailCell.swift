//
//  ProductDetailCell.swift
//  ecommerce
//
//  Created by Janvi Arora on 15/09/23.
//

import Foundation
import UIKit

class ProductDetailCell: UITableViewCell {
    
    private var isAddedToWishlist: Bool = false
    private var productTitleURL: String = ""
    private var numberOfColorsInCV: Int = 0
    private var colorsHexValue: [String] = []
    private var numberOfStarRating: Int = 0
    private var productId: Int = 0
    
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
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var addToWishlistButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(addToWishlistButtonClicked), for: .touchUpInside)
        updateWishlistButtonImage(isAddedToWishlist: isAddedToWishlist, button: btn)
        return btn
    }()

    @objc private func addToWishlistButtonClicked() {
        isAddedToWishlist.toggle()
        updateWishlistButtonImage(isAddedToWishlist: isAddedToWishlist, button: addToWishlistButton)
        
        if productId != 0 {
            if isAddedToWishlist {
                UserDefaultsManager.shared.addToWishlist(productId: productId)
            } else {
                UserDefaultsManager.shared.removeFromWishlist(productId: productId)
            }
        }
    }

    private func updateWishlistButtonImage(isAddedToWishlist: Bool, button: UIButton) {
        let imageName = isAddedToWishlist ? "heart.fill" : "heart"
        let imageColor = isAddedToWishlist ? UIColor.systemRed : UIColor.lightGray
        
        if let heartImage = UIImage(systemName: imageName)?.withTintColor(imageColor, renderingMode: .alwaysOriginal) {
            let imageSize = CGSize(width: 50, height: 35)
            let resizedImage = heartImage.resizeImage(to: imageSize)
            button.setImage(resizedImage, for: .normal)
        }
    }
    
    private lazy var productCompanyName: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var productTitle: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(productTitleTapped))
        lbl.isUserInteractionEnabled = true
        lbl.addGestureRecognizer(tapGesture)
        
        return lbl
    }()
    
    @objc private func productTitleTapped() {
        if let url = URL(string: productTitleURL) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    private lazy var productInfoStackView: UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.spacing = 70
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
        lbl.textAlignment = .left
        lbl.textColor = .red
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var productCategory: UILabel = {
        let lbl = UILabel()
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
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var starsCollectionView: UICollectionView = {
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
        priceAndCategoryStack.addArrangedSubview(productPrice)
        priceAndCategoryStack.addArrangedSubview(productCategory)
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
            starsView.heightAnchor.constraint(equalToConstant: 30),
            colorsCollectionView.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(constraintsToAdd)
    }
    
    func loadCellData(model: ProductListModel) {
        if let imageUrlString = model.imageLink, let imageUrl = URL(string: imageUrlString) {
            URLSession.shared.dataTask(with: imageUrl) { (data, _, error) in
                if let error = error {
                    print("Error loading image: \(error.localizedDescription)")
                } else if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.productImage.image = image
                    }
                }
            }.resume()
        } else {
            self.productImage.image = UIImage(named: "DefaultImageName")
        }
        
        productCompanyName.text = model.brand
        productTitle.text = model.name ?? "PDC default"
        productPrice.text = "USD \(model.price ?? "PDC default")"
        productCategory.text = model.productType ?? "PDC default"
        productDescription.text = model.description ?? "PDC default"
        productTitleURL = model.productLink ?? "PDC default"
        numberOfColorsInCV = model.productColors?.count ?? 0
        numberOfStarRating = Int(model.rating ?? 0)
        productId = model.id ?? 0
        
        colorsHexValue.removeAll()
        if let colors = model.productColors {
            colorsHexValue = colors.map { $0.hexValue ?? "" }
        }
        if numberOfColorsInCV > 0 {
            productDetailStack.addArrangedSubview(colorsCollectionView)
            productDetailStack.addArrangedSubview(productDescription)
        }
        if numberOfStarRating > 0{
            starsView.addSubview(numberOfStars)
            let starRatingText = String(repeating: "⭐", count: numberOfStarRating)
            numberOfStars.text = starRatingText
        }
        
        isAddedToWishlist = UserDefaultsManager.shared.isInWishlist(productId: model.id ?? 0)
        updateWishlistButtonImage(isAddedToWishlist: isAddedToWishlist, button: addToWishlistButton)
        
        colorsCollectionView.reloadData()
    }
    
}

extension ProductDetailCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfColorsInCV
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let colorsView = UIView()
        colorsView.translatesAutoresizingMaskIntoConstraints = false
        colorsView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        colorsView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        colorsView.layer.cornerRadius = 25
        
        if indexPath.row < colorsHexValue.count {
            let hexColor = colorsHexValue[indexPath.row]
            colorsView.backgroundColor = UIColor(hexString: hexColor)
        } else {
            colorsView.backgroundColor = .gray
        }
            
        
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

extension UIColor {
    convenience init?(hexString: String) {
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
