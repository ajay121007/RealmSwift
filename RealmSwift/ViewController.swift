//
//  ViewController.swift
//  RealmSwift
//
//  Created by Admin on 02/09/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlet
    
    @IBOutlet var tableView: UITableView!
    
    
    //MARK: App Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: Call On Tap Of Add Button
    
    @IBAction func addButtonClicked(_ sender: Any) {
        self.pushToNextController()
        
    }
}

 //MARK: UITableView DataSource And Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DBManager.sharedInstance.getDataFromDB().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as UITableViewCell
        let item = DBManager.sharedInstance.getDataFromDB()[indexPath.row] as Item
        cell.textLabel?.text = item.textString
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let update = UITableViewRowAction(style: .normal, title: "Update") { action, index in
          self.pushToNextController(index:indexPath.row)
        }
        let delete = UITableViewRowAction(style: .default, title: "Delete") { action, index in
            self.deleteItem(currentItem: DBManager.sharedInstance.getDataFromDB()[indexPath.row] as Item)
        }
        return [delete, update]
    }
}

extension ViewController
{
    //MARK: Call On Tap Of Delete
    
    /*
         Delete Data From Selected Index.
    */
    func deleteItem(currentItem:Item?){
        if let item = currentItem {
            DBManager.sharedInstance.deleteFromDb(object: item)
            tableView.reloadData()
        }
    }
    
    //MARK: Call On Tap Of Edit
    
    /*
        Sent Data To Next Controller On Selected Index
     */
    
    func pushToNextController(index:Int = -1){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondController") as! SecondController
        guard index == -1 else {
            let item = DBManager.sharedInstance.getDataFromDB()[index] as Item
            vc.type = "Edit"
            vc.index = index
            vc.currentItem = item
            return self.present(vc, animated: true, completion: nil)
        }
        vc.currentItem = nil
        self.present(vc, animated: true, completion: nil)
    }
}
