//
//  AddOrderViewController.swift
//  LBCoffeeShop
//
//  Created by wira on 2/5/20.
//  Copyright © 2020 Wira Setiawan. All rights reserved.
//

import Foundation
import UIKit

class AddOrderViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var vm = AddCoffeeOrderViewModel()
    @IBOutlet weak var tableView: UITableView!

    @IBAction func onClickCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    private func save() {
//        self.vm.name = self.nameTextField.text
//        self.vm.email = self.emailTextField.text
        WebService().load(resource: Order.create(vm: self.vm)) { result in
            switch result {
            case .success(let order):
                print(order)
            case .failure(let error):
                print(error)
            }

        }
    }

    //MARK: tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        cell.textLabel?.text = self.vm.types[indexPath.row]
        return cell
    }
}
