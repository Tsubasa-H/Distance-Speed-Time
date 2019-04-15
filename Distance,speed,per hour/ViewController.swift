//
//  ViewController.swift
//  Distance,speed,per hour
//
//  Created by 服部翼 on 2019/03/26.
//  Copyright © 2019 服部翼. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var distance: UITextField!
    @IBOutlet var speed: UITextField!
    @IBOutlet var answer: UILabel!
    @IBOutlet var button: UIButton!
    @IBOutlet var minutes: UILabel!
    @IBOutlet var seconds: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculation_button(_ sender: Any) {
        
        //guardによってtextに数字が記入されてない場合ボタンの効果を無くす
        guard let x: Double = Double(distance.text!) else {
            return
        }
        
        guard let y: Double = Double(speed.text!) else {
            return
        }
        //時速を計算
        let z: Double? = Double(x) / Double(y)
        
        //distanceとspeedを割った数値を小数第３位で切り捨てる
        let answer_strings: String = String(floor(z!*100) / 100)
        answer.text = answer_strings
        
        //分速を計算
        let a_minutes :Double? = Double(x) / Double(y) * 60
        let minutes_strings: String = String(floor(a_minutes!*100) / 100)
        minutes.text = minutes_strings
        
        //秒速を計算
        let b_seconds: Double? = Double(x) / Double(y) * 60 * 60
        let seconds_strings: String = String(floor(b_seconds!*100) / 100)
        seconds.text = seconds_strings
    }
    
    @IBAction func tapscreen(_ sender: Any) {
        // スクリーンをタップするとnumberpadが消える
        self.view.endEditing(true)
    }
    
    @IBAction func delete_button(_ sender: Any) {
        //デリートボタンを押すと全て消える
        distance.text = ""
        speed.text = ""
        answer.text = ""
        minutes.text = ""
        seconds.text = ""
    }
    
}

