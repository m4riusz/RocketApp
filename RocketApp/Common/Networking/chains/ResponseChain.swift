//
//  ResponseChain.swift
//  RocketApp
//
//  Created by Mariusz Sut on 20/12/2018.
//

import Foundation

typealias ResponseChainGateway = (_ result: ChainResult<IBaseResponse>)-> Void

class ResponseChain {
    fileprivate var interceptors: [IResponseInterceptor] = []
    
    func setInterceptors(_ interceptors: [IResponseInterceptor]) {
        self.interceptors = interceptors
    }
    
    func intercept(response: IBaseResponse, gateway: @escaping ResponseChainGateway) {
        self.intercept(index: 0, response: response, gateway: gateway)
    }
    
    fileprivate func intercept(index: Int, response: IBaseResponse, gateway: @escaping ResponseChainGateway) {
        guard index >= 0 && index < self.interceptors.count else {
            gateway(.proceed(response))
            return
        }
        let interceptor = self.interceptors[index]
        interceptor.intercept(response) { (result) in
            switch result {
            case .proceed(let res):
                self.intercept(index: index + 1, response: res, gateway: gateway)
            case .cancel:
                gateway(.cancel)
            }
        }
    }
}

