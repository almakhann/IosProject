//
//  ReitingViewController.swift
//  IosProject
//
//  Created by Serik on 02.05.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit
import CoreData

class ReitingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var TableView: UITableView!
    
    var getInfo: [Count] = Array()
    var count: [Any?] = Array()
    var number = 0
    var id = [Int]()
    
    var username = [String]()
    var score = [Int16]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
 
        
        
        number = getInfo.count
        for i in 0..<number {
            id.append(i+1)
            for j in 0..<number-1{
                if getInfo[j].total < getInfo[j+1].total{
                    swap(&getInfo[j], &getInfo[j+1])
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return id.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReitingTableViewCell
        
        cell.row.text = String(id[indexPath.row])
        cell.username.text = getInfo[indexPath.row].username
        cell.score.text = String(getInfo[indexPath.row].total)
        return cell
    }
    
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func getData() -> [Count]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do{
            getInfo  =  try context.fetch(Count.fetchRequest())
        }catch{
            print("Fetching failed!!!")
        }
        return getInfo
    }
}

