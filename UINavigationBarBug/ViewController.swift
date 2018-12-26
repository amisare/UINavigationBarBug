//
//  ViewController.swift
//  UINavigationBarBug
//
//  Created by GuHaijun on 2018/12/26.
//  Copyright © 2018 GuHaijun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var page = 0
    
    lazy var nextViewController: ViewController = {
        let vc = ViewController.init()
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 将 rightBarButtonItem 设置移至 viewWillAppear
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Next", style: .plain, target: self, action: #selector(pushNextViewController))
        self.view.backgroundColor = UIColor.white
        self.title = "Title" + " " + "\(self.page)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 在 viewWillAppear 中设置 rightBarButtonItem
        // self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Next", style: .plain, target: self, action: #selector(pushNextViewController))
    }
    
    @objc public func pushNextViewController() {
        let vc = self.nextViewController;
        vc.page = self.page + 1
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

