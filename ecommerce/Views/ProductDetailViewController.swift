//
//  ProductDetailViewController.swift
//  ecommerce
//
//  Created by Janvi Arora on 15/09/23.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    private lazy var detailTableview: UITableView = {
        let tbl = UITableView()
        tbl.dataSource = self
        tbl.delegate = self
        tbl.showsVerticalScrollIndicator = false
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.register(ProductDetailCell.self, forCellReuseIdentifier: ProductDetailCell.identifier)
        return tbl
    }()
    
    private lazy var addToCartButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("ADD TO CART", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        addViews()
        addConstraints()
    }

    @objc private func backButtonTapped() {
        print("Back button tapped")
    }
    
    private func addViews() {
        view.addSubview(detailTableview)
        view.addSubview(addToCartButton)
    }
    
    private func addConstraints() {
        let constraintsToAdd: [NSLayoutConstraint] = [
            detailTableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -75),
            detailTableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65),
            detailTableview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            detailTableview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            addToCartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -2),
            addToCartButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            addToCartButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            addToCartButton.heightAnchor.constraint(equalToConstant: 45),
        ]
        
        NSLayoutConstraint.activate(constraintsToAdd)
    }
    
}

extension ProductDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailCell.identifier, for: indexPath)
        return cell
    }
    
}
