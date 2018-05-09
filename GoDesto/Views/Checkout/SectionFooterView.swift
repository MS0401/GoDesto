//
//  SectionFooterView.swift
//  GoDesto
//
//  Created by Le Abid on 21/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class SectionFooterView: UIView {

    private lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lineColor: UIColor = UIColor(white: 0.85, alpha: 1.0) {
        didSet {
            lineView.backgroundColor = lineColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if lineView.superview == nil {
            lineView.backgroundColor = lineColor
            self.addSubview(lineView)
            
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
            
            layoutIfNeeded()
        }
    }
    
}
