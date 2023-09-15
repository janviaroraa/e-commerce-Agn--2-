//
//  ScrollView.swift
//  ecommerce
//
//  Created by Janvi Arora on 15/09/23.
//

import UIKit

import UIKit

class ScrollView: UIViewController {
    
    private lazy var text: UILabel = {
        let lbl = UILabel(frame: view.bounds)
        lbl.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever ype and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was poLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining as been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was poLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum eap into electronic typesetting, remaining essentially unchanged. It was poLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever ype and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was poLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining  text of the printing"
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    private lazy var scView: UIScrollView = {
        let sc = UIScrollView(frame: view.bounds)
        sc.backgroundColor = .systemBlue
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scView)
        scView.addSubview(text)
        
        let contentHeight = text.bounds.height
        let screenHeight = view.bounds.height
        
        if contentHeight > screenHeight {
            scView.isScrollEnabled = true
            scView.contentSize = CGSize(width: view.bounds.width, height: contentHeight)
        } else {
            scView.isScrollEnabled = false
        }
    }
}
