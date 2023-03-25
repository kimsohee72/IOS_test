//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/25.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    var audioPlayer : AVAudioPlayer!
    var audioFile : URL!
    let MAX_VOLUME : Float = 10.0
    var progressTimer : Timer!
    let timePlayerSelector : Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector : Selector = #selector(ViewController.updateRecordTime)
    var audioRecorder : AVAudioRecorder!
    var isRecordMode = false
    var play :UIImage?
    var pause : UIImage?
    var record : UIImage?
    var stop : UIImage?
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var slVolume: UISlider!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var lblEndTime: UILabel!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var pvProgressPlay: UIProgressView!
    
    @IBOutlet var lblRecordTime: UILabel!
    @IBOutlet var btnRecord: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectAudioFile()
        play = UIImage(named: "play.png")
        pause = UIImage(named: "pause.png")
        stop = UIImage(named: "stop.png")
        record = UIImage(named: "record.png")
        imgView.image = stop
        // Do any additional setup after loading the view.
        if !isRecordMode {
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        }else{
            initRecord()
        }
    }
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("Error-initPlay : \(error)")
        }
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        lblEndTime.text = converNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = converNSTimeInterval2String(0)
        setPlayButtons(true, pause: false, stop: false)
    
    }
    func setPlayButtons(_ play:Bool, pause:Bool, stop:Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    func converNSTimeInterval2String(_ time: TimeInterval) -> String{
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy : 60))
        let strTime = String(format : "%02d:%02d",min,sec)
        return strTime
    }
    
    func selectAudioFile(){
        if !isRecordMode{
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        }
        else{
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathExtension("recordFile.m4a")
        }
    }
    func initRecord(){
        let recordSettings = [
            AVFormatIDKey : NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey : 2,
            AVSampleRateKey : 44100.0] as [String : Any]
        do{
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        } catch let error as NSError {
            print("Error-initRecord : \(error)")
        }
        
        audioRecorder.delegate = self
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = converNSTimeInterval2String(0)
        lblCurrentTime.text = converNSTimeInterval2String(0)
        setPlayButtons(false, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do{
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError{
            print("Error-setCategory : \(error)")
        }
        do{
            try session.setActive(true)
        } catch let error as NSError{
            print("Error-setActive : \(error)")
        }
    }

    @IBAction func btnRecord(_ sender: UIButton) {
        
        if (sender as AnyObject).titleLabel?.text == "Record"{
            imgView.image = record
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        }else{
            imgView.image = stop
            audioRecorder.stop()
            progressTimer.invalidate()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            btnPlay.isEnabled = true
            initPlay()
        }
    }
    @IBAction func swRecordMode(_ sender: UISwitch) {
        imgView.image = stop
        if sender.isOn {
            btnRecord.setTitle("Record", for: .normal)
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblRecordTime!.text = converNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
        }
        else{
            audioRecorder.stop()
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = converNSTimeInterval2String(0)
        }
        selectAudioFile()
        if !isRecordMode {
            initPlay()
        }
        else{
            initRecord()
        }
    }
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        imgView.image = play
        setPlayButtons(false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    @objc func updatePlayTime(){
        lblCurrentTime.text = converNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    @objc func updateRecordTime(){
        lblRecordTime.text = converNSTimeInterval2String(audioRecorder.currentTime)
        
    }
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        imgView.image = pause
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
    @IBAction func btnStopAudio(_ sender: UIButton) {
        imgView.image = stop
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = converNSTimeInterval2String(0)
        setPlayButtons(true, pause: false, stop: false)
        progressTimer.invalidate()
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        progressTimer.invalidate()
        setPlayButtons(true, pause: false, stop: false)
    }
}
