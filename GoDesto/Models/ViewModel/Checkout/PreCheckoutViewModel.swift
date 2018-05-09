//
//  PreCheckoutViewModel.swift
//  GoDesto
//
//  Created by Le Abid on 19/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class PreCheckoutViewModel {

    var stay = ""
    var contractType = ""
    var roomType = ""
    var price = ""
    var currency = ""
    var taxIncludedText = ""
    var cancelationText = ""
    var cancelationInfoText = "No Additional info from hotel."
    var terms = ""
    
    var stayDetails: [TableViewCellValues] = []
    var bookingDetails: [TableViewCellValues] = []
    
    var searchDetails: HotelSearchDetail? {
        didSet {
            stayDetails.removeAll()
            bookingDetails.removeAll()
            if let details = searchDetails {
                
                let checkinDetail = TableViewCellValues(title: "Check-In", subtitle: Utilities.getStringWithFormateFromDate(date: details.checkInDate))
                
                let checkOutDetail = TableViewCellValues(title: "Check-Out", subtitle: Utilities.getStringWithFormateFromDate(date: details.checkOutDate))
                
                stayDetails.append(contentsOf: [checkinDetail, checkOutDetail])
                
                
                let stay = TableViewCellValues(title: "Stay", subtitle: self.stay)
                let guestDetail = TableViewCellValues(title: "Number of Guests", subtitle: "\(details.totalGuests)")
                let contractDetail = TableViewCellValues(title: "Contract Type", subtitle: "\(self.contractType)")
                let roomDetail = TableViewCellValues(title: "Room Type", subtitle: "\(self.roomType)")
                
                bookingDetails.append(contentsOf: [stay, guestDetail, contractDetail, roomDetail])
                
            }
        }
    }
    
    var areTermsAgreed = false
    
    var currentUserInformation = CurrentUserInformation()
    
    init() {
        terms = ""
    }
    
    convenience init(preBookInfo: PreBookInfo) {
        self.init()
        stay = preBookInfo.stay
        contractType = preBookInfo.contractType
        roomType = preBookInfo.roomType
        
        let originalCurrencyPrice = preBookInfo.price!
        if let splash = Global.shared.splashInfo{

            let rate = splash.exchangeInfo.rate
            
            if(!rate.isEmpty && !originalCurrencyPrice.isEmpty){
                let conversion = Int(Double(rate)! * Double(originalCurrencyPrice)!)
                self.price = "\(conversion)"
            }
            currency = splash.exchangeInfo.toCurrency
        }
        taxIncludedText = preBookInfo.taxIncludedText
        cancelationText = preBookInfo.cancelationText
        
        if !preBookInfo.cancelationInfoText.isEmpty {
            cancelationText = preBookInfo.cancelationText
        }
        cancelationInfoText = preBookInfo.cancelationInfoText
        
        terms = preBookInfo.terms
        
    }
}

struct TableViewCellValues {
    var title: String
    var subtitle: String
}

struct CurrentUserInformation {
    
    var title = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    var telephone = ""
    var country = ""
    var region = ""
    var city = ""
    var street = ""
    var zipCode = ""
    var isOwnBooking = false
}

extension CurrentUserInformation {
    
    var titleInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Title", subtitle: title)
        }
    }
    
    var firstNameInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "First Name", subtitle: firstName)
        }
    }
    
    var lastNameInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Last Name", subtitle: lastName)
        }
    }
    var emailInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Email Address", subtitle: email)
        }
    }
    var telephoneInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Telephone", subtitle: telephone)
        }
    }
    var countryInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Country", subtitle: country)
        }
    }
    var regionInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Region", subtitle: region)
        }
    }
    
    var cityInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "City", subtitle: city)
        }
    }
    
    var streetInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Street Address", subtitle: street)
        }
    }
    
    var zipCodeInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Zip Code", subtitle: zipCode)
        }
    }
    
}

extension RoomDetail {
    
    var guestDetails: [Any] {
        get {
            var guests: [Any] = []
            guests.append(adults)
            guests.append(children)
            return guests
        }
    }
}

extension AdultInformation {
    
    var titleInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Title", subtitle: title)
        }
    }
    
    var firstNameInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "First Name", subtitle: firstName)
        }
    }
    
    var lastNameInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Last Name", subtitle: lastName)
        }
    }
}

extension ChildInformation {
    
    var firstNameInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "First Name", subtitle: firstName)
        }
    }
    
    var lastNameInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Last Name", subtitle: lastName)
        }
    }
    
    var ageInfo: TableViewCellValues {
        get {
            return TableViewCellValues(title: "Age", subtitle: "\(age) years")
        }
    }
}
