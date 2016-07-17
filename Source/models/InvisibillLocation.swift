//
//  InvisibillLocation.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Kyle Thomas. All rights reserved.
//

import ObjectMapper

public class InvisibillLocation: InvisibillModel {

    var id: Int!
    var name: String!
    var address1: String!
    var address2: String!
    var city: String!
    var state: String!
    var zip: String!
    var country: String!
    var latitude: Double!
    var longitude: Double!

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
