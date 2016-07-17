//
//  InvisibillResource.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Kyle Thomas. All rights reserved.
//

import ObjectMapper

public class InvisibillResource: InvisibillModel {

    var id: Int!
    var contract: InvisibillContract!
    var timecards: Set<InvisibillTimecard>!
    var invoices: Set<InvisibillInvoice>!
    var billRate: Double!

    public override func mapping(map: Map) {
        id <- map["id"]
        contract <- map["contract"]
        timecards <- map["timecards"]
        invoices <- map["invoices"]
        billRate <- map["bill_rate"]
    }
}
