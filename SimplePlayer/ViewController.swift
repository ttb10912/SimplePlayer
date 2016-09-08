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
    
    @IBOutlet weak var lbl_CurrentTime: UILabel!
    
    @IBOutlet weak var lbl_TotalTime: UILabel!

    @IBOutlet weak var sld_Volume: UISlider!
    
    @IBOutlet weak var sld_Duration: UISlider!
    
    var musicPlay:Bool = false
    
    var minutes = 0
    var seconds = 0
    var sT = 0
    var mT = 0
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        audio = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: ".mp3")!))
        
        
        sT = Int(String(format: "%1.0f" , audio.duration%60))!
        mT = Int(String(format: "%1.0f" , audio.duration/60))!
        
        if (sT < 10 && mT < 10 )
        {
            self.lbl_TotalTime.text = "0\(mT):0\(sT)"
            
        }
        else
        {
            if(sT < 10)
            {
                self.lbl_TotalTime.text = "\(mT):0\(sT)"
            }
            if(sT < 10)
            {
                self.lbl_TotalTime.text = "0\(mT):\(sT)"
            }
            else
            {
                self.lbl_TotalTime.text = "\(mT):\(sT)"
            }
        }
        
        sld_Duration.minimumValue = 0
        
        sld_Duration.maximumValue = Float(audio.duration)
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
        
        audio.prepareToPlay()
        print(audio.duration/60)
        
        addThumpImg4Sld()
        
    }
    func updateCurrentTime()  {
        
        
        
        
        self.sld_Duration.value = Float(audio.currentTime/audio.duration)
        
        seconds = Int(String(format: "%1.0f", audio.currentTime%60))!
        minutes = Int(String(format: "%1.0f", audio.currentTime/60))!
        
        if (seconds < 10 && minutes < 10 )
        {
            self.lbl_CurrentTime.text = "0\(minutes):0\(seconds)"
            
        }
        else
        {
            if(seconds < 10)
            {
                self.lbl_CurrentTime.text = "\(minutes):0\(seconds)"
            }
            if(minutes < 10)
            {
                self.lbl_CurrentTime.text = "0\(minutes):\(seconds)"
            }
            else
            {
                self.lbl_CurrentTime.text = "\(minutes):\(seconds)"
            }
            
       

            
        }
        
        
        
        
        
        
        sld_Duration.value = Float(audio.currentTime)
    }
    
    
    
    @IBAction func sld_ChangeTime(sender: UISlider) {
        sld_Duration.maximumValue = Float(audio.duration)
        
        
        audio.currentTime = Double(sld_Duration.value)
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

