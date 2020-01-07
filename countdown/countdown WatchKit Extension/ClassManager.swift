//
//  ClassManager.swift
//  countdown WatchKit Extension
//
//  Created by Andrew Finke on 1/7/20.
//  Copyright © 2020 Andrew Finke. All rights reserved.
//

import Foundation

struct ClassManager {
    
    // MARK: - Properties -
    
    private static let dayOffset: TimeInterval = 86400
    private static let weekOffset: TimeInterval = ClassManager.dayOffset * 7
    
    // MARK: - Helpers -
    
    static func upcomingClasses() -> [Class] {
        var classes = [Class]()
        for week in 0...10 {
            let weekOffset = ClassManager.weekOffset * TimeInterval(week)
            
            let mlClassMonStart = Course.ml.start.addingTimeInterval(weekOffset)
            let mlClassMon = Class(.ml, start: mlClassMonStart)
            let mlClassWed = mlClassMon.duplicate(offset: ClassManager.dayOffset * 2)
            
            let algoClassTuesStart = Course.algo.start.addingTimeInterval(weekOffset)
            let algoClassTues = Class(.algo, start: algoClassTuesStart)
            let algoClassThurs = algoClassTues.duplicate(offset: ClassManager.dayOffset * 2)
          
            let networksClassTuesStart = Course.net.start.addingTimeInterval(weekOffset)
            let networksClassTues = Class(.net, start: networksClassTuesStart)
            let networksClassThurs = networksClassTues.duplicate(offset: ClassManager.dayOffset * 2)

            let physicsClassStart = Course.physics.start.addingTimeInterval(weekOffset)
            let physicsClass = Class(.physics, start: physicsClassStart)
            
            let newClasses = [
                mlClassMon,
                mlClassWed,
                algoClassTues,
                algoClassThurs,
                networksClassTues,
                networksClassThurs,
                physicsClass
            ]
            classes.append(contentsOf: newClasses)
        }
        
        return classes.filter { $0.end.timeIntervalSinceNow > 0 }
            .sorted { $0.start < $1.start }
    }
}
