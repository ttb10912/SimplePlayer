//
//  ViewController.swift
//  SimplePlayer
//
//  Created by TTB10912 on 06/09/2016.
//  Copyright © 2016 TTB10912. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var audio = AVAudioPlayer()
    
    @IBOutlet weak var btn_Play: UIButton!

    @IBOutlet weak var sld_Volume: UISlider!
    
    var musicPlay:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        audio = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: ".mp3")!))
        audio.prepareToPlay()
        
        addThumpImg4Sld()
    }
    func addThumpImg4Sld()  {
        sld_Volume.setThumbImage(UIImage(named: "thumb.png"), forState: .Normal)
        sld_Volume.setThumbImage(UIImage(named: "thumbHightLight.png"), forState: .Highlighted)
    }

    @IBAction func act_Volume(sender: UISlider) {
        audio.volume = sender.value
        
    }
    
    
    @IBAction func btn_Play(sender: AnyObject) {
        if (musicPlay == false) {
            audio.play()
            btn_Play.setBackgroundImage(UIImage(named: "pause.png"), forState: .Normal)
            musicPlay = true

        } else {
            audio.pause()
            btn_Play.setBackgroundImage(UIImage(named: "play.png"), forState: .Normal)
            musicPlay = false


        }
    }
    

}

