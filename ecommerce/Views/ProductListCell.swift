//
//  ProductListCell.swift
//  ecommerce
//
//  Created by Janvi Arora on 14/09/23.
//

import UIKit

class ProductListCell: UITableViewCell {
    
    static let identifier = "productListCellIdentifier"
    private var numberOfColorsInCV: Int = 0
    private var colorsHexValue: [String] = []
    
    private lazy var productStack: UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.layer.borderColor = UIColor.lightGray.cgColor
        stk.layer.borderWidth = 1
        stk.layer.cornerRadius = 20
        stk.spacing = 10
        stk.layoutMargins = UIEdgeInsets(top: 5, left: 0, bottom: 20, right: 20)
        stk.isLayoutMarginsRelativeArrangement = true
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private lazy var productImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: ""))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var descriptionStack: UIStackView = {
        let stk = UIStackView()
        stk.axis = .vertical
        stk.alignment = .leading
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private lazy var productTitle: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.numberOfLines = 3
        lbl.font = UIFont.boldSystemFont(ofSize: 21)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var productDescription: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var productPrice: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .red
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var colorStack: UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.spacing = 20
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
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
    
    private lazy var numberOfColorsEllipse: UIButton = {
        let btn = UIButton()
        btn.setTitle("+2", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 12
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
        contentView.addSubview(productStack)
        productStack.addArrangedSubview(productImage)
        productStack.addArrangedSubview(descriptionStack)
        descriptionStack.addArrangedSubview(productTitle)
        descriptionStack.addArrangedSubview(productDescription)
        descriptionStack.addArrangedSubview(productPrice)
        descriptionStack.addArrangedSubview(colorStack)
        colorStack.addArrangedSubview(colorsCollectionView)
//        colorStack.addArrangedSubview(numberOfColorsEllipse)
    }
    
    private func addConstraints() {
        let constraintsToActivate: [NSLayoutConstraint] = [
            productStack.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            productStack.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            productStack.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            productStack.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            productImage.widthAnchor.constraint(equalToConstant: 160),
            productTitle.heightAnchor.constraint(equalToConstant: 100),
            productDescription.heightAnchor.constraint(equalToConstant: 15),
            
            colorsCollectionView.widthAnchor.constraint(equalToConstant: 20),
            colorsCollectionView.heightAnchor.constraint(equalToConstant: 20),
            numberOfColorsEllipse.widthAnchor.constraint(equalToConstant: 40),
            
        ]
        NSLayoutConstraint.activate(constraintsToActivate)
    }
    
    func configureShadow() {
        self.backgroundColor = .clear
        self.contentView.layer.backgroundColor = UIColor.white.cgColor
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func loadCellData(model: ProductListModel) {
        productTitle.text = model.name ?? "PLC default"
        productDescription.text = model.description ?? "PLC default"
        productPrice.text = "USD \(model.price ?? "PDC default")"
        
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
        
        if let colors = model.productColors {
            colorsHexValue = colors.map { $0.hexValue ?? "" }
            numberOfColorsInCV = colorsHexValue.count
        } else {
            colorsHexValue.removeAll()
            numberOfColorsInCV = 0
        }
        
        if numberOfColorsInCV > 2 {
            colorStack.addArrangedSubview(numberOfColorsEllipse)
            numberOfColorsEllipse.setTitle("+\(numberOfColorsInCV - 1)", for: .normal)
        } else {
            colorStack.removeArrangedSubview(numberOfColorsEllipse)
        }
        
        colorsCollectionView.reloadData()
    }
}

extension ProductListCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        (numberOfColorsInCV < 3) ? numberOfColorsInCV : 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let colorsView = UIView()
        colorsView.translatesAutoresizingMaskIntoConstraints = false
        colorsView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        colorsView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        colorsView.layer.cornerRadius = 10
        
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
