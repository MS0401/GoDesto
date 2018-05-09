//
//  ThingsToDoDetailAmentiesTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 12/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol ThingsToDoDetailAmentiesDelegate:NSObjectProtocol {
    func actionCallBackShowDirection()
}

class ThingsToDoDetailAmentiesTableViewCell: BaseTableViewCell {

    @IBOutlet weak var viewDirection:UIView!
    @IBOutlet weak var viewGlass:UIView!
    @IBOutlet weak var viewPerntage:UIView!
    @IBOutlet weak var viewVoucher:UIView!
    @IBOutlet weak var viewMike:UIView!
    @IBOutlet weak var viewFamily:UIView!
    @IBOutlet weak var viewHappyHour:UIView!
    @IBOutlet weak var viewLadiesNight:UIView!
    @IBOutlet weak var viewOutDoor:UIView!
    
    var delegate:ThingsToDoDetailAmentiesDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configueView(thing:ThingToDoViewModel)  {
        if(thing.serveAlcohol == "1"){
            self.viewGlass.isHidden = false
        }else{
            self.viewGlass.isHidden = true
        }
        if(thing.acceptVoucher == "1"){
            self.viewVoucher.isHidden = false
        }else{
            self.viewVoucher.isHidden = true
        }
        if(thing.ladiesNite == "1"){
            self.viewLadiesNight.isHidden = false
        }else{
            self.viewLadiesNight.isHidden = true
        }
        if(thing.childrenWelcome == "1"){
            self.viewFamily.isHidden = false
        }else{
            self.viewFamily.isHidden = true
        }
        if(thing.liveEnter == "1"){
            self.viewMike.isHidden = false
        }else{
            self.viewMike.isHidden = true
        }
        if(thing.outdoorSeating == "1"){
            self.viewOutDoor.isHidden = false
        }else{
            self.viewOutDoor.isHidden = true
        }
        if(thing.happyHour == "1"){
            self.viewHappyHour.isHidden = false
        }else{
            self.viewHappyHour.isHidden = true
        }
    }
    @IBAction func actionShowDirection(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackShowDirection()
        }
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
