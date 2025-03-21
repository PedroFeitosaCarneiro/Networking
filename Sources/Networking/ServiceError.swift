//
//  ServiceError.swift
//  Networking
//
//  Created by Pedro Feitosa on 21/03/25.
//

import Foundation

struct ServiceError: Error,Codable {
    let httpStatus : Int
    let message: String
}
