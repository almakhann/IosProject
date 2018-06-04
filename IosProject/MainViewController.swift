//
//  MainViewController.swift
//  IosProject
//
//  Created by Serik on 01.05.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet var mainBtn: UIButton!
    @IBOutlet var learnBtn: UIButton!
    @IBOutlet var settingBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainBtn.layer.cornerRadius = 10
        learnBtn.layer.cornerRadius = 10
        settingBtn.layer.cornerRadius = 10
        
        name.text = getUsername()
        UserModel.sharedInstance.name = getUsername()!
        mainBtn.center.x -= view.bounds.width
        learnBtn.center.x += view.bounds.width
        settingBtn.center.x -= view.bounds.width
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.mainBtn.center.x += self.view.bounds.width;
            self.learnBtn.center.x -= self.view.bounds.width;
            self.settingBtn.center.x += self.view.bounds.width;
        },completion: nil)
        }
 
   //ANIMATION   *********
    @IBAction func play(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.mainBtn.center.x -= self.view.bounds.width;
            self.learnBtn.center.x += self.view.bounds.width;
            self.settingBtn.center.x -= self.view.bounds.width;
        },completion: nil)
    }
    
    @IBAction func Learn(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.mainBtn.center.x -= self.view.bounds.width;
            self.learnBtn.center.x += self.view.bounds.width;
            self.settingBtn.center.x -= self.view.bounds.width;
        },completion: nil)
    }
    @IBAction func Rating(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.mainBtn.center.x -= self.view.bounds.width;
            self.learnBtn.center.x += self.view.bounds.width;
            self.settingBtn.center.x -= self.view.bounds.width;
        },completion: nil)
    }
    
    
    //Get Username **********
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func getUsername () -> String? {
        var username: String!
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<MyData> = MyData.fetchRequest()
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            if let userName = searchResults.last?.value(forKey: "username"){
                username = (userName as! String)
            }
        } catch {
            print("Error with request: \(error)")
        }
        return username
    }
}




