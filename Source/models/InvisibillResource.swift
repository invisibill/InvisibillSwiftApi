//
//  InvisibillResource.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Kyle Thomas. All rights reserved.
//

import ObjectMapper

public class InvisibillResource: InvisibillModel {

    public var id: Int!
    public var contract: InvisibillContract!
    public var timecards: Set<InvisibillTimecard>!
    public var invoices: Set<InvisibillInvoice>!
    public var billRate: Double!

    public override func mapping(map: Map) {
        id <- map["id"]
        contract <- map["contract"]
        timecards <- map["timecards"]
        invoices <- map["invoices"]
        billRate <- map["bill_rate"]
    }
}
