//
//  ViewController.swift
//  IosProject
//
//  Created by Serik on 01.05.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var usernameArea: UITextField!
    @IBOutlet var doneBtn: UIButton!

    @IBAction func Btn(_ sender: UIButton) {
        if(usernameArea.text == ""){
            let alertController = UIAlertController(
                title: "STOP",
                message: ("Enter Your name"),
                preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){(Action) in
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
 
        }
        else{
            if getUserID() != nil{
                let userID = getUserID()
                InsertInfo(usernameArea.text!, Int16(userID!))
            }
        }
    }
    
    //function of Insert NAME AND USER_ID to MyData
    func InsertInfo(_ username: String, _ user_id: Int16){
        let appD = UIApplication.shared.delegate as! AppDelegate
        let context = appD.persistentContainer.viewContext
        let info = MyData(context: context)
        
        info.username = username
        info.user_id = user_id
        appD.saveContext()
    }
    
    //INSERTING USER_ID
    func getUserID () -> Int? {
        var id: Int!
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<MyData> = MyData.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            if let userID = searchResults.last?.value(forKey: "user_id"){
                id = (userID as! Int) + 1
            }else{
                id = 0
            }
        } catch {
            print("Error with request: \(error)")
        }
        return id
    }

    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameArea.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneBtn.layer.cornerRadius = 15
        usernameArea.layer.cornerRadius = 15
        //let name = UserDefaults.standard.object(forKey: "username") as! String
        

//        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "MyData")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
//        
//        do {
//            try getContext().execute(deleteRequest)
//            try getContext().save()
//        } catch {
//            print ("There was an error")
//        }
 
    }
}

