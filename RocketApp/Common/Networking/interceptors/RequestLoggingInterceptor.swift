//
//  RequestLoggingInterceptor.swift
//  RocketApp
//
//  Created by Mariusz Sut on 11/11/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import Foundation

class RequestLoggingInterceptor: NSObject, IRequestInterceptor {
    func intercept(_ request: IBaseRequest, chain: @escaping RequestChainGateway) {
        print("\nREQUEST: \n\t\(String.init(describing: request.self))")
        print("URL: \n\t\(request.url)")
        print("HEADERS: ")
        request.headers.forEach { print("\t\($0) : \($1)")}
        print("PARAMS: ")
        request.parameters.forEach { print("\t\($0) : \(String.init(describing: $1))\n")}
        print("")
        chain(.proceed(request))
    }
}
