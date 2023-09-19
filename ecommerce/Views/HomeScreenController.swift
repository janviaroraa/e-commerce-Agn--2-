//
//  HomeScreenController.swift
//  ecommerce
//
//  Created by Janvi Arora on 14/09/23.
//

import UIKit

class HomeScreenController: UIViewController {
    
    var viewModel = HomeScreenViewModel()
    
    private lazy var appLabel: UIImageView = {
        let img = UIImageView(image: UIImage(named: "CompanyIcon"))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var searchStackView: UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.spacing = 10
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private lazy var searchTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Type to search"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.borderStyle = .roundedRect
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.black.cgColor
        txt.layer.cornerRadius = 20
        txt.delegate = self
        txt.translatesAutoresizingMaskIntoConstraints = false

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: txt.frame.height))
        txt.leftView = paddingView
        txt.leftViewMode = .always

        return txt
    }()

    private lazy var searchButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Search", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 2
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        return btn
    }()
    
    @objc private func searchButtonClicked() {
        DispatchQueue.main.async {
            
        }
    }
    
    private lazy var productListingTableView: UITableView = {
        let tbl = UITableView()
        tbl.showsVerticalScrollIndicator = false
        tbl.dataSource = self
        tbl.delegate = self
        tbl.separatorStyle = .none
        tbl.register(ProductListCell.self, forCellReuseIdentifier: ProductListCell.identifier)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addViews()
        addConstraints()
        loadData()
    }
    
    private func loadData() {
        viewModel.updateTableViewCells {
            self.productListingTableView.reloadData()
        }
    }
    
    private func addViews() {
        view.addSubview(appLabel)
        view.addSubview(searchStackView)
        searchStackView.addArrangedSubview(searchTextField)
        searchStackView.addArrangedSubview(searchButton)
        view.addSubview(productListingTableView)
    }
    
    private func addConstraints() {
        let constraintsToActivate: [NSLayoutConstraint] = [
            appLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            appLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            appLabel.heightAnchor.constraint(equalToConstant: 30),
            appLabel.widthAnchor.constraint(equalToConstant: 110),
            
            searchStackView.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 20),
            searchStackView.leadingAnchor.constraint(equalTo: appLabel.leadingAnchor),
            searchStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            searchButton.widthAnchor.constraint(equalToConstant: 100),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            productListingTableView.topAnchor.constraint(equalTo: searchStackView.bottomAnchor, constant: 10),
            productListingTableView.leadingAnchor.constraint(equalTo: appLabel.leadingAnchor),
            productListingTableView.trailingAnchor.constraint(equalTo: searchStackView.trailingAnchor),
            productListingTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraintsToActivate)
    }
}

extension HomeScreenController: UITextFieldDelegate {
    
}

extension HomeScreenController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.productListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListCell.identifier, for: indexPath) as! ProductListCell
        cell.selectionStyle = .none
        cell.loadCellData(model: viewModel.productListModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
