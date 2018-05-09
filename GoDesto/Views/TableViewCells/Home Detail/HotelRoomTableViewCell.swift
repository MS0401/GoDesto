//
//  HotelRoomTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol HotelRoomDelegate:NSObjectProtocol {
    func actionCllBackViewDetail()
}
class HotelRoomTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var viewbackground:UIView!
    @IBOutlet weak var imgRoom:UIImageView!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblStatus:UILabel!
    @IBOutlet weak var lblDetail:UILabel!
    @IBOutlet weak var btnBook:UIButton!
    
    @IBOutlet weak var imgHalfBoard:UIImageView!
    @IBOutlet weak var imgTWin:UIImageView!
    @IBOutlet weak var imgPersons:UIImageView!
    
    @IBOutlet weak var lblHalfBoard:UILabel!
    @IBOutlet weak var lblTwin:UILabel!
    @IBOutlet weak var lblPersons:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.btnBook.layer.cornerRadius = 5
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
