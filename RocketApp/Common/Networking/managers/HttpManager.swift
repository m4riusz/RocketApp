//
//  HttpManager.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

enum ChainResult<T> {
    case proceed(T)
    case cancel
}

class HttpManager: NSObject {
    static let shared: HttpManager = HttpManager()
    fileprivate var requestChain: RequestChain = RequestChain()
    fileprivate var responseChain: ResponseChain = ResponseChain()
    
    fileprivate override init() {}
    
    func setRequestInterceptors(_ interceptors: [IRequestInterceptor]) {
        self.requestChain.setInterceptors(interceptors)
    }
    
    func setResponseInterceptors(_ interceptors: [IResponseInterceptor]) {
        self.responseChain.setInterceptors(interceptors)
    }
    
    func proceed(_ request: IBaseRequest, gateway: @escaping RequestChainGateway) {
        self.requestChain.intercept(request: request, gateway: gateway)
    }
    
    func proceed(_ response: IBaseResponse, gateway: @escaping ResponseChainGateway) {
        self.responseChain.intercept(response: response, gateway: gateway)
    }
}

protocol IRequestInterceptor: NSObjectProtocol {
    func intercept(_ request: IBaseRequest, chain: @escaping RequestChainGateway)
}

protocol IResponseInterceptor: NSObjectProtocol {
    func intercept(_ response: IBaseResponse, chain: @escaping ResponseChainGateway)
}
