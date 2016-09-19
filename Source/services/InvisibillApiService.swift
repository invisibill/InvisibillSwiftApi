//
//  InvisibillApiService.swift
//  InvisibillSwiftApi
//
//  Created by Kyle Thomas on 7/17/16.
//  Copyright © 2016 Invisibill. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import KTSwiftExtensions
import ObjectMapper

public class InvisibillApiService: KTApiService {

    private static let instance = InvisibillApiService()

    private let apiUrl = URL(string: "http://api.invisi-bill.com")!

    private var apiToken: String!

    public override class func sharedService() -> InvisibillApiService {
        return instance
    }

    private func buildRequestHeaders() -> [String : String] {
        var headers = [String : String]()
        if let apiToken = apiToken {
            headers["Authorization"] = "bearer \(apiToken)"
        }
        return headers
    }

    public func setApiToken(apiToken: String!) {
        self.apiToken = apiToken
    }

    override open func objectClassForPath(_ path: String) -> AnyClass? {
        var path = path
        let parts = path.characters.split(separator: "/").map { String($0) }
        if parts.count > 5 {
            path = [parts[3], parts[5]].joined(separator: "/")
            path = path.components(separatedBy: "/").last!
        } else if parts.count > 3 {
            path = [parts[1], parts[3]].joined(separator: "/")
            path = path.components(separatedBy: "/").last!
        } else {
            path = parts[1]
        }
        if path =~ "^(.*)s$" {
            path = path.substring(to: path.characters.index(before: path.endIndex))
        }

        return NSClassFromString("InvisibillSwiftApi.Invisibill\(path.capitalized)")
    }

    // MARK: Contracts

    public func listContracts(params: [String : AnyObject],
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/contracts", method: .get, parameters: params, headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func createContract(params: [String : AnyObject],
                               successHandler: KTApiSuccessHandler?,
                               failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/contracts",
                                        method: .post,
                                        parameters: params,
                                        headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    // MARK: Entities

    public func listEntities(params: [String : AnyObject],
                             successHandler: KTApiSuccessHandler?,
                             failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/entities", method: .get,  parameters: params, headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func createEntity(params: [String : AnyObject],
                             successHandler: KTApiSuccessHandler?,
                             failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/entities",
                                        method: .post,
                                        parameters: params,
                                        headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    // MARK: Locations

    public func listLocations(params: [String : AnyObject],
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/locations", method: .get,  parameters: params, headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    // MARK: Timecards

    public func listTimecards(successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        listTimecards(params: [:], successHandler: successHandler, failureHandler: failureHandler)
    }

    public func listTimecards(params: [String : AnyObject],
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/timecards", method: .get,  parameters: params, headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func fetchTimecard(id: String,
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/timecards/\(id)", method: .get, headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func createTimecardForResourceWithId(resourceId: String,
                                                params: [String : AnyObject],
                                                successHandler: KTApiSuccessHandler?,
                                                failureHandler: KTApiFailureHandler?) {
        var parameters = params
        parameters["resource_id"] = resourceId as AnyObject
        createTimecard(params: parameters, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func createTimecard(params: [String : AnyObject],
                               successHandler: KTApiSuccessHandler?,
                               failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/timecards",
                                        method: .post,
                                        parameters: params,
                                        headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func updateTimecardWithId(id: String,
                                     params: [String : AnyObject],
                                     successHandler: KTApiSuccessHandler?,
                                     failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/timecards/\(id)",
                                        method: .put,
                                        parameters: params,
                                        headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func deleteTimecardWithId(id: String,
                                     successHandler: KTApiSuccessHandler?,
                                     failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/timecards/\(id)",
                                        method: .delete,
                                        headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    // MARK: Invoices

    public func listInvoices(params: [String : AnyObject],
                             successHandler: KTApiSuccessHandler?,
                             failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/invoices", method: .get,  parameters: params, headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func createInvoice(params: [String : AnyObject],
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/invoices",
                                        method: .post,
                                        parameters: params,
                                        headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func updateInvoiceWithId(id: String,
                                     params: [String : AnyObject],
                                     successHandler: KTApiSuccessHandler?,
                                     failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/invoices/\(id)",
                                        method: .put,
                                        parameters: params,
                                        headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    // MARK: Resources

    public func listResources(params: [String : AnyObject],
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        let request: DataRequest = Alamofire.request("\(apiUrl)/api/resources", method: .get,  parameters: params, headers: buildRequestHeaders())
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }
}
