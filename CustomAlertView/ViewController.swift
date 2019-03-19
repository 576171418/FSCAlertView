//
//  ViewController.swift
//  CustomAlertView
//
//  Created by fsc on 2019/3/19.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FSCAlertViewDelegate {
    
    var fscAlertView: FSCAlertView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fscAlertView = FSCAlertView(frame: self.view.bounds, title: "请问需要反馈什么问题？", message: "你也可以在个人页的反馈帮助中心找到这个功能", labelStrings: ["帮助中心","遇到异常","意见反馈","参与Beta版本","关闭摇一摇","没啥事"])
        fscAlertView.delegate = self
        self.view.addSubview(fscAlertView)
    }
    
    func alertViewSlectedAction(row: Int) {
        print("当前选择\(row)行")
    }


}

