//
//  Date.swift
//  taskIt
//
//  Created by Andrew Morrison on 2016-03-20.
//  Copyright © 2016 Andrew Morrison. All rights reserved.
//

import Foundation


class Date {

    class func from(year:Int, month:Int, day:Int) -> NSDate {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
    }
    
    class func toString(date:NSDate) -> String {
        
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateStringFormatter.stringFromDate(date)
        
        
        return dateString
    }
    
}