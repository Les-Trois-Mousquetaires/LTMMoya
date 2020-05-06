//
//  LTMNetworkDeal.swift
//  LTMMoyaDemo
//
//  Created by 柯南 on 2020/5/6.
//  Copyright © 2020 LTM. All rights reserved.
//

import Moya
import Alamofire

class LTMNetworkDeal: NSObject {
    
    //MARK: - 数据处理中心
    public func dealResult(targetName: String,result: Result<Response, MoyaError>, successClosure:((_ result: Any) -> ())? = nil, failureClosure:((_ errorCode: Int, _ errorMessage: String) ->())? = nil){

        switch result {
        case let .success(moyaResponse):
            switch moyaResponse.statusCode {
            case 200:
                guard let resultDic: [String: Any] = try? moyaResponse.mapJSON() as? [String : Any],
                    let code: Int = resultDic["code"] as? Int
                    else { return }
                print("统一显示返回数据 \(resultDic)")
                switch code {
                case 200:
                    guard let systemEntity: [String: Any] = resultDic["entity"] as? [String : Any] else {
                        successClosure?(self.success200Deal(response: resultDic, targetName: targetName ))
                        return
                    }
                    successClosure?(self.success200Deal(response: systemEntity, targetName: targetName ))
                case 400:
                    if let errorServerMes = resultDic["message"]{
                        failureClosure?(400, self.error400Deal(response: errorServerMes) ?? "服务器异常,未确认错误信息")
                    }
                case 403:
                    if let errorServerMes = resultDic["message"]{
                        failureClosure?(403, self.error403Deal(response: errorServerMes) ?? "服务器异常,未确认错误信息")
                    }
                case 500:
                    if let errorServerMes = resultDic["message"]{
                        failureClosure?(500, self.error500Deal(response: errorServerMes) ?? "服务器异常,未确认错误信息")
                    }
                default:
                    print("errorServerMes")
                }
            case 404:
                failureClosure?(moyaResponse.statusCode,"api地址错误,请内部开发人员修改后重试")
            case 500:
                failureClosure?(moyaResponse.statusCode,"服务器响应错误,请内部开发人员修改后重试")
            case 502:
                failureClosure?(moyaResponse.statusCode, self.error502Deal(response: "errorServerMes") ?? "服务器异常,未确认错误信息")
            default:
                failureClosure?(moyaResponse.statusCode, self.error500Deal(response: "errorServerMes") ?? "服务器异常,未确认错误信息")
                break
            }
        case let .failure(error):
            print("error \(error)")
            failureClosure?(error.errorCode, error.errorDescription ?? "网络请求异常,请稍后重试!")
            break
        }
    }
    
    //MARK: - Deal info
    
    func success200Deal(response: [String : Any], targetName: String) -> Any{
        
        
        return response
    }
    
    func error400Deal(response: Any) -> String?{
        if let errorInfo:[String: Any] = response as? [String : Any]{
            
            return errorInfo["message"] as? String
        }else{
            
            return "error400Deal"
        }
    }
    
    func error403Deal(response: Any) -> String?{
        if let errorInfo:[String: Any] = response as? [String : Any]{
            
            return errorInfo["message"] as? String
        }else{
            
            return "error403Deal"
        }
    }
    
    func error500Deal(response: Any) -> String?{
        if let errorInfo:[String: Any] = response as? [String : Any]{
            
            return errorInfo["message"] as? String
        }else{
            
            return "error500Deal"
        }
    }
    
    func error502Deal(response: Any) -> String?{
        if let errorInfo:[String: Any] = response as? [String : Any]{
            
            return errorInfo["message"] as? String
        }else{
            
            return "error502Deal"
        }
    }
    func errorRequestDeal(response: Any) -> String{
        
        print("柯南 Deal errorRequestDeal info response success response - \(response)")
        
        return "errorRequestDeal"
    }
}

