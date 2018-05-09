//
//  CityFilterViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 4/2/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class CityFilterViewController: BaseViewController{

    @IBOutlet weak var txtFiedlSerach: UITextField!
    @IBOutlet weak var tblSearch: UITableView!
    
  
    var countryList:CountryListViewModel?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.txtFiedlSerach.layer.sublayerTransform = CATransform3DMakeTranslation(10 , 0, 0)
        self.txtFiedlSerach.layer.cornerRadius = 5
        self.txtFiedlSerach?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if(textField.text!.isEmpty){
            self.countryList?.countryList = [CountryViewModel]()
            self.tblSearch.reloadData()
        }else{
            self.getSearchedCities(query: textField.text)
        }
    }
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 44
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    

}

extension CityFilterViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let _ = self.countryList{
            return 1
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryList!.countryList.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.current.userInterfaceIdiom == .pad {

            return 70
        }else {
            return 45
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryFilterTableViewCell", for: indexPath) as! CountryFilterTableViewCell
        cell.configureSearch(country: self.countryList!.countryList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = self.countryList!.countryList[indexPath.row]
        NotificationCenter.default.post(name: Notification.Name("NotificationSelectCity"), object: nil, userInfo: ["name":city.searchString,
                        "code":city.cityCode,
                        "countryCode":city.countryCode,
                        "cityName":city.cityName])
        self.didTapBack(self)
    }
}

//MARK:- City Search API
extension CityFilterViewController{
    func getSearchedCities(query:String? = "")  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.query = query!
       
        if let request = requestMessage{
            GCD.async(.Default){
                let service = SearchService()
                service.searchCountry(requestMessage: request, complete: { (responseMessage) in
                    
                    GCD.async(.Main){
                        self.stopActivity()
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let list = responseMessage.data as? CountryListViewModel {
                                self.countryList = list
                                if(self.txtFiedlSerach.text!.isEmpty){
                                    self.countryList?.countryList = [CountryViewModel]()
                                }
                                self.tblSearch.reloadData()
                           }else {
                                self.showAlertVIew(message: responseMessage.message, title: "")
                            }
                        }
                    case .Failure:
                        GCD.async(.Main){
                            self.showAlertVIew(message: responseMessage.message, title: "")
                        }
                    default:
                        GCD.async(.Main){
                            self.showAlertVIew(message: FAILED_MESSAGE, title: "")
                            
                        }
                    }
                })
            }
            
        }
        
    }
}
extension CityFilterViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

