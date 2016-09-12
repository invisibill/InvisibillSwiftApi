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

    private let apiUrl = NSURL("http://api.invisi-bill.com")

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

    public override func objectClassForPath(path: String) -> AnyClass? {
        var path = path
        let parts = path.characters.split("/").map { String($0) }
        if parts.count > 5 {
            path = [parts[3], parts[5]].joinWithSeparator("/")
            path = path.componentsSeparatedByString("/").last!
        } else if parts.count > 3 {
            path = [parts[1], parts[3]].joinWithSeparator("/")
            path = path.componentsSeparatedByString("/").last!
        } else {
            path = parts[1]
        }
        if path =~ "^(.*)s$" {
            path = path.substringToIndex(path.endIndex.predecessor())
        }

        return NSClassFromString("InvisibillSwiftApi.Invisibill\(path.capitalizedString)")
    }

    // MARK: Contracts

    public func listContracts(params: [String : AnyObject],
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        execute(Alamofire.request(.GET, "\(apiUrl)/api/contracts", headers: buildRequestHeaders(), parameters: params),
            successHandler: successHandler,
            failureHandler: failureHandler)
    }

    public func createContract(params: [String : AnyObject],
                               successHandler: KTApiSuccessHandler?,
                               failureHandler: KTApiFailureHandler?) {
        let request = Alamofire.request(.POST, "\(apiUrl)/api/contracts",
                                        headers: buildRequestHeaders(),
                                        parameters: params,
                                        encoding: .JSON)
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    // MARK: Entities

    public func listEntities(params: [String : AnyObject],
                             successHandler: KTApiSuccessHandler?,
                             failureHandler: KTApiFailureHandler?) {
        execute(Alamofire.request(.GET, "\(apiUrl)/api/entities", headers: buildRequestHeaders(), parameters: params),
                successHandler: successHandler,
                failureHandler: failureHandler)
    }

    public func createEntity(params: [String : AnyObject],
                             successHandler: KTApiSuccessHandler?,
                             failureHandler: KTApiFailureHandler?) {
        let request = Alamofire.request(.POST, "\(apiUrl)/api/entities",
                                        headers: buildRequestHeaders(),
                                        parameters: params,
                                        encoding: .JSON)
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    // MARK: Locations

    public func listLocations(params: [String : AnyObject],
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        execute(Alamofire.request(.GET, "\(apiUrl)/api/locations", headers: buildRequestHeaders(), parameters: params),
            successHandler: successHandler,
            failureHandler: failureHandler)
    }

    // MARK: Timecards

    public func listTimecards(successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        listTimecards([:], successHandler: successHandler, failureHandler: failureHandler)
    }

    public func listTimecards(params: [String : AnyObject],
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        execute(Alamofire.request(.GET, "\(apiUrl)/api/timecards", headers: buildRequestHeaders(), parameters: params),
            successHandler: successHandler,
            failureHandler: failureHandler)
    }

    public func createTimecardForResourceWithId(resourceId: String,
                                                params: [String : AnyObject],
                                                successHandler: KTApiSuccessHandler?,
                                                failureHandler: KTApiFailureHandler?) {
        var parameters = params
        parameters["resource_id"] = resourceId
        createTimecard(parameters, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func createTimecard(params: [String : AnyObject],
                               successHandler: KTApiSuccessHandler?,
                               failureHandler: KTApiFailureHandler?) {
        let request = Alamofire.request(.POST, "\(apiUrl)/api/timecards",
                                        headers: buildRequestHeaders(),
                                        parameters: params,
                                        encoding: .JSON)
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func updateTimecardWithId(id: String,
                                     params: [String : AnyObject],
                                     successHandler: KTApiSuccessHandler?,
                                     failureHandler: KTApiFailureHandler?) {
        let request = Alamofire.request(.PUT, "\(apiUrl)/api/timecards/\(id)",
                                        headers: buildRequestHeaders(),
                                        parameters: params,
                                        encoding: .JSON)
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func deleteTimecardWithId(id: String,
                                     successHandler: KTApiSuccessHandler?,
                                     failureHandler: KTApiFailureHandler?) {
        let request = Alamofire.request(.DELETE, "\(apiUrl)/api/timecards/\(id)",
                                        headers: buildRequestHeaders(),
                                        encoding: .JSON)
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    // MARK: Invoices

    public func listInvoices(params: [String : AnyObject],
                             successHandler: KTApiSuccessHandler?,
                             failureHandler: KTApiFailureHandler?) {
        execute(Alamofire.request(.GET, "\(apiUrl)/api/invoices", headers: buildRequestHeaders(), parameters: params),
                successHandler: successHandler, failureHandler: failureHandler)
    }

    public func createInvoice(params: [String : AnyObject],
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        let request = Alamofire.request(.POST, "\(apiUrl)/api/invoices",
                                        headers: buildRequestHeaders(),
                                        parameters: params,
                                        encoding: .JSON)
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    public func updateInvoiceWithId(id: String,
                                     params: [String : AnyObject],
                                     successHandler: KTApiSuccessHandler?,
                                     failureHandler: KTApiFailureHandler?) {
        let request = Alamofire.request(.PUT, "\(apiUrl)/api/invoices/\(id)",
                                        headers: buildRequestHeaders(),
                                        parameters: params,
                                        encoding: .JSON)
        execute(request, successHandler: successHandler, failureHandler: failureHandler)
    }

    // MARK: Resources

    public func listResources(params: [String : AnyObject],
                              successHandler: KTApiSuccessHandler?,
                              failureHandler: KTApiFailureHandler?) {
        execute(Alamofire.request(.GET, "\(apiUrl)/api/resources", headers: buildRequestHeaders(), parameters: params),
                successHandler: successHandler, failureHandler: failureHandler)
    }
}
