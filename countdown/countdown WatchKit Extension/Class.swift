//
//  Class.swift
//  countdown WatchKit Extension
//
//  Created by Andrew Finke on 1/7/20.
//  Copyright © 2020 Andrew Finke. All rights reserved.
//

import Foundation

struct Class {
    
    // MARK: - Properties -
    
    let course: Course
    let start: Date
    let end: Date
    
    // MARK: - Initalization -
    
    init(_ course: Course, start: Date) {
        self.course = course
        self.start = start
        self.end = start.addingTimeInterval(course.duration * 60)
    }
    
    // MARK: - Helpers -
    
    func duplicate(offset: TimeInterval) -> Class {
        return Class(course,
                     start: start.addingTimeInterval(offset))
    }
}
