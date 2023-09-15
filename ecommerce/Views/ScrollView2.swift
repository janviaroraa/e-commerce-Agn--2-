//
//  ScrollView2.swift
//  ecommerce
//
//  Created by Janvi Arora on 15/09/23.
//

import UIKit

class ScrollView2: UIViewController {
    
    private lazy var label: UILabel = {
        let lbl = UILabel(frame: view.bounds)
        lbl.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever ype and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was poLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining as been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, bd dummy text evummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesas survived not only five centuries, but asince the 1500s, when an unknown printesurvived not only five centuries, but asince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining  text of the printing"
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var scrollView: UIScrollView = {
        let sc = UIScrollView(frame: .zero)
        sc.backgroundColor = .systemBlue
        sc.contentInset = .zero
        sc.alwaysBounceVertical = false
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    private lazy var container: UIView = {
        let vw = UIView(frame: .zero)
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        container.addSubview(label)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            container.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -20),
            container.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            container.topAnchor.constraint(equalTo: label.topAnchor, constant: -20),
            container.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let constraint = NSLayoutConstraint(item: container, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 1, constant: 0)
        
        constraint.priority = .defaultLow
        constraint.isActive = true
    }
}
