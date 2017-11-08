//
//  ViewController.swift
//  sampleImageGesture1
//
//  Created by yuka on 08/11/2017.
//  Copyright © 2017 yuka. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var myAudioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        makeSound()
    }

    @IBAction func tapGesture1(_ sender: UITapGestureRecognizer) {
        print("aaa")
        self.myAudioPlayer.play()
        
    }
    
    @IBAction func tapGesture2(_ sender: UITapGestureRecognizer) {
        //view2
        print("bbb")
        
    }
    
    @IBAction func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        alertAction1(
            s_title: "エドガー・アラン・ポー"
            , s_message: "I wish I could write as mysterious as a cat.\n ネコのようにミステリアスに書けたらと思う。"
            , s_action: "OK"
        )
    }
    
    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        alertAction1(
            s_title: "レオナルド・ダ・ヴィンチ"
            , s_message: "The smallest feline is a masterpiece.\n ネコ科の一番小さな動物、つまり猫は、最高傑作である。"
            , s_action: "OK")
    }
    //imageViewはuser intaractction enabled にチェック入れておかないといけない
    
    func alertAction1(s_title:String, s_message:String, s_action:String){
        
        
        //部品となるアラート
        let alert = UIAlertController(
            title: s_title ,
            message: s_message,
            preferredStyle: .alert
        )
        
        //ボタンを増やしたいときは、addActionをもう一つ作ればよい
        alert.addAction(
            UIAlertAction(
                title: s_action,
                style: .default,
                handler: nil)
        )
        
        //アラートを表示
        present(alert,
                animated: true,
                completion: nil
        )
        
    }
    
    func makeSound() {
        let soundFile = Bundle.main.path(forResource: "cat7", ofType: "mp3")!
        let soundClear = URL(fileURLWithPath: soundFile )
        
        //AVAudioPlayerのインスタンス化
        do {
            myAudioPlayer = try AVAudioPlayer(contentsOf: soundClear as URL)
        }catch{
            print("Failed AVAudioPlayer Instance")
        }
        myAudioPlayer.prepareToPlay()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

