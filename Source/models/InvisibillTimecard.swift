//
//  InvisibillTimecard.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Kyle Thomas. All rights reserved.
//

import ObjectMapper

public class InvisibillTimecard: InvisibillModel {

    public var id: Int!
    public var taskCode: String!
    public var activityCode: String!
    public var narrative: String!
    public var startedAt: String!
    public var endedAt: String!

    public override func mapping(map: Map) {
        id <- map["id"]
        taskCode <- map["task_code"]
        activityCode <- map["activity_code"]
        narrative <- map["narrative"]
        startedAt <- map["started_at"]
        endedAt <- map["ended_at"]
    }
}
