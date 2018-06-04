//
//  LearnViewController.swift
//  IosProject
//
//  Created by Serik on 03.05.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {

    var images = [UIImage.init(named: "cheese"),UIImage.init(named: "ice-cream"),UIImage.init(named: "baursak"),UIImage.init(named: "apple"),UIImage.init(named: "juice"),UIImage.init(named: "bread"),UIImage.init(named: "meat"),UIImage.init(named: "arbuz"), UIImage.init(named: "kukuruza"), UIImage.init(named: "banana"),UIImage.init(named: "sleep"),UIImage.init(named: "swim"),UIImage.init(named: "jump"),UIImage.init(named: "argue"),UIImage.init(named: "run"),UIImage.init(named: "cry"),UIImage.init(named: "angry"),UIImage.init(named: "jump"),UIImage.init(named: "wakeup"),UIImage.init(named: "sit"),UIImage.init(named: "eyes"),UIImage.init(named: "ear"),UIImage.init(named: "elbow"),UIImage.init(named: "nose"),UIImage.init(named: "hand"),UIImage.init(named: "leg"),UIImage.init(named: "head"),UIImage.init(named: "tongue"),UIImage.init(named: "finger"),UIImage.init(named: "teeth")]
    var labels = ["Ірімшік","Балмұздақ","Бауырсақ","Алма","Шырын","Нан","Ет","Қарбыз","Жүгері","Банан","Ұйықтау","Жүзу","Секіру","Ұрысу","Жүгіру","Жылау","Ашулану","Секіру","Ұйқыдан ояну", "Отыру", "Көз", "Құлақ", "Шынтақ", "Мұрын", "Қол", "Аяқ","Бас","Тіл","Саусақ","Тіс",]
    
    var label1 = ["[Irimshik]","[Balmuzdak]","[Bauyrsak]","[Alma]","[Shyryn]","[Nan]","[Et]","[Karbyz]","[Zhugeri]","[Banan]","[Uiktau]","[Zhuzu]","[Sekiru]","[Urusu]","[Zhuguru]","[Zhilau]","[Ashulanu]","[Sekiru]","[Uikidan turu]","[Oturu]","[Koz]","[Kulak]","[Shyntak]","[Murun]","[Kol]","[Ayak]","[Bas]","[Til]","[Sausak]","[Tis]",]
    
    var btn = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = images[btn]
        label.text = labels[btn]
        label2.text = label1[btn]
        nextBtn.layer.cornerRadius = 7
        learnLabel.layer.borderWidth = 0.5
        learnLabel.layer.borderColor = UIColor.black.cgColor
        learnLabel.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var learnLabel: UILabel!
    
    
    @IBAction func NextAction(_ sender: UIButton) {
        label.text = labels[btn+1]
        imageView.image = images[btn+1]
        label2.text = label1[btn+1]
        btn += 1
    }
    
   

}
