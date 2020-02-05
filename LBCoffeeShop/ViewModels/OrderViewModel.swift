//
//  OrderViewModel.swift
//  LBCoffeeShop
//
//  Created by wira on 2/5/20.
//  Copyright © 2020 Wira Setiawan. All rights reserved.
//

import Foundation

class OrderListViewModel {

    var orderViewModels: [OrderViewModel]

    init() {
        self.orderViewModels = [OrderViewModel]()
    }

}

extension OrderListViewModel {

    func orderViewModel(at index:Int) -> OrderViewModel {
        return self.orderViewModels[index]
    }

}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {

    var name: String {
        return self.order.name
    }

    var email: String {
        return self.order.email
    }

    var type: String {
        return self.order.type.rawValue.capitalized
    }

    var size: String {
        return self.order.size.rawValue.capitalized
    }

}
