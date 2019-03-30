//
//  ViewController.swift
//  CustomAlertView
//
//  Created by fsc on 2019/3/19.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, FSCAlertViewDelegate,AVAudioPlayerDelegate {
    
    @IBAction func tapAction(_ sender: UIButton) {
    }
    
    var fscAlertView: FSCAlertView!

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.applicationSupportsShakeToEdit = true
    }
    
    func alertViewSlectedAction(row: Int) {
        print("当前选择\(row)行")
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        fscAlertView = FSCAlertView(frame: self.view.bounds, title: "请问需要反馈什么问题？", message: "你也可以在个人页的反馈帮助中心找到这个功能", labelStrings: ["帮助中心","遇到异常","意见反馈","参与Beta版本","关闭摇一摇","没啥事"])
        fscAlertView.delegate = self
        fscAlertView.showAlertView(view: self.view)
    }


}

protocol BaseNumberStringConvertible {
    var intValue: Int? { get }
    var doubleValue: Double? { get }
    var floatValue: Float? { get }
}

extension String: BaseNumberStringConvertible {
    
    public var intValue: Int? {
        if let floatValue = self.floatValue {
            return Int(floatValue)
        }
        return nil
    }
    
    public var floatValue: Float? {
        return Float(self)
    }
    
    public var doubleValue: Double? {
        return Double(self)
    }

    func toIntValue() -> Int? {
        if let floatValue = toFloatValue() {
            return Int(floatValue)
        }
        return nil
    }
    
    func toDoubleValue() -> Double? {
        return Double(self)
    }
    
    func toFloatValue() -> Float? {
        return Float(self)
    }
}

