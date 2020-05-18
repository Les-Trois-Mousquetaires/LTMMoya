//
//  Model.swift
//  LTMMoyaDemo
//
//  Created by 柯南 on 2020/5/18.
//  Copyright © 2020 LTM. All rights reserved.
//

import HandyJSON

public protocol LTMModel: HandyJSON{
    
}

struct InfoModel: LTMModel {
    init() {
        name = ""
        test = ""
    }
    
    var name: String
    var test: String
}
