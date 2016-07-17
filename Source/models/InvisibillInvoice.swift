//
//  InvisibillInvoice.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Kyle Thomas. All rights reserved.
//

import ObjectMapper

public class InvisibillInvoice: InvisibillModel {

    public var id: Int!
    public var resource: InvisibillResource!
    public var billableHours: Double!
    public var paid = false
    public var pending = false

    public override func mapping(map: Map) {
        id <- map["id"]
        resource <- map["resource"]
        billableHours <- map["billable_hours"]
        paid <- map["paid"]
        pending <- map["pending"]
    }
}
