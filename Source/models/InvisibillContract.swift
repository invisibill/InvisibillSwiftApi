//
//  InvisibillContract.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Kyle Thomas. All rights reserved.
//

import ObjectMapper

public class InvisibillContract: InvisibillModel {

    var id: Int!
    var resources: Set<InvisibillResource>!
    var sourceEntity: InvisibillEntity!
    var targetEntity: InvisibillEntity!

    public override func mapping(map: Map) {
        id <- map["id"]
        resources <- map["resources"]
        sourceEntity <- map["source_entity"]
        targetEntity <- map["target_entity"]
    }
}
