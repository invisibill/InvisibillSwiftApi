//
//  InvisibillEntity.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Kyle Thomas. All rights reserved.
//

import ObjectMapper

public class InvisibillEntity: InvisibillModel {

    var id: Int!
    var name: String!
    var locations: Set<InvisibillLocation>!

    public override func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        locations <- map["locatiomns"]
    }
}
