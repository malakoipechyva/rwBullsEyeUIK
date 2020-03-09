//
//  ViewController.swift
//  BullsEyeUIKit
//
//  Created by malakoipechyva on 3/5/20.
//  Copyright © 2020 malakoipechyva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let roundedValue = slider.value.rounded()
    currentValue = Int(roundedValue)
    startNewGame()
    
  }
  @IBAction func showAlert() {
    let difference = abs(currentValue - targetValue)
    var points = 100 - difference
    
    score += points
    
    let title: String
    if difference == 0 {
      title = "Perfect!"
      points += 100
    } else if difference < 5 {
      title = "You almost had it!"
      points += 50
    } else if difference < 10 {
      title = "Pretty good!"
    } else {
      title = "Not even close..."
    }
    
    let message = "You scored \(points) points"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Ok", style: .default, handler: {
      action in self.startNewRound()
    })
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider ) {
    let roundedValue = slider.value.rounded()
    currentValue = Int(roundedValue)
  }
  
  func startNewRound() {
    round += 1
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    updatesLabels()
  }
  
  func updatesLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
  @IBAction func startNewGame() {
    score = 0
    round = 0
    startNewRound()
  }

}

