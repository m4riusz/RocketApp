//
//  IBaseRequest.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation
import Alamofire

protocol IBaseRequest: NSObjectProtocol {
    var url: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get set }
    var headers: [String: String] { get set }
    
    func execute<T: Codable>(_ request: IBaseRequest, gateway: @escaping Gateway<T>)
}

extension IBaseRequest {
    func execute<T>(_ request: IBaseRequest, gateway: @escaping Gateway<T>) {
        HttpManager.shared.proceed(self) { (result) in
            switch result {
            case .proceed(let interceptedRequest):
                self.proceedRequest(interceptedRequest, gateway: gateway)
            case .cancel:
                print("Canceled request!")
            }
        }
    }
    
    fileprivate func proceedRequest<T>(_ request: IBaseRequest, gateway: @escaping Gateway<T>) {
        Alamofire.request(request.url, method: request.method, parameters: request.parameters, encoding: URLEncoding.default, headers: request.headers).responseData { (response) in
            self.handleResponse(response, request, gateway: gateway)
        }
    }
    
    fileprivate func handleResponse<T>(_ response: DataResponse<Data>, _ request: IBaseRequest, gateway: @escaping Gateway<T>) {
        let baseResponse = self.buildResponse(request: request, response: response)
        HttpManager.shared.proceed(baseResponse) { (result) in
            switch result {
            case .proceed(_):
                self.proceedResponse(response, gateway: gateway)
            case .cancel:
                print("Canceled response!")
            }
        }
    }
    
    fileprivate func proceedResponse<T>(_ response: DataResponse<Data>, gateway: @escaping Gateway<T>) {
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
    
    fileprivate func buildResponse(request: IBaseRequest, response: DataResponse<Data>) -> IBaseResponse {
        let headers = response.response?.allHeaderFields as? [String: String] ?? [:]
        return BaseResponse(url: request.url,
                            method: request.method,
                            headers: headers,
                            httpCode: response.response?.statusCode ?? -1,
                            body: String(data: response.data ?? "No response data".data(using: .utf8)!, encoding: .utf8))
    }
}
