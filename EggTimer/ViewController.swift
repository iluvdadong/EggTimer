//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 5]
    
    var secondsRemaining = 60
    var timer = Timer()
    @IBOutlet weak var mainTitle: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        timer.invalidate()
        
        let hardness = sender.currentTitle!
        secondsRemaining = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) 이 남았습니다")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            mainTitle.text = "DONE!"
        }
    }
    
    
}
