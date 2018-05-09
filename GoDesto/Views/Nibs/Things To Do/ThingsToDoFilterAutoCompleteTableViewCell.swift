//
//  ThingsToDoFilterAutoCompleteTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol ThingsToDoFilterAutoCompleteDelegate:NSObjectProtocol {
    func actionSearchLocation()
}
class ThingsToDoFilterAutoCompleteTableViewCell: BaseTableViewCell,UITextFieldDelegate {

    @IBOutlet weak var txtSearch:UITextField?
    @IBOutlet weak var lblTitle:UILabel?
    
    var delegate:ThingsToDoFilterAutoCompleteDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.txtSearch?.delegate = self
        self.txtSearch?.layer.borderColor = UIColor.gray.cgColor
        self.txtSearch?.layer.borderWidth = 1
        
         let image = UIImageView()
        image.image=#imageLiteral(resourceName: "IconLocation")
        self.txtSearch?.contentMode = .scaleAspectFit
        self.txtSearch?.leftViewMode = UITextFieldViewMode.always
        self.txtSearch?.addSubview(image)
       
        image.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
       
        let paddingViewWhereToGo = UIView(frame: CGRect(x: 0, y: 0, width: 40,height: 30))
        self.txtSearch?.leftView = paddingViewWhereToGo
    }

    func configure(location:String)  {
        self.txtSearch?.text = location
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if let del = self.delegate{
            del.actionSearchLocation()
        }
        
        return false
    }

}
