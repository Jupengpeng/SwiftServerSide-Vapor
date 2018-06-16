//
//  ResponseJSON.swift
//  App
//
//  Created by 晋先森 on 2018/5/26.
//

import Vapor

struct ResponseJSON<T: Content>: Content {
    
    private var status: ResponseStatus
    private var message: String
    private var data: T?
    
    init(state status:ResponseStatus = .ok) {
        self.status = status
        self.message = status.desc
        self.data = nil
    }
    
    init(state status:ResponseStatus = .ok,
         message: String = ResponseStatus.ok.desc) {
        self.status = status
        self.message = message
        self.data = nil
    }
    
    init(state status:ResponseStatus = .ok,
         message: String = ResponseStatus.ok.desc,
         data: T?) {
        self.status = status
        self.message = message
        self.data = data
    }
}

extension ResponseJSON {
    

    
}


enum ResponseStatus:Int,Content {
    case ok = 0
    case error = -1
    case missesPara = -3
    case tokenInvalid = -4
    case unknown = 10
    
    var desc : String {
        switch self {
        case .ok:
            return "请求成功"
        case .error:
            return "请求失败"
        case .missesPara:
            return "缺少参数"
        case .tokenInvalid:
            return "Token 已失效，请重新登录"
        case .unknown:
            return "未知失败"
        }
    }
    
}










