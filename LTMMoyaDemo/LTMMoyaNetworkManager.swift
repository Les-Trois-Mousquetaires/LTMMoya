//
//  LTMMoyaNetworkManager.swift
//  LTMMoyaDemo
//
//  Created by 柯南 on 2020/5/6.
//  Copyright © 2020 LTM. All rights reserved.
//

import Moya

class LTMMoyaNetworkManager: LTMNetworkDeal {
    static let shareManager = LTMMoyaNetworkManager()
    private override init() {
        super.init()
    }
    
    //MARK: - 登录请求
     private var loginProvider = MoyaProvider<LTMMoyaLoginApiService>(plugins: [NetworkLoggerPlugin()])
       public func merchantLoginModuleRequest<Model: LTMModel>(target: LTMMoyaLoginApiService, targetName: Model, successClosure:((_ result: Any) -> ())? = nil, failureClosure:((_ errorCode: Int, _ errorMessage: String) ->())? = nil){
           loginProvider.request(target) { (result) in
               self.dealWithResult(targetName: targetName, result: result,successClosure: successClosure, failureClosure: failureClosure)
           }
       }
    
    //MARK: - 首页接口
    private var homeProvider = MoyaProvider<LTMMoyaHomeApiService>(plugins: [NetworkLoggerPlugin()])
    
    public func merchantSalesApplyModuleRequest<Model: LTMModel>(target: LTMMoyaHomeApiService, targetName: Model, successClosure:((_ result: Any) -> ())? = nil, failureClosure:((_ errorCode: Int, _ errorMessage: String) ->())? = nil){
        homeProvider.request(target) { (result) in
            self.dealWithResult(targetName: targetName, result: result,successClosure: successClosure, failureClosure: failureClosure)
        }
    }
}

