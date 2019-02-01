//
//  ViewController.swift
//  Exercise BMI Calculator
//
//  Created by David-UC on 1/29/19.
//  Copyright © 2019 David-UC. All rights reserved.
//

import UIKit

enum BMI:String {
    case underweight = "Underweight"
    case healthy = "Healthy"
    case overweight = "Overweight"
    case severelyOverweigth = "Severely Overweigth"
    case morbidlyOverweight = "Morbidly Overweigth"
}

class ViewController: UIViewController {

    @IBOutlet weak var weightSlider:UISlider!
    @IBOutlet weak var weightLabel:UILabel!
    @IBOutlet weak var heightSlider:UISlider!
    @IBOutlet weak var heightLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var categoryLabel:UILabel!
    
    // Colors
    let underweightColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    let healthtyColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
    let overweightColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    let severelyOverweightColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    let morbidlyOverweightColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupInitWeightAndHeight()
        updateScore()
    }
    
    func setupInitWeightAndHeight() {
        weightLabel.text = "\(String.init(format: "%.2f", heightSlider.value)) kg"
        heightLabel.text = "\(String.init(format: "%.2f", weightSlider.value)) m"
    }
    
    func updateScore() {
        let score = weightSlider.value /  pow(heightSlider.value, 2) // (heightSlider.value * heightSlider.value)
        
        scoreLabel.text = "\(String.init(format: "%.2f", score))"
        if score < 18.5 {
            categoryLabel.text = BMI.underweight.rawValue
            view.backgroundColor = underweightColor
        } else if score < 24.9 {
            categoryLabel.text = BMI.healthy.rawValue
            view.backgroundColor = healthtyColor
        } else if score < 29.9 {
            categoryLabel.text = BMI.overweight.rawValue
            view.backgroundColor = overweightColor
        } else if score < 34.9 {
            categoryLabel.text = BMI.severelyOverweigth.rawValue
            view.backgroundColor = severelyOverweightColor
        } else {
            categoryLabel.text = BMI.morbidlyOverweight.rawValue
            view.backgroundColor = morbidlyOverweightColor
        }
    }
    

    @IBAction func weightChange(_ sender: UISlider) {
        weightLabel.text = "\(String.init(format: "%.2f", weightSlider.value)) kg"
        updateScore()
    }
    @IBAction func heightChange(_ sender: UISlider) {
        heightLabel.text = "\(String.init(format: "%.2f", heightSlider.value)) m"
        updateScore()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

