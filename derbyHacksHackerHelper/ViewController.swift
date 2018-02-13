//
//  ViewController.swift
//  derbyHacksHackerHelper
//
//  Created by Jake Higgot on 2/10/18.
//  Copyright © 2018 Jake Higgott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //fire means continue
    //set everything in buttons to a function
    
    
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var studyLabel: UILabel!
    
    var seconds = 1500
    // Timer
    var timer = Timer()
    var isPause = false
    var isTiming = false
    var isBreak = false
    var pauseReset = false
    
    // start button that calls the start function.
    
    @IBAction func Start(_ sender: UIButton) {
        start()
        
    }
    
    // pause button that calls the pause function and uses a bool to switch colors.
    
    @IBAction func pause(_ sender: UIButton) {
        pause()
        
        if isPause == false {
            startStopButton.setTitle("Pause", for: .normal)
            startStopButton.backgroundColor = .red
            pauseReset = false
        }
        else {
            startStopButton.setTitle("Unpause", for: .normal)
            startStopButton.backgroundColor = .green        }
    }
    
    // Reset button that calls a reset function and then resets the text and resets the pause button color if it is paused.
    
    @IBAction func Reset(_ sender: Any) {
        reset()
        seconds = 1500
        timeLabel.text = "25:00"
        startStopButton.setTitle("Pause", for: .normal)
        startStopButton.backgroundColor = .red
        pauseReset = false
    }
    
    @objc func action (){
        seconds -= 1
        timeLabel.text = timeString(for: seconds)
        studyOrBreak()
    }
    
    
    // Formats the function and takes an integer input and returns string in [hours.hours , min.min , sec.sec]
    
    fileprivate func timeString(for seconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour]
        formatter.zeroFormattingBehavior = .pad
        let output = formatter.string(from: TimeInterval(seconds))!
        return seconds < 3600 ? output.substring(from: output.range(of: ":")!.upperBound) : output
    }
    
    //function that detects if the timer is on study when it runs out of time and if it is then it will set it to break and set the time to break.
    
    func studyOrBreak(){
        if seconds <= 0 && isBreak == false {
            reset()
            studyLabel.text = "Break"
            seconds = 300
            timeLabel.text = ("05:00")
            isBreak = true
            
    }
        
        // nested function that returns
        
        if seconds <= 0 && isBreak == true {
            reset()
            studyLabel.text = "Study"
            seconds = 1500
            timeLabel.text = ("25:00")
            isBreak = false
            
        }
    }
    
    func start(){
        if isTiming == false {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
            isTiming = true
        } else {
            return
        }
    }
    
    func pause(){
        if isPause == true {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
            isPause = false
        } else {
            timer.invalidate()
            isPause = true
        }
    }
    func reset(){
        timer.invalidate()
        seconds = 0
        isPause = false
        isTiming = false
        pauseReset = true
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
//textfeild.text


