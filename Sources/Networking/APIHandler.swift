//
//  APIHandler.swift
//  Networking
//
//  Created by Pedro Feitosa on 21/03/25.
//

import Foundation

public typealias APIHandler = RequestHandler & ResponseHandler & Sendable


public extension RequestHandler {
    func setQueryParameters(params: KeyValuePairs<Any,Any>, url: URL) -> URL {
        
        var components: URLComponents? = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = params.map { element in URLQueryItem(name: element.key as? String ?? "",
                                                                      value: String(describing: element.value))}
        
        return components?.url ?? url
    }
}
