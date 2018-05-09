//
//  CurrencyViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 4/26/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class CurrencyViewController: BaseViewController,TopBarDelegate {

    @IBOutlet weak var tblCurrency:UITableView!
    
    let currencyListVM : CurrencyListViewModel = CurrencyListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currencyListVM.viewController = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension CurrencyViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return currencyListVM.numberOfCells()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "CurrencyCustomCell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "CurrencyCustomCell")
            }
            
            let currencySignLBL: UILabel = cell?.viewWithTag(101) as! UILabel;
            let currencyNameLBL: UILabel = cell?.viewWithTag(102) as! UILabel;
            
            currencySignLBL.text = currencyListVM.getCurrencyVM(at: indexPath.row).name
            currencyNameLBL.text = currencyListVM.getCurrencyVM(at: indexPath.row).countries
            
            return cell!
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        if let slideMenuController = self.slideMenuController() {
            // some code
            currencyListVM.currencySelected(at: indexPath, onSucess: {() in
                slideMenuController.mainViewController?.closeRight()
                if let baseVC = slideMenuController.mainViewController as? BaseNavigationController
                {
                    if let settingVC = baseVC.viewControllers[0] as? SettingsViewController
                    {
                        settingVC.tblSettings.reloadData()

                    }
                }

                //self.showAlertVIew(message: "sucess", title: "")


            },onFailure: {[unowned self](errorMessage) in
                
                slideMenuController.mainViewController?.closeRight()
                self.showAlertVIew(message: errorMessage, title: "")

            })
        }
        
    }
}
