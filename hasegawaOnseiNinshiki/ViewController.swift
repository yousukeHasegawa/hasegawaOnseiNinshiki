//
//  ViewController.swift
//  hasegawaOnseiNinshiki
//
//  Created by Yousuke Hasegawa on 2021/11/08.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    //クラスの宣言
//   var communication:Communication!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var savedLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    var removeText:String = "録音終了"
    var savedText: String!
    var inputText:String = ""{
        didSet{
            if inputText.contains("録音開始"){
                statusLabel.text = "REC START"
                textField.text = ""
                outputLabel.text = "保存中。。。"
            }
            if inputText.contains("録音終了"){
                statusLabel.text = "REC STOP"
                
                outputLabel.text = inputText
                savedText = inputText.replacingOccurrences(of:"録音終了" , with: "")
                savedLabel.text = savedText!
                
                //postDataメソッド実行
                //communication.postData(savedText: unwrappedText)
                let communication = Communication()
                communication.postData(savedText!)
                textField.text = ""
                
            }
        }
    }

    @IBAction func textFieldInput(_ sender: Any) {
        inputText = textField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        textField.delegate = self
    }
}
