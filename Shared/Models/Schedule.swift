//
//  Schedule.swift
//  Homeworkr IV
//
//  Created by Nicolas Legros on 2021-02-19.
//

import Foundation
import CoreData

public class Schedule: NSObject,  NSCoding  {
    
    public var days: [String]
    public var times: [String]
    enum Key:String {
        case days = "days"
        case times = "times"
    }
    
    init(days: [String], times: [String]) {
        self.times = times
        self.days = days
    }
    
    override init() {
        self.times = [""]
        self.days = [""]
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(days, forKey: Key.days.rawValue)
        coder.encode(times, forKey: Key.times.rawValue)
    }
    
    public required convenience init?(coder: NSCoder) {
        let mDays = coder.decodeObject(forKey: Key.days.rawValue) as! [String]
        let mTimes = coder.decodeObject(forKey: Key.times.rawValue) as! [String]
        self.init(days: mDays, times: mTimes)
    }
    


}
