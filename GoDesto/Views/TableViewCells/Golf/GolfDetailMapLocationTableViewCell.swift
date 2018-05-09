//
//  GolfDetailMapLocationTableViewCell.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/30/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import GoogleMaps

class GolfDetailMapLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAddress:UILabel?
    @IBOutlet weak var viewMap:GMSMapView?
    @IBOutlet weak var lblLine:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureView(address:String)  {
        self.lblAddress?.text = address
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
