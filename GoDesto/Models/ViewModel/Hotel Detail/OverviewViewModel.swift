//
//  OverviewViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class OverviewViewModel {
    var detail:String
    
    init() {
        self.detail = "your view as seen fit. ... Note that in iOS 11, cells and header/footer views use estimated heights by default. ... This can be accomplished by setting (or returning) the estimatedSectionHeaderHeight on your table view."
    }
    init(detail:String) {
        self.detail = detail
    }
}
