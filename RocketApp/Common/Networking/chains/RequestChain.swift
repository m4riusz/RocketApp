//
//  RequestChain.swift
//  RocketApp
//
//  Created by Mariusz Sut on 20/12/2018.
//

import Foundation

typealias RequestChainGateway = (_ result: ChainResult<IBaseRequest>)-> Void

class RequestChain {
    fileprivate var interceptors: [IRequestInterceptor] = []
    
    func setInterceptors(_ interceptors: [IRequestInterceptor]) {
        self.interceptors = interceptors
    }
    
    func intercept(request: IBaseRequest, gateway: @escaping RequestChainGateway) {
        self.intercept(index: 0, request: request, gateway: gateway)
    }
    
    fileprivate func intercept(index: Int, request: IBaseRequest, gateway: @escaping RequestChainGateway) {
        guard index >= 0 && index < self.interceptors.count else {
            gateway(.proceed(request))
            return
        }
        let interceptor = self.interceptors[index]
        interceptor.intercept(request) { (result) in
            switch result {
            case .proceed(let req):
                self.intercept(index: index + 1, request: req, gateway: gateway)
            case .cancel:
                gateway(.cancel)
            }
        }
    }
}
