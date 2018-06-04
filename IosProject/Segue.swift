//
//  Segue.swift
//  IosProject
//
//  Created by Serik on 04.05.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit

class Segue: UIStoryboardSegue {
    
    override func perform() {
        scale()
    }
    
    func scale(){
        let fromVC = self.source
        let toVC = self.destination
        toVC.view.transform = CGAffineTransform(scaleX: 0, y: 0)
        toVC.view.center = fromVC.view.center
        let containerView = fromVC.view.superview
        containerView?.addSubview(toVC.view)
        UIView.animate(withDuration: 0.7, delay: 0.5, options: [], animations: {
            toVC.view.transform = CGAffineTransform.identity
        }) { (success) in
            fromVC.present(toVC, animated: false, completion: nil)
        }
    }

}
