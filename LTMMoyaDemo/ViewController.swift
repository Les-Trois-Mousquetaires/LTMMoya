//
//  ViewController.swift
//  LTMMoyaDemo
//
//  Created by 柯南 on 2020/5/6.
//  Copyright © 2020 LTM. All rights reserved.
//

//Installing Alamofire (5.1.0)
//Installing HandyJSON (5.0.1)
//Installing Moya (14.0.0)
//Installing RxSwift (5.1.1)

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .yellow
        
        LTMMoyaNetworkManager.shareManager.merchantLoginModuleRequest(target: .logout, targetName: "后期扩展使用,后续更新", successClosure: { (result) in
            print("返回成功的结果\(result)")
        }) { (code, message) in
            print("错误编码\(code), 错误信息\(message)")
        }
    }


}

