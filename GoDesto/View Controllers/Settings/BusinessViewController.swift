//
//  BusinessViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 4/26/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class BusinessViewController: BaseViewController, TopBarDelegate {

    let businessScreenVM : BusinessScreenViewModel = BusinessScreenViewModel()

    override func viewDidLoad() {

        super.viewDidLoad()
        businessScreenVM.viewController = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 44
            container.lblTitle.text = "Business"
            container.lblSubTitle.text = ""
            container.lblTitle.textColor = UIColor.white
            container.lblSubTitle.textColor = UIColor.white
            container.btnMap.isHidden = true
            container.delegate = self
            container.btnMap.isHidden = true
            container.btnMenu.isHidden = false
        }
    }
    func actionCallBackMoveBack() {
        if let container = self.mainContainer{
            container.bottomViewHeight.constant = 60
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func businessGODestoButtonPressed(_ sender: Any) {
        businessScreenVM.handleBusinessGODestoButtonPressed()
    }
    
    @IBAction func isItFreeButtonPressed(_ sender: Any) {
        businessScreenVM.handleIsItFreeButtonPressed()
    }
    
    @IBAction func BeInControlButtonPressed(_ sender: Any) {
        businessScreenVM.handleBeInControlButtonPressed()
    }
    
    @IBAction func howDoesItWorkPressed(_ sender: Any) {
        businessScreenVM.handleHowDoesItWorkPressed()
    }
    
    @IBAction func joiningIsQuickPressed(_ sender: Any) {
        businessScreenVM.handleJoiningIsQuickPressed()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
