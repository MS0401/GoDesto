//
//  CancelationList.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class CancelationListViewModel {
    var cancelationList:[CancelationViewModel]
    
    init() {
        self.cancelationList = [CancelationViewModel]()
    }
    
    init(list:CancelationList) {
        self.cancelationList = [CancelationViewModel]()
        if let list = list.cancelationList{
            for item in list{
                self.cancelationList.append(CancelationViewModel(cancelation: item as! Cancelation))
            }
        }
    }
}
