//
//  InvisibillInvoice.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Kyle Thomas. All rights reserved.
//

import ObjectMapper

public class InvisibillInvoice: InvisibillModel {

    public var id: String!
    public var resource: InvisibillResource!
    public var billAmount = 0.0
    public var billableHours: Double!
    public var paid = false
    public var pending = false
    public var periodStartingAt: String!
    public var periodEndingAt: String!
    public var timecards: Set<InvisibillTimecard>!

    public override func mapping(map: Map) {
        id <- map["id"]
        resource <- map["resource"]
        billAmount <- map["bill_amount"]
        billableHours <- map["billable_hours"]
        paid <- map["paid"]
        pending <- map["pending"]
        periodStartingAt <- map["period_starting_at"]
        periodEndingAt <- map["period_ending_at"]
        timecards <- map["timecards"]
    }
}
