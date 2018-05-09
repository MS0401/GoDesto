//
//  SectionHeaderView.swift
//  GoDesto
//
//  Created by Le Abid on 19/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {

    private lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontName.MyriadProBold, size: 14.0)
        label.text = ""
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func set(textColor: UIColor, background: UIColor) {
        lblTitle.textColor = textColor
        backgroundColor = background
    }
    
    func set(text: String) {
        lblTitle.text = text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if lblTitle.superview == nil {
            self.addSubview(lblTitle)
            
            lblTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
            lblTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
            lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
            lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
            
            layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
