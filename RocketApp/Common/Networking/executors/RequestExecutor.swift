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
        Alamofire.request(request.url, method: request.method, parameters: request.parameters, encoding: URLEncoding.default, headers: request.headers).responseData { (response) in
            let baseResponse = self.buildResponse(request: request, response: response)
            HttpManager.shared.getResponseInterceptors().forEach { $0.intercept(baseResponse) }
            switch response.result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(T.self, from: value)
                    gateway(.success(decodedData))
                } catch let error as NSError {
                    gateway(.failure(error))
                }
            case .failure(let error as NSError):
                gateway(.failure(error))
            }
        }
    }

    fileprivate func buildResponse(request: IBaseRequest, response: DataResponse<Data>) -> IBaseResponse {
        let headers = response.response?.allHeaderFields as? [String: String] ?? [:]
        return BaseResponse(url: request.url,
                            method: request.method,
                            headers: headers,
                            httpCode: response.response?.statusCode ?? -1,
                            body: String(data: response.data ?? "No response data".data(using: .utf8)!, encoding: .utf8))
    }
}
