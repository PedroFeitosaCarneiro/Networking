//
//  APIHandler+Extensions.swift
//  Networking
//
//  Created by Pedro Feitosa on 21/03/25.
//
import Foundation

extension ResponseHandler {
    
    public func defaultParseResponse<T: Codable>(data: Data, response: HTTPURLResponse) throws -> T{
        let decoder = JSONDecoder()
        do {
            let body = try decoder.decode(T.self, from: data)
            if response.statusCode == 200 {
                return body
            } else {
                throw ServiceError(httpStatus: response.statusCode, message: "Erro desconhecido")
            }
        } catch  {
            throw ServiceError(httpStatus: response.statusCode, message: error.localizedDescription)
        }
    }
}
