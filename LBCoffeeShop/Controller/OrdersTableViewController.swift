//
//  OrdersTableViewController.swift
//  LBCoffeeShop
//
//  Created by wira on 2/5/20.
//  Copyright © 2020 Wira Setiawan. All rights reserved.
//

import Foundation
import UIKit

class OrdersTableViewController : UITableViewController {

    var orderListViewModel = OrderListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        populateOrders()
    }


    private func populateOrders() {

        guard let coffeeOrdersURL = URL(string: "https://next.json-generator.com/api/json/get/VkonA4XG_") else {
            fatalError("URL was incorrect")
        }

        let resource = Resource<[Order]>(url:coffeeOrdersURL)
        WebService().load(resource: resource) { [weak self] result in
            switch result {
            case .success(let orders):
                self?.orderListViewModel.orderViewModels = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.orderViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        return cell
    }
}
