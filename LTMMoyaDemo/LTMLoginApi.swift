//
//  LTMLoginApi.swift
//  LTMMoyaDemo
//
//  Created by 柯南 on 2020/5/6.
//  Copyright © 2020 LTM. All rights reserved.
//

import Moya

enum LTMMoyaLoginApiService {
    /**
     登录
     
     - parameter phone 手机号
     */
    case login(phone: String)
    
    /**
     退出登录
     
     */
    case logout
}

extension LTMMoyaLoginApiService: TargetType{
    var baseURL: URL {// 不同的CDN服务不同的配置,即可
        return URL(string: "loginHost")!
    }
    
    var path: String {
        switch self {
        case .login(phone: _):
            return "api_not_found"
        case .logout:
            return "api_not_found"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .logout:
            return .get
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
           return "内容省略...".data(using: .utf8)!
        }
    }
    
    var param:[String: Any] {
        var param:[String: Any] = [:]
        switch self {
        case .login(phone: let phone):
            param.updateValue(phone, forKey: "phone")
        case .logout:
            break
        }
        
        return param
    }
    
    var task: Task {
        switch self {
        case .login:
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        default:
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        var headerDic: [String : String] = [:]
        headerDic.updateValue("application/json", forKey: "Content-Type")
        return headerDic
    }
}

