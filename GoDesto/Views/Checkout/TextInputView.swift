//
//  TextInputView.swift
//  GoDesto
//
//  Created by Le Abid on 21/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class TextInputView: UIView {

    private var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical;
        view.distribution = .equalSpacing;
        view.alignment = UIStackViewAlignment.fill;
        view.spacing = 5;
        return view
    }()
    private var lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Title"
        label.font = UIFont(name: FontName.MyriadProBold, size: 14.0)
        return label
    }()
    
    private var inputContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var textField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont(name: FontName.MyriadProRegular, size: 14.0)
        field.borderStyle = .none
        field.placeholder = "Enter here"
        return field
    }()
    
    private func setupView() {
        
        self.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        lblTitle.setContentCompressionResistancePriority(.required, for: .vertical)
        
        inputContainerView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        inputContainerView.layer.borderColor = UIColor.lightGray.cgColor
        inputContainerView.layer.borderWidth = 1.0
        inputContainerView.layer.cornerRadius = 1.0
        
        inputContainerView.addSubview(textField)
        textField.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 8).isActive = true
        textField.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: -8).isActive = true
        textField.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor, constant: -10).isActive = true
        
        stackView.addArrangedSubview(lblTitle)
        stackView.addArrangedSubview(inputContainerView)
        
    }
    
    //MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    //MARK:-
    func setup(title: String, value: String) {
        lblTitle.text = title
        textField.text = value
    }
}
