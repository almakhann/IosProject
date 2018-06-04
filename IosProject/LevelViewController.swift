//
//  LevelViewController.swift
//  IosProject
//
//  Created by Serik on 01.05.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit
import CoreData

class LevelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Arrays    **********************************************************
    var level = ["Food","Action","Body part"]
    var result = ["Result: ","Result: ","Result: "]
    
    var s = [0,0,0]
    
    //Outlets    **********************************************************
    @IBOutlet var label: UILabel!
    @IBOutlet var TableView: UITableView!
    var name = String()
    var total = Int16()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name = getname()!
        total = getScore()!
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        refresh.alpha = 0
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        getLevel_id()
        
        if s[0] != 0 && s[1] != 0 && s[2] != 0{
            SaveBtn()
        }
        super.viewWillAppear(true)
    }
    
    
    //Table functions   ***************************************************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return level.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.Btn.tag = indexPath.row
        cell.levelLAbel.text = level[indexPath.row]
        cell.resultLabel.text = result[indexPath.row]
        cell.point.text = String(s[indexPath.row])
        return cell
    }
    
    
    @IBAction func StartBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "level", sender: sender)
    }
    
    //Segue    *********************************************************
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "level"{
            let destination = segue.destination as! PlayViewController
            destination.level = (sender as! UIButton).tag + 1
            print(destination.level)
        }
    }
    
    
    //CALLING LEVEL_ID AND POINTS FROM CORE DATA
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func getLevel_id () -> [Int]? {
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Point> = Point.fetchRequest()
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            for id in searchResults{
                if(id.user_id == Int16(self.getUser_id()!)){
                    s[Int(id.level_id-1)] = Int(id.score)
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
    return s
    }

    
    func getUser_id () -> Int? {
        var user_id: Int!
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<MyData> = MyData.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            if let userID = searchResults.last?.value(forKey: "user_id"){
                user_id = (userID as! Int)
            }
        } catch {
            print("Error with request: \(error)")
        }
        return user_id
    }
    func getname () -> String?{
        var name: String!
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Point> = Point.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            if let userID = searchResults.last?.value(forKey: "username"){
                name = (userID as! String)
            }
        } catch {
            print("Error with request: \(error)")
        }
        return name
    }
    
    
    @IBOutlet var refresh: UIButton!

    func InsertInfo( _ total: Int16,_ username: String){
        let appD = UIApplication.shared.delegate as! AppDelegate
        let context = appD.persistentContainer.viewContext
        let info = Count(context: context)
    
        info.total = Int16(total)
        info.username = username
        appD.saveContext()
    }

    func getScore () -> Int16? {
        var username: Int16!
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Count> = Count.fetchRequest()
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            if let userName = searchResults.last?.value(forKey: "total"){
                username = (userName as! Int16)
            }
        } catch {
            print("Error with request: \(error)")
        }
        return username
    }


    
    func SaveBtn() {
        var total: Int?
        var x: Int16?
        x = self.total
        total = (s[0]+s[1]+s[2])
        if(x! < Int16(total!) && UserModel.sharedInstance.name == self.name){
            InsertInfo(Int16(total!), self.name)
        }
    }
}
