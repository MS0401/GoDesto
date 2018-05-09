//
//  FilterOptionPopupViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol FilterOptionPopupDelegate:NSObjectProtocol {
    func actionCallBackSelectOptionItem(text:DetailFilter)
}
class FilterOptionPopupViewController: BaseViewController {
    
    @IBOutlet weak var btnOption1:UIButton!
    @IBOutlet weak var btnOption2:UIButton!
    @IBOutlet weak var viewBackground:UIView!
    

    var isFromRefund:Bool? = false
    var delegate:FilterOptionPopupDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewBackground.layer.cornerRadius = 5
        if(self.isFromRefund!){
            self.btnOption1.setTitle(DetailFilter.NonRefundable.rawValue, for: .normal)
        }else{
            self.btnOption1.setTitle(DetailFilter.Breakfast.rawValue, for: .normal)
            self.btnOption2.setTitle(DetailFilter.RoomOnly.rawValue, for: .normal)
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func actionSelectOption(_ sender:UIButton)  {
        if(self.isFromRefund!){
            if let del = self.delegate{
                del.actionCallBackSelectOptionItem(text: DetailFilter.NonRefundable)
            }
        }else{
            if(sender == self.btnOption1){
                if let del = self.delegate{
                    del.actionCallBackSelectOptionItem(text: DetailFilter.Breakfast)
                }
            }else{
                if let del = self.delegate{
                    del.actionCallBackSelectOptionItem(text: DetailFilter.RoomOnly)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
