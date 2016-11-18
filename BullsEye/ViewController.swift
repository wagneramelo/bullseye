//
//  ViewController.swift
//  BullsEye
//
//  Created by Wagner Augusto Melo de Paulo on 21/03/16.
//  Copyright © 2016 Wagner Augusto Melo de Paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    func startNewGame(){
        round = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round+=1
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String
        
        if(points == 100){
            title = "Perfect!"
            points+=100
        }
        else if(points>80 && points<100){
            title = "Almost there!"
            points+=50
        }
        else if(points>40 && points<80){
            title = "You can get it better!"
        }
        else{
            title = "Train more!"
        }
        
        score = score + points
        
        let message = "\n Your score was: \(points)"
        
        let alert = UIAlertController(title:title,
                                      message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.startNewRound()
            self.updateLabels()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    @IBAction func sliderMoved(_ slider: UISlider) {
       currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver(){
        startNewGame()
        updateLabels()
    }
    
}

