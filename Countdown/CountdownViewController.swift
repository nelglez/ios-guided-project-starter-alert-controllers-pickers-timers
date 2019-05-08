//
//  CountdownViewController.swift
//  Countdown
//
//  Created by Paul Solt on 5/8/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    let countdown = Countdown()
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SS"
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        countdown.duration = 5 //seconds
        countdown.delegate = self
        
        timeLabel.font = .monospacedDigitSystemFont(ofSize: timeLabel.font.pointSize, weight: .regular)

    }
    
    private func updateViews() {
//        timeLabel.text = "\(countdown.timeRemaining)"
         timeLabel.text = string(from: countdown.timeRemaining)
        
    }

    //5.019769 ... => 00:00:05.02
    func string(from duration: TimeInterval) -> String {
        let date = Date(timeIntervalSinceReferenceDate: duration)
        return dateFormatter.string(from: date)
    }
    
   

    @IBAction func startButtonPressed(_ sender: UIButton) {
        countdown.start()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        countdown.reset()
    }
    
}

extension CountdownViewController: CountdownDelegate {
    func countdownDidUpdate(timeRemaining: TimeInterval) {
       updateViews()
    }
    
    func countdownDidFinish() {
      
    }
    
    
}

