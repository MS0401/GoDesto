//
//  OptionSelectionView.swift
//  GoDesto
//
//  Created by Le Abid on 21/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class OptionSelectionView: UIView {
    
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
    
    private var lblValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Value"
        label.font = UIFont(name: FontName.MyriadProRegular, size: 14.0)
        return label
    }()
    
    private var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = #imageLiteral(resourceName: "IconDownArrow")
        return view
    }()
    
    private var btnSelectValue: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc private func onValueSelection(_ sender: UIButton) {
        print("Print CHanged VaLuE")
    }
    
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
        
        inputContainerView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor, constant: -10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 12.0).isActive = true
        
        inputContainerView.addSubview(lblValue)
        lblValue.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 8).isActive = true
        lblValue.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: -8).isActive = true
        lblValue.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor, constant: 10).isActive = true
        lblValue.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor, constant: -32).isActive = true

        inputContainerView.addSubview(btnSelectValue)
        btnSelectValue.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 0).isActive = true
        btnSelectValue.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 0).isActive = true
        btnSelectValue.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor, constant: 0).isActive = true
        btnSelectValue.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor, constant: 0).isActive = true
        
        stackView.addArrangedSubview(lblTitle)
        stackView.addArrangedSubview(inputContainerView)
        
        btnSelectValue.addTarget(self, action: #selector(onValueSelection(_:)), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("CODE101:- \(imageView) ")
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
        lblValue.text = value
    }
}
