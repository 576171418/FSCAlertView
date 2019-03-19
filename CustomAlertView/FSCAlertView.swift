//
//  FSCAlertView.swift
//  CustomAlertView
//
//  Created by fsc on 2019/3/19.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit
import SnapKit

let screenWidth = UIScreen.main.bounds.width
let screenHeigt = UIScreen.main.bounds.height

protocol FSCAlertViewDelegate {
    func alertViewSlectedAction(row: Int)
}

class FSCAlertView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = labelStrings[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.blue
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.alertViewSlectedAction(row: indexPath.row)
        self.removeFromSuperview()
    }
    
    
    var backgroundView: UIView!
    var titleLabel: UILabel!
    var title: String
    var messageLabel: UILabel!
    var message: String
    var tableView: UITableView!
    var labelStrings: [String]
    var delegate: FSCAlertViewDelegate?
    
    init(frame: CGRect, title: String, message: String, labelStrings: [String]) {
        self.title = title
        self.message = message
        self.labelStrings = labelStrings
        
        super.init(frame: frame)
        
        initView()
        alertViewAnimation()
    }
    
    func initView() {
        self.backgroundColor = UIColor.lightGray
        self.alpha = 1
        
        backgroundView = UIView(frame: CGRect.zero)
        backgroundView.backgroundColor = UIColor.white
        backgroundView.layer.cornerRadius = 20
        backgroundView.clipsToBounds = true
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(screenWidth - 80)
            make.height.greaterThanOrEqualTo(0)
        }
        
        titleLabel = UILabel(frame: CGRect.zero)
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        titleLabel.textColor = UIColor.black
        titleLabel.numberOfLines = 0
        backgroundView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(16)
            make.height.greaterThanOrEqualTo(20)
        }
        
        messageLabel = UILabel(frame: CGRect.zero)
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 17)
        messageLabel.textColor = UIColor.darkGray
        messageLabel.numberOfLines = 0
        backgroundView.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.greaterThanOrEqualTo(20)
        }
        
        tableView = UITableView(frame: CGRect.zero)
        tableView.dataSource = self
        tableView.delegate = self
        backgroundView.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(messageLabel.snp.bottom).offset(10)
            make.height.equalTo(50*labelStrings.count)
            make.bottom.equalToSuperview()
        }
    }
    
    func alertViewAnimation() {
        let startScale = CGAffineTransform(scaleX: 0.1, y: 0.1)
        backgroundView.alpha = 0
        backgroundView.transform = startScale
        UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.5) {
            self.backgroundView.alpha = 1
            self.backgroundView.transform = .identity
            }.startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
