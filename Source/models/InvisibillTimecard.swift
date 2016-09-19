//
//  InvisibillTimecard.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Kyle Thomas. All rights reserved.
//

import ObjectMapper

public class InvisibillTimecard: InvisibillModel {

    public var id: String!
    public var taskCode: String!
    public var activityCode: String!
    public var narrative: String!
    public var startedAt: String!
    public var endedAt: String!
    public var humanReadableDuration: String!
    public var resourceId: String!
    public var invoiceId: String!
    public var billableAmount = 0.0
    public var durationHours: Double!

    public override func mapping(map: Map) {
        id <- map["id"]
        taskCode <- map["task_code"]
        activityCode <- map["activity_code"]
        narrative <- map["narrative"]
        startedAt <- map["started_at"]
        endedAt <- map["ended_at"]
        humanReadableDuration <- map["human_readable_duration"]
        resourceId <- map["resource_id"]
        invoiceId <- map["invoice_id"]
        billableAmount <- map["billable_amount"]
        durationHours <- map["duration_hours"]
    }

    public var startedAtDate: Date! {
        if let startedAt = startedAt {
            if let startedAtDate = Date.fromString(startedAt) {
                return startedAtDate
            }
        }
        return nil
    }

    public var endedAtDate: Date! {
        if let endedAt = endedAt {
            if let endedAtDate = Date.fromString(endedAt) {
                return endedAtDate
            }
        }
        return nil
    }

    public var duration: String! {
        if let humanReadableDuration = humanReadableDuration {
            return humanReadableDuration
        }

        let endedAtDate: Date! = self.endedAtDate ?? Date()

        if startedAtDate != nil && endedAtDate != nil {
            var remaining = endedAtDate.timeIntervalSince1970 - startedAtDate.timeIntervalSince1970

            let days = floor(remaining / 86400)
            remaining = remaining.truncatingRemainder(dividingBy: 86400)
            let hours = floor(remaining / 3600)
            remaining = remaining.truncatingRemainder(dividingBy: 3600)
            let minutes = floor(remaining / 60)
            remaining = remaining.truncatingRemainder(dividingBy: 60)
            if days > 0 {
                return "\(days)d \(hours)h \(minutes)m"
            }
            return "\(hours)h \(minutes)m"
        }

        return nil
    }
}
