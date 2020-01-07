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
            let mlClassMonStart = Course.ml.start.addingTimeInterval(ClassManager.weekOffset * TimeInterval(week))
            let mlClassMon = Class(.ml, start: mlClassMonStart)
            let mlClassWed = mlClassMon.duplicate(offset: ClassManager.dayOffset * 2)
            
            let algoClassTuesStart = Course.algo.start.addingTimeInterval(ClassManager.weekOffset * TimeInterval(week))
            let algoClassTues = Class(.algo, start: algoClassTuesStart)
            let algoClassThurs = algoClassTues.duplicate(offset: ClassManager.dayOffset * 2)
          
            let networksClassTuesStart = Course.net.start.addingTimeInterval(ClassManager.weekOffset * TimeInterval(week))
            let networksClassTues = Class(.net, start: networksClassTuesStart)
            let networksClassThurs = networksClassTues.duplicate(offset: ClassManager.dayOffset * 2)


            let physicsClassStart = Course.physics.start.addingTimeInterval(ClassManager.weekOffset * TimeInterval(week))
            let physicsClass = Class(.physics, start: physicsClassStart)
            
            classes.append(contentsOf:
                [mlClassMon,
                 mlClassWed,
                 algoClassTues,
                 algoClassThurs,
                 networksClassTues,
                 networksClassThurs,
                 physicsClass
            ])
        }
        
        return classes.filter { $0.end.timeIntervalSinceNow > 0 }
            .sorted { $0.start < $1.start }
    }
}
