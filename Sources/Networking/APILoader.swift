//
//  APILoader.swift
//  Networking
//
//  Created by Pedro Feitosa on 21/03/25.
//

import Foundation

public final class APILoader<T: APIHandler> {
    
    private let apiRequest: T
    
    public init(apiRequest: T) {
        self.apiRequest = apiRequest
    }
    
    @Sendable
    public func loadAPIRequest(requestData: T.RequestDataType,
                               completionHandler: @Sendable @escaping (T.ResponseDataType?, Error?) -> Void){
        if let urlRequest = apiRequest.buildRequest(from: requestData){
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, let response = response as? HTTPURLResponse else {
                    return completionHandler(nil, error)
                }
                do {
                    let parsedResponse = try self.apiRequest.parseResponse(data: data, reponse: response)
                    completionHandler(parsedResponse,nil)
                } catch {
                    completionHandler(nil,error)
                }
            }.resume()
        }
    }
    
}

extension APILoader: Sendable { }
