//
//  ViewController.swift
//  DiceApp
//
//  Created by new on 02/05/2019.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    //put the names of our dice image asseets in an array in order to pick out our dice image from this array
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //upon opening up the app, i want to change the dice when the screen loads up
        //generate a new set of dice faces
        updateDiceImages()
        // Do any additional setup after loading the view, typically from a nib.
    }


    //get triggered when the roll dice button is clicked
    @IBAction func rollButtonPressed(_ sender: UIButton) {
      updateDiceImages()
    }
    
    func updateDiceImages(){
        var counter: Int = 0
        counter += 1
        
        //arc4random is a built in function that comes with the UIKit class to create random numbers
        //        this function would generate numbers between 0-5 excluding 6
        //by default, arc4random_uniform sends back UInt32 as a result which could be positive or negative unsigned so we have to typecast the parameter to Integer using Int function
        randomDiceIndex1 = Int(arc4random_uniform(6))
        //        update the declared variable up when the roll dice button is pressed
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        //when the roll button is clicked, change the dice image view 1 property which is the image on it
        //change the picture from previous state to new one
        //        the UIImage function below is just a data type like string and ints UIImage takes parameter of the file or image name u have in ur accet file
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
        print("you won!","\(randomDiceIndex1)")
        if (randomDiceIndex1 == 5 && randomDiceIndex2 == 5) {
            let alertController = UIAlertController(title: "Hurray!!!", message:
                "You Won!!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue Playing..", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        if (counter == 6){
            let alertController = UIAlertController(title: "Oops!!", message:
                "Time up! Try to click Roll just thrice (3times) to become the winner.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Start Playing Again..", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    //a function that allow user when the iPhone device shakes or user shakes the device, we want the dice images to get shaked or rolled
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
}

