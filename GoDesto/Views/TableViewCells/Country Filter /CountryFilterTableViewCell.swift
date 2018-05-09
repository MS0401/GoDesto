//
//  CountryFilterTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class CountryFilterTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var lblName:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(country:CountryViewModel){
        self.lblName?.text = country.suggestCountryName
    }
    func configureSearch(country:CountryViewModel)  {
        self.lblName?.text = country.searchString
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
