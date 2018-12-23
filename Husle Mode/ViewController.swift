//
//  ViewController.swift
//  Husle Mode
//
//  Created by Eric Stein on 12/22/18.
//  Copyright © 2018 Eric Stein. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLabel: UILabel!
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 50, width: 375, height: 400)
        }) { (finished) in
            self.hustleLbl.isHidden = false
            self.onLabel.isHidden = false
        }
    }
    
    
}

