//  ViewController.swift
//  Simon
//
//  Created by Michael Lee on 6/27/16.
//  Copyright © 2016 Michael Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet var buttons: [UIButton]!
  var sequence = [Int]()
  var guessidx = 0
  var sliderSelectedVal: Int = Int()
  var finalVal: Int = 3
  var usedValues: NSMutableSet = NSMutableSet()

  @IBOutlet weak var sequenceNo: UISlider!
  @IBOutlet var sequenceLabel: UILabel!
  
  
  @IBAction func sequenceSelection(sender: UISlider) {
    let currentVal: UISlider = sender
    sliderSelectedVal = Int(currentVal.value)
    self.sequenceLabel.text = "\(sliderSelectedVal)"
  }
    
  @IBAction func sliderFinalValue(sender: UISlider) {
    
    finalVal = Int(sender.value)
    print(finalVal)
    generateSequence()
  }
    
   @IBAction func whenFingerLifted(sender: UISlider) {
   }
    
    func generateSequence(){
        var randomNo: UInt32 = 0
        sequence = [Int]()
        for _ in 0..<finalVal{
            
            //let prevNo = randomNo
            randomNo = arc4random_uniform(4)
            sequence.append(Int(randomNo))
        }

    }
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    messageLabel.text = "Double tap to start!"
    generateSequence()
  }
    
  func flashSequence() {
    let queue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
    self.messageLabel.text = "Watch carefully..."
    
    dispatch_async(queue) {
      
        for btnidx in self.sequence {
          dispatch_async(dispatch_get_main_queue()) {
            self.buttons[btnidx].highlighted = true
          }
          NSThread.sleepForTimeInterval(1.0)
          dispatch_async(dispatch_get_main_queue()) {
            self.buttons[btnidx].highlighted = false
          }
          NSThread.sleepForTimeInterval(1.0)
      }
      dispatch_async(dispatch_get_main_queue()) {
        self.messageLabel.text = "Tap out the sequence!"
      }
    }
  }
  
  @IBAction func buttonTapped(sender: UIButton) {
    print(guessidx)
    if buttons[sequence[guessidx]] == sender {
      messageLabel.text = "Good guess"
      guessidx += 1
      if guessidx == sequence.count {
        messageLabel.text = "You win (double tap to restart)"
        guessidx = 0
      }
    } else {
      messageLabel.text = "Wrong!"
      guessidx = 0
      let queue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
      dispatch_async(queue) {
        // blink all buttons and restart game
        dispatch_async(dispatch_get_main_queue()) {
          for btn in self.buttons {
            btn.highlighted = true
          }
        }
        NSThread.sleepForTimeInterval(3.0)
        dispatch_async(dispatch_get_main_queue()) {
          for btn in self.buttons {
            btn.highlighted = false
          }
        }
        NSThread.sleepForTimeInterval(1.0)
        dispatch_async(dispatch_get_main_queue()) {
          self.flashSequence()
        }
      }
    }
  }
  
  @IBAction func startGame(sender: AnyObject) {
    guessidx = 0
    generateSequence()
    flashSequence()
  }
}


