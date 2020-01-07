//
//  ComplicationController.swift
//  countdown WatchKit Extension
//
//  Created by Andrew Finke on 1/7/20.
//  Copyright © 2020 Andrew Finke. All rights reserved.
//

import ClockKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        print(#function)
        guard let currentClass = ClassManager.upcomingClasses().first,
        currentClass.course.start.timeIntervalSinceNow < 0 else {
            handler(nil)
            return
        }
        
        let template = CLKComplicationTemplateUtilitarianLargeFlat()
        let dateProvider = CLKRelativeDateTextProvider(date: currentClass.end,
                                                       style: .timer,
                                                       units: [.hour, .minute, .second])
        let course = "\(currentClass.course)"
        template.textProvider = CLKTextProvider(format: "%@: %@", course, dateProvider)
        let entry = CLKComplicationTimelineEntry(date: currentClass.start, complicationTemplate: template)
        handler(entry)
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        print(#function)
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        print(#function)
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(nil)
    }
    
}
