//
//  ViewController.swift
//  LocalData
//
//  Created by Vidhyapathi Kandhasamy on 5/22/18.
//  Copyright © 2018 aezion. All rights reserved.
//

import UIKit


class ViewController: UITableViewController  {
    var itemArray = ["Find Mark", "Buy Tag", "Trigger","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    let localData = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        if let itemArNew = localData.array(forKey: "getUserStandard") as? [String] {
            itemArray = itemArNew
        }
        
        let arrayeg = [1,2,4]
        localData.set(arrayeg, forKey: "localarray")
        let printVale = localData.array(forKey: "localarray") as! [Int]
    }
    //table view datasource method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "viewItemCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //table view delegate method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row is: ", indexPath.row, "Value is: ", itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addItems(_ sender: Any) {
        var closureTextField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("Success", closureTextField.text!)
            self.itemArray.append(closureTextField.text!)
            self.localData.set(self.itemArray, forKey: "getUserStandard")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Item"
            print(alertTextField.text!)
                print("now")
            closureTextField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

