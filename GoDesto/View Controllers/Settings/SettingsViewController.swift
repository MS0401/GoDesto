//
//  SettingsViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 4/26/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController,TopBarDelegate {

    let settingsStaticArray=["Language","Currency","Help","For Business"]
    
    @IBOutlet weak var tblSettings:UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.tblSettings.estimatedRowHeight = 40
        self.tblSettings.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.view.endEditing(true)
        if let container = self.mainContainer{
            
            container.navigationbarHeight.constant = 44
            container.lblTitle.text = "Settings"
            container.lblSubTitle.text = ""
            container.lblTitle.textColor = UIColor.white
            container.lblSubTitle.textColor = UIColor.white
            container.btnMap.isHidden = true
            container.delegate = self
            container.btnMap.isHidden = true
            container.btnMenu.isHidden = true
        }
        
        Global.shared.filter = FilterViewModel()

    }
    
    override func didReceiveMemoryWarning() {
    
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func actionBack(_ sender:UIButton){
        
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 44
        }
        
        if let container = self.mainContainer{
            
            container.bottomViewHeight.constant = 60
        }
        self.navigationController?.popViewController(animated: true)
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

extension SettingsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return settingsStaticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "SettingsCustomCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "SettingsCustomCell")
        }
        if settingsStaticArray[indexPath.row] == "Currency" && Global.shared.currentCurrency != ""
        {
            cell?.textLabel?.text = settingsStaticArray[indexPath.row] + " (\(Global.shared.currentCurrency))"

        }else
        {
            cell?.textLabel?.text = settingsStaticArray[indexPath.row]
        }
        return cell!
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.row {
            
        case 0:
            let storyboard = UIStoryboard.init(name: StoryboardName.Acccounts, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "EditProfile_VC_SB") as? EditProfileViewController{
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case 1:
            if let slideMenuController = self.slideMenuController() {
                // some code
                slideMenuController.mainViewController?.openRight()
            }
        case 2:
            let storyboard = UIStoryboard.init(name: StoryboardName.Settings, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "HelpViewController") as? HelpViewController{
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case 3:
            let storyboard = UIStoryboard.init(name: StoryboardName.Settings, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "BusinessViewController") as? BusinessViewController{
                self.navigationController?.pushViewController(vc, animated: true)
            }
        default:
            print("nothign")
        }
    }
}

