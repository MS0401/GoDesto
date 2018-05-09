//
//  CurrencyListViewModel.swift
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class CurrencyListViewModel: NSObject {
    private var currencyList : [CurrencyModel] = []
    weak var viewController : CurrencyViewController?
    
    override init()
    {
        super.init()
        self.initViewModel()
    }
    
    convenience init(vc : CurrencyViewController)
    {
        self.init()
        self.viewController = vc
        
    }
    func initViewModel()
    {
        
        currencyList = []
        var name = "AED";
        var countryList : String = "United Arab Emirates, Dirhams‏"
        
        var currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "ANG"
        countryList = "Netherlands Antilles,Guilders"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "ARS"
        countryList = "Argentine Peso‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "AUD"
        countryList = "Australian Dollars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "BGN"
        countryList = "Bulgarian Lev‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "BHD"
        countryList = "Bahrain, Dinars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "BOB"
        countryList = "Bolivia, Bolivianos"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)

        name = "BRL"
        countryList = "Brazilian Real"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "BTN"
        countryList = "Bhutan, Ngultrum"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "BZD"
        countryList = "Belize, Dollars"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "CAD"
        countryList = "Canadian Dollars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "CHF"
        countryList = "Swiss Francs‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)

        name = "CLP"
        countryList = "Chile, Pesos‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "CNY"
        countryList = "China, Yuan Renminbi"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)

        name = "COP"
        countryList = "Colombia, Pesos‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "CRC"
        countryList = "Costa Rica, Colones‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)

        name = "CZK"
        countryList = "Czech Republic, Koruny‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "DKK"
        countryList = "Danish Kroner‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "EGP"
        countryList = "Egypt, Pounds‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "EUR"
        countryList = "Euro"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)

        name = "GBP"
        countryList = "British Pounds‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)

        name = "GNF"
        countryList = "Guinea, Francs‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "GTQ"
        countryList = "Guatemala, Quetzales‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "GYD"
        countryList = "Guyana, Dollars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "HKD"
        countryList = "Hong Kong Dollars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "HNL"
        countryList = "Honduras, Lempiras‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "HRK"
        countryList = "Croatia, Kuna‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "HUF"
        countryList = "Hungary, Forint‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "IDR"
        countryList = "Indonesia, Rupiahs"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "ILS"
        countryList = "Israeli New Shekels‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "INR"
        countryList = "India, Rupees‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "ISK"
        countryList = "Iceland, Kronur‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "JOD"
        countryList = "Jordan, Dinars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "JPY"
        countryList = "Japanese Yen‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "KHR"
        countryList = "Cambodia, Riels‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        
        name = "KRW"
        countryList = "Korea (South), Won‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "KWD"
        countryList = "Kuwait, Dinars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)

        name = "KZT"
        countryList = "Kazakhstan, Tenge‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "LAK"
        countryList = "Laos, Kips‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "LBP"
        countryList = "Lebanon, Pounds‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "LKR"
        countryList = "Sri Lanka, Rupees‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "LTL"
        countryList = "Lithuania, Litai‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "MAD"
        countryList = "Morocco, Dirhams‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "MOP"
        countryList = "Macau, Patacas‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "MXN"
        countryList = "Mexico, Pesos‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "MYR"
        countryList = "Malaysia, Ringgits‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "NIO"
        countryList = "Nicaragua, Cordobas‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "NOK"
        countryList = "Norwegian Kroner‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "NZD"
        countryList = "New Zealand Dollars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "OMR"
        countryList = "Oman, Rials‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "PAB"
        countryList = "Panama, Balboa‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "PEN"
        countryList = "Peru, Nuevos Soles‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        
        name = "PHP"
        countryList = "Philippines, Pesos‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "PKR"
        countryList = "Pakistan, Rupees‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "PLN"
        countryList = "Poland, Zlotych‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "PYG"
        countryList = "Paraguay, Guarani‏‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "QAR"
        countryList = "Qatar, Rials‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "RON"
        countryList = "Romanian New Lei‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "RUB"
        countryList = "Russia, Rubles‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "SAR"
        countryList = "Saudi Arabia, Riyals‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "SEK"
        countryList = "Swedish Krona‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "SGD"
        countryList = "Singapore Dollars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "SRD"
        countryList = "Surinamese Dollar‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "THB"
        countryList = "Thailand, Baht‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "TND"
        countryList = "Tunisia, Dinars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "TRY"
        countryList = "Turkish New Lira‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "TWD"
        countryList = "Taiwan Dollars‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "UAH"
        countryList = "Ukraine, Hryvnia‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "USD"
        countryList = "US Dollar‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "UYU"
        countryList = "Uruguayan Peso‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "VEF"
        countryList = "Venezuelan Bolívar Fuerte‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "VND"
        countryList = "Viet Nam, Dong‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)
        
        name = "ZAR"
        countryList = "South African Rand‏"
        currencyModel = CurrencyModel(name: name,countries: countryList)
        currencyList.append(currencyModel)

    }
    
    func getCurrencyVM(at: Int)-> CurrencyModel
    {
        return currencyList[at]
    }
    func numberOfCells()-> Int
    {
        return currencyList.count
    }
    
    func currencySelected(at IndexPath: IndexPath, onSucess:@escaping (()->Void), onFailure:@escaping ((_ message : String)->Void))
    {
        
        let query:String? = currencyList[IndexPath.row].name
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.query = query!
        
        if let request = requestMessage{
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.viewController?.mainContainer{
                        container.startActivity()
                    }
                })
                let service = CurrencyService()
                service.changeCurrency(requestMessage: request, complete: {[unowned self] (responseMessage) in
                    
                    GCD.async(.Main){
                        // do ui work
                        if let container = self.viewController?.mainContainer{
                            container.stopActivity()
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            // do UI Work
                            if let responsedata = responseMessage.data as? ChangeCurrencyResponse
                            {
                                Global.shared.currentCurrency = responsedata.data.toCurrency
                                onSucess()
                            }


                        }
                    case .Failure:
                        GCD.async(.Main){
                            onFailure(responseMessage.message)
                        }
                    default:
                        GCD.async(.Main){
                            onFailure(FAILED_MESSAGE)

                            
                        }
                    }
                })
            }
            
        }
        
    }
}
