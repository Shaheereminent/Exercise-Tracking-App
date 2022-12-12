//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleUpdate: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let exerciseTime = ["Jumping Rope": 30, "Crunch": 30, "Running": 15]
    
    var totalTime = 0
    
    var secondPassed = 0
    
    var timer = Timer()
    
    @IBAction func exerciseSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let exercise = sender.currentTitle ?? "Choose a valid option"
        
        totalTime = exerciseTime[exercise] ?? 30
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleUpdate.text = "You have selected \(exercise)."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime + 1 {
            let percentageProgress = Float(secondPassed) / Float(totalTime)
            progressBar.progress = Float(percentageProgress)
            secondPassed += 1
            
        } else {
            timer.invalidate()
            titleUpdate.text = "Your exercise is completed!"
        }
    }
}
