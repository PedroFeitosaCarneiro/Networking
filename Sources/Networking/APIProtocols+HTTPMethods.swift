//
//  APIProtocols+HTTPMethods.swift
//  Networking
//
//  Created by Pedro Feitosa on 21/03/25.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case head = "HEAD"
    case connect = "CONNECT"
    case options = "OPTIONS"
    case trace = "TRACE"
    case patch = "PATCH"
}


public protocol RequestHandler {
    associatedtype RequestDataType
    func buildRequest(from data: RequestDataType) -> URLRequest?
}

public protocol ResponseHandler {
    associatedtype ResponseDataType
    func parseResponse(data: Data, reponse: HTTPURLResponse) throws -> ResponseDataType?
}
