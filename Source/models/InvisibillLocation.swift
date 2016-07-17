//
//  InvisibillLocation.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Kyle Thomas. All rights reserved.
//

import ObjectMapper

public class InvisibillLocation: InvisibillModel {

    public var id: String!
    public var name: String!
    public var address1: String!
    public var address2: String!
    public var city: String!
    public var state: String!
    public var zip: String!
    public var country: String!
    public var latitude: Double!
    public var longitude: Double!

    public override func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        address1 <- map["address1"]
        address2 <- map["address2"]
        city <- map["city"]
        state <- map["state"]
        zip <- map["zip"]
        country <- map["country"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
