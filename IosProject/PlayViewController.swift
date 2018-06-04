//
//  PlayViewController.swift
//  IosProject
//
//  Created by Serik on 01.05.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class PlayViewController: UIViewController {
    //LEVEL 111111 ********************
    var image = [UIImage.init(named: "cheese"),UIImage.init(named: "ice-cream"),UIImage.init(named: "baursak"),UIImage.init(named: "apple"),UIImage.init(named: "juice"),UIImage.init(named: "bread"),UIImage.init(named: "meat"),UIImage.init(named: "arbuz"), UIImage.init(named: "kukuruza"), UIImage.init(named: "banana")]
    
    var answers = [["Ірімшік","Қаймақ","Айран"],["Балмұздақ","Сүт","Бауырсақ"],["Бауырсақ","Нан","Самса"],["Алма","Алмұрт","Шие"],["Шырын","Су","Көже"],["Нан","Шелпек","Самса"],["Ет","Қамыр","Сүйек"],["Қарбыз","Қауын","Жүзім"],["Жүгері","Маш","Өрік"],["Банан","Құлпынай","Бүлдірген"],]

    
    
    //LEVEL 222222 *********************
    var image2 = [UIImage.init(named: "sleep"),UIImage.init(named: "swim"),UIImage.init(named: "jump"),UIImage.init(named: "argue"),UIImage.init(named: "run"),UIImage.init(named: "cry"),UIImage.init(named: "angry"),UIImage.init(named: "jump"),UIImage.init(named: "wakeup"),UIImage.init(named: "sit")]
    
    var answer2 = [["Ұйықтау","Жүру","Ояну"],["Жүзу","Сүңгу","Бату"],["Секіру","Құлау","Жүгіру"],["Ұрысу","Достасу","Ойнау"],["Жүгіру","Тұру","Құлау"],["Жылау","Қуану","Күлу"],["Ашулану","Қуану","Күлімсіреу"],["Секіру","Жату","Жүгіру"],["Ұйқыдан ояну","Ұйқтау","Тұру"],["Отыру","Тұру","Құлау"]]
    
    //LEVEL 333333 *********************
    var image3 = [UIImage.init(named: "eyes"),UIImage.init(named: "ear"),UIImage.init(named: "elbow"),UIImage.init(named: "nose"),UIImage.init(named: "hand"),UIImage.init(named: "leg"),UIImage.init(named: "head"),UIImage.init(named: "tongue"),UIImage.init(named: "finger"),UIImage.init(named: "teeth")]
    var answer3 = [["Көз","Қас","Кірпік"],["Құлақ","Шаш","Өкпе"],
        ["Шынтақ","Тізе","Аяқ"],["Мұрын","Көз","Арқа"],["Қол","Тырнақ","Саусақ"],
        ["Аяқ","Қол","Табан"],["Бас","Шаш","Шеке"],["Тіл","Мойын","Бет"],
        ["Саусақ","Алақан","Йық"],["Тіс","Мұрын","Ерін"]]
    
    
    //Variables ************
    var currentQuestion = 0
    var rightAnswer:UInt32 = 0
    var lbal = 0
    var level: Int!
    var audioPlayer = AVAudioPlayer()
    
 
    //OUTLETS *********
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lbl: UILabel!
    
    
  
   
    override func viewWillAppear(_ animated: Bool) {
        Level()
    }
    
    
    //ANSWERS    **************
    @IBAction func AnswerBtn(_ sender: UIButton) {
      
        if(sender.tag ==  Int(rightAnswer)){
            print("Correct")
            lbal += 100
            lbl.text = String(lbal)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "cor", ofType: "mp3")!))
                audioPlayer.play()
            }
            catch{ print(error)}
           
        }
        else{
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "wro", ofType: "mp3")!))
                audioPlayer.play()
            }
            catch{ print(error)}
        }
        if(currentQuestion != image.count){
            Level()
        }
        else{
            let alertController = UIAlertController(
                title: "Congratulation",
                message: ("Your result is: " + String(lbal)),
                preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){(Action) in
                
                self.setMaxPoint(Int16(self.getUser_id()!), self.getUsername()!,Int16(self.level), Int16(self.lbal))
                self.performSegue(withIdentifier: "backToLevel", sender: self)
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)

            print("that's all")
        }
    }
    
    
    //DISPLAY QUESTION ****
    func Level()
    {
        if(level == 1){
            imageView.image = image[currentQuestion]}
        if(level == 2){
            imageView.image = image2[currentQuestion]}
        if(level == 3){
            imageView.image = image3[currentQuestion]}
        
        rightAnswer = arc4random_uniform(3) + 1
        var button: UIButton = UIButton()
        var x = 1
        for i in 1...3
        {
            button = view.viewWithTag(i) as! UIButton
            if ( i == Int(rightAnswer)){
                if(level == 1){
                    button.setTitle(answers[currentQuestion][0], for: .normal)
                }
                else if(level == 2){
                    button.setTitle(answer2[currentQuestion][0], for: .normal)
                }
                else if(level == 3){
                    button.setTitle(answer3[currentQuestion][0], for: .normal)
                }
            }
            else{
                if(level == 1){
                    button.setTitle(answers[currentQuestion][x], for: .normal)
                    x = 2
                }
                if(level == 2){
                    button.setTitle(answer2[currentQuestion][x], for: .normal)
                    x = 2
                }
                if(level == 3){
                    button.setTitle(answer3[currentQuestion][x], for: .normal)
                    x = 2
                }
            }
        }
        currentQuestion += 1
    }
    

    //Function to Insert Data, to Core Data *******************
    func InsertInfo(_ level_id: Int16, _ user_id: Int16, _ score: Int16,_ username: String){
        let appD = UIApplication.shared.delegate as! AppDelegate
        let context = appD.persistentContainer.viewContext
        let info = Point(context: context)
        
        info.score = Int16(score)
        info.level_id = Int16(level_id)
        info.user_id = Int16(getUser_id()!)
        info.username = getUsername()
        appD.saveContext()
    }
    
    
    //**** CALLING USERNAME AND USER_ID ******
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
    
    func setMaxPoint(_ user_id:Int16,_ username: String,_ level_id:Int16, _ score: Int16){
        
        
        print(level_id,score,user_id,username,"@@@@@@@@@@@@@@")
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Point> = Point.fetchRequest()
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            if(searchResults != []){
                for pointT in searchResults{
                    if Int16(pointT.user_id) == user_id{
                        if Int16(pointT.level_id) == level_id{
                            if (pointT.score) < Int16(score){
                                getContext().delete(pointT)
                                InsertInfo(Int16(level_id), Int16(user_id), Int16(score), username)
                            }
                        }
                        else{
                                InsertInfo(Int16(level_id), Int16(user_id), Int16(score), username)
                        }
                    }else {
                        InsertInfo(Int16(level_id), Int16(user_id), Int16(score), username)
                    }
                }
            }else{
                InsertInfo(Int16(level_id), Int16(user_id), Int16(score), username)
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
    
}
