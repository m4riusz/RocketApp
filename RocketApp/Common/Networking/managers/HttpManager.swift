//
//  HttpManager.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

class HttpManager: NSObject {
    static let shared: HttpManager = HttpManager()
    fileprivate var requestInterceptors: [IRequestInterceptor] = []
    fileprivate var responseInterceptors: [IResponseInterceptor] = []
    
    fileprivate override init() {}
    
    func setRequestInterceptors(_ interceptors: [IRequestInterceptor]) {
        self.requestInterceptors = interceptors
    }
    
    func setResponseInterceptors(_ interceptors: [IResponseInterceptor]) {
        self.responseInterceptors = interceptors
    }
    
    func getRequestInterceptors() -> [IRequestInterceptor] {
        return self.requestInterceptors
    }
    
    func getResponseInterceptors() -> [IResponseInterceptor] {
        return self.responseInterceptors
    }
}

protocol IRequestInterceptor: NSObjectProtocol {
    func intercept(_ request: IBaseRequest)
}

protocol IResponseInterceptor: NSObjectProtocol {
    func intercept(_ response: IBaseResponse)
}
