//
//  HotelSearchDetailHotelTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HotelSearchDetailHotelTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var imgHotel:UIImageView?
    @IBOutlet weak var lblName:UILabel?
    @IBOutlet weak var lblPerson:UILabel?
    @IBOutlet weak var lblBreakfast:UILabel?
    @IBOutlet weak var lblDetail:UILabel?
    @IBOutlet weak var lblPrice:UILabel?
    @IBOutlet weak var lblCurrency:UILabel?
    @IBOutlet weak var btnPrice:UIButton?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.btnPrice?.layer.cornerRadius = 15
    }
    
    func configureView(room:HotelRoomViewModel,image:String)  {
        self.setImageWithUrl(imageView: self.imgHotel!, url:image )
        
        self.lblName?.text = room.roomText
        self.lblBreakfast?.text = room.roomDescription
        self.lblDetail?.text = HotelDetailInfo.detail
        let splash = Global.shared.splashInfo
        self.lblCurrency?.text = splash!.exchangeInfo.toCurrency
        self.lblPrice?.text = room.currentCurrencyPrice
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
