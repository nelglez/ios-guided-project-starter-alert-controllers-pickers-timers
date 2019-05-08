//
//  CountdownPicker.swift
//  Countdown
//
//  Created by Nelson Gonzalez on 5/8/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class CountdownPicker: UIPickerView {
    
    lazy var countdownPickerData: [[String]] = {
        // Create string arrays using numbers wrapped in string values: ["0", "1", ... "60"]
        let minutes: [String] = Array(0...60).map { String($0) }
        let seconds: [String] = Array(0...59).map { String($0) }
        
        // "min" and "sec" are the unit labels
        let data: [[String]] = [minutes, ["min"], seconds, ["sec"]]
        return data
    }()
    
    var duration: TimeInterval {
        // Convert from minutes + seconds to total seconds
        let minuteString = self.selectedRow(inComponent: 0)
        let secondString = self.selectedRow(inComponent: 2)
        
        
        // "1" -> 1
        let minutes = Int(minuteString)
        let seconds = Int(secondString)
        
        //4 min 3 sec = 4 * 60 + 3 = 240 + 3 = 243 seconds
        let totalSeconds = TimeInterval(minutes * 60 + seconds)
        return totalSeconds
    }
    
//called when loaded from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        dataSource = self
        delegate = self
    }
    
}

extension CountdownPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return countdownPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countdownPickerData[component].count
    }
    
    
}

extension CountdownPicker: UIPickerViewDelegate {
//Customize appearance
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 60 //points
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
     let timeValue = countdownPickerData[component][row]
        
        return timeValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        
        //TODO: add a delegate and call the method
    }
}
