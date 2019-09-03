//
//  SecondController.swift
//  RealmSwift
//
//  Created by Admin on 02/09/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SecondController: UIViewController {

    //MARK: Outlet
    
    @IBOutlet var txtNote: UITextField!
    
    //MARK: Variable Declaration
    
    var currentItem:Item?
    var type = String()
    var index = Int()
    
    //MARK: App Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let item = currentItem {
            txtNote.text = item.textString
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Call On Tap Of Save Button
    
    @IBAction func saveButtonClicked(_ sender: Any) {
     saveData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SecondController {
    
    //MARK: Call On Tap Of Save
    
    /*
     Save And Update Data On Selected Index.
     */
    
    func saveData() {
        let item = Item()
        item.textString = txtNote.text!
        
        if(type == "Edit"){
            item.ID = index
            DBManager.sharedInstance.updateData(object: item)
            self.dismiss(animated: true) { }
        }else{
            item.ID = DBManager.sharedInstance.getDataFromDB().count
            DBManager.sharedInstance.addData(object: item)
            self.dismiss(animated: true) { }
        }
    }
}
