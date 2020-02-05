//
//  AddCoffeeOrderViewModel.swift
//  LBCoffeeShop
//
//  Created by wira on 2/5/20.
//  Copyright © 2020 Wira Setiawan. All rights reserved.
//

import Foundation


struct AddCoffeeOrderViewModel {

    var name: String?
    var email: String?

    var selectedType: String?
    var selectedSize: String?

    var types: [String] {
        return CoffeeType.allCases.map{$0.rawValue.capitalized}
    }

    var sizes: [String] {
        return CoffeeSize.allCases.map{$0.rawValue.capitalized}
    }

}
