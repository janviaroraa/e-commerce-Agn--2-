//
//  ProductListCell.swift
//  ecommerce
//
//  Created by Janvi Arora on 14/09/23.
//

import UIKit

class ProductListCell: UITableViewCell {
    
    static let identifier = "productListCellIdentifier"
    
    private lazy var productStack: UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.layer.borderColor = UIColor.lightGray.cgColor
        stk.layer.borderWidth = 1
        stk.layer.cornerRadius = 20
        stk.spacing = 10
        stk.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 20, right: 20)
        stk.isLayoutMarginsRelativeArrangement = true
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private lazy var productImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "Image1"))
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
        lbl.text = "Maybelline Face Studio Master Hi-Light Light Booster Bronzer"
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.numberOfLines = 3
        lbl.font = UIFont.boldSystemFont(ofSize: 21)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var productDescription: UILabel = {
        let lbl = UILabel()
        lbl.text = "Maybelline"
        lbl.textAlignment = .center
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var productPrice: UILabel = {
        let lbl = UILabel()
        lbl.text = "USD 14.99"
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
    
    private lazy var colorCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        colorStack.addArrangedSubview(colorCircleView)
        colorStack.addArrangedSubview(numberOfColorsEllipse)
    }
    
    private func addConstraints() {
        let constraintsToActivate: [NSLayoutConstraint] = [
            productStack.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            productStack.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            productStack.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            productStack.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            productImage.widthAnchor.constraint(equalToConstant: 160),
            productTitle.heightAnchor.constraint(equalToConstant: 100),
            productDescription.heightAnchor.constraint(equalToConstant: 12),
//            productPrice.heightAnchor.constraint(equalToConstant: 40),
            
            colorCircleView.widthAnchor.constraint(equalToConstant: 22),
            colorCircleView.heightAnchor.constraint(equalToConstant: 20),
            numberOfColorsEllipse.widthAnchor.constraint(equalToConstant: 40),
            numberOfColorsEllipse.heightAnchor.constraint(equalToConstant: 50)
            
        ]
        NSLayoutConstraint.activate(constraintsToActivate)
    }
}
