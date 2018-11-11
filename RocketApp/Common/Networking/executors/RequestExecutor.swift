//
//  RequestExecutor.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation
import Alamofire

class RequestExecutor: NSObject, IRequestExecutor {
    
    func execute<T>(_ request: IBaseRequest, gateway: @escaping BaseGateway<T>) {
        
        HttpManager.shared.getRequestInterceptors().forEach { $0.intercept(request) }
        Alamofire.request(request.url, method: request.method, parameters: request.parameters, encoding: URLEncoding.default, headers: request.headers).responseJSON { (response) in
            let baseResponse = self.buildResponse(request: request, response: response)
            HttpManager.shared.getResponseInterceptors().forEach { $0.intercept(baseResponse) }
            guard response.error == nil else {
                gateway(.failure(response.error! as NSError))
                return
            }
            guard let data = response.data as? T else {
                gateway(.failure(NSError("Unable to parse data to expected type!")))
                return
            }
            gateway(.success(data))
        }
    }
    
    fileprivate func buildResponse(request: IBaseRequest, response: DataResponse<Any>) -> IBaseResponse {
        let headers = response.response?.allHeaderFields as? [String: String] ?? [:]
        return BaseResponse(url: request.url,
                            method: request.method,
                            headers: headers,
                            httpCode: response.response?.statusCode ?? -1,
                            body: response.data?.toString())
    }
}
