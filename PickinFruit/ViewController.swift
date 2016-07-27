//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate to self so we can add the required methods:
        self.fruitPicker.delegate = self
        
        // Set the dataSource to self so we can add the required methods:
        self.fruitPicker.dataSource = self
        
        self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        
        let randomNumber1 = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        let randomNumber2 = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        let randomNumber3 = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        
        self.fruitPicker.selectRow(randomNumber1, inComponent: 0, animated: true)
        self.fruitPicker.selectRow(randomNumber2, inComponent: 1, animated: true)
        self.fruitPicker.selectRow(randomNumber3, inComponent: 2, animated: true)

        
        let firstIndex = self.fruitPicker.selectedRowInComponent(0)
        let secondIndex = self.fruitPicker.selectedRowInComponent(1)
        let thirdIndex = self.fruitPicker.selectedRowInComponent(2)
        
        if (firstIndex == secondIndex) && (secondIndex == thirdIndex) {
            
            self.resultLabel.text = "WINNER!"
            
        } else {
            
            self.resultLabel.text = "TRY AGAIN"
        }
    }
    
    // Implement the pickerView(_:titleForRow:forComponent:) method to set the title from the strings within the array:
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.fruitsArray[row % self.fruitsArray.count]
    }
    
    // Necessary data source delegate methods to provide data to the picker view.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        // We have only one component for the picker view so we return a literal 1.
        return 3
    }
    
    // Necessary data source delegate methods to provide data to the picker view.
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return 1000
        // Using .count we get the number of rows from the data.
        //return self.fruitsArray.count
    }
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}