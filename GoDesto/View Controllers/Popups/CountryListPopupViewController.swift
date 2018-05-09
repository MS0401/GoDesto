//
//  CountryListPopupViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol CountryListPopupDelegate:NSObjectProtocol {
    func actionCallBackSelectCountry(text:String,code:String)
    func actionCallBackCancelPopup()
}
class CountryListPopupViewController: BaseViewController {
    @IBOutlet weak var txtFiedlSerach: UITextField!
    @IBOutlet weak var tblSearch: UITableView!
    @IBOutlet weak var viewBackground:UIView?
    
    
    var countryList:[CountryViewModel] = [CountryViewModel]()
    var delegate:CountryListPopupDelegate?
    var isSearching:Bool? = false
    var searchCountryList:[CountryViewModel] = [CountryViewModel]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.txtFiedlSerach.layer.sublayerTransform = CATransform3DMakeTranslation(10 , 0, 0)
        self.txtFiedlSerach.layer.cornerRadius = 5
        self.txtFiedlSerach?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        self.viewBackground?.layer.cornerRadius = 15
        self.setPlaceholderBlackColor(textfield: self.txtFiedlSerach)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(txtFiedlSerach.text!.isEmpty){
            self.isSearching = false
            self.tblSearch.reloadData()
        }else{
            self.searchCountryList.removeAll()
            for eachCountry in self.countryList{
                if(eachCountry.suggestCountryName.lowercased().contains(textField.text!.lowercased())){
                    self.searchCountryList.append(eachCountry)
                }
            }
            self.isSearching = true
            self.tblSearch.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func actionClosePopup(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackCancelPopup()
        }
    }
    
    
    
}

extension CountryListPopupViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.isSearching!){
            return self.searchCountryList.count
        }else{
            return self.countryList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryFilterTableViewCell", for: indexPath) as! CountryFilterTableViewCell
        if(self.isSearching!){
            cell.configure(country: self.searchCountryList[indexPath.row])
        }else{
            cell.configure(country: self.countryList[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let del = self.delegate{
            if(self.isSearching!){
                del.actionCallBackSelectCountry(text: self.searchCountryList[indexPath.row].suggestCountryName,code: self.searchCountryList[indexPath.row].suggestCountryCode)
            }else{
                 del.actionCallBackSelectCountry(text: self.countryList[indexPath.row].suggestCountryName,code: self.countryList[indexPath.row].suggestCountryCode)
            }
          
        }
    }
}


extension CountryListPopupViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

