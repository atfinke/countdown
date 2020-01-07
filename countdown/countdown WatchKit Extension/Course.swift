//
//  Course.swift
//  countdown WatchKit Extension
//
//  Created by Andrew Finke on 1/7/20.
//  Copyright © 2020 Andrew Finke. All rights reserved.
//

import Foundation

enum Course {
    
    // MARK: - Cases -
    
    case ml, algo, net, physics
    
    // MARK: - Properties -
    
    var duration: TimeInterval {
        switch self {
        case .ml:
            return 80
        case .algo:
            return 80
        case .net:
            return 80
        case .physics:
            return 150
        }
    }
    
    var start: Date {
        switch self {
        case .ml:
            return Date(timeIntervalSince1970: 1578346200)
        case .algo:
            return Date(timeIntervalSince1970: 1578416400)
        case .net:
            return Date(timeIntervalSince1970: 1578421800)
        case .physics:
            return Date(timeIntervalSince1970: 1578506400)
        }
    }
}
