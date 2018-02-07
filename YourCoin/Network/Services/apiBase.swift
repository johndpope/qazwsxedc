//
//  apiBase.swift
//  YourCoin
//
//  Created by Juden on 1/10/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import Alamofire

enum Router:URLRequestConvertible {
    case getGasInfo() // r
    case getWalletBalance(address: String)
    case getTransactionsCount(address: String) // r
    case signTransaction(hex: String)
    case listOfTransaction(address: String)
    case getTokens(address:String)
    case getTransactionByHash(hash:String)
    case getCryptoCurrency(left_value: String)
    case signUp(parameters: Parameters)
    case signIn(parameters: Parameters)
    
    static let baseURL = "http://194.71.227.15/api/v4.0/"
    
    var method: HTTPMethod {
        switch self {
        case .getGasInfo:
            return .get
        case .getWalletBalance:
            return .get
        case .getTransactionsCount:
            return .get
        case .signTransaction:
            return .get
        case .listOfTransaction:
            return .get
        case .getTokens:
            return .get
        case .getCryptoCurrency:
            return .get
        case .signUp:
            return .post
        case .signIn:
            return .post
        case .getTransactionByHash:
            return .get
        default:
            break
        }
    }
    
    var path: String {
        switch self {
        case .getGasInfo:
            return "/ETH/getPriceLimit/"
        case .getWalletBalance(let address):
            return "/ETH/getBalance/\(address)"
        case .getTransactionsCount(let address):
            return "/ETH/getTransactionCount/\(address)"
        case .signTransaction(let hex):
            return "/ETH/signTransaction/\(hex)"
        case .listOfTransaction(let address):
            return "/ETH/getTransactionsList/\(address)"
        case .getTokens(let address):
            return "/ETH/getTokenBalance/\(address)"
        case .getCryptoCurrency(let left_value):
            return "/api/v1.0/stat/\(left_value)-USD"
        case .getTransactionByHash(let hash):
            return "/ETH/getTransactionByHash/\(hash)"
        case .signIn:
            return ""
        case .signUp:
            return ""
        default:
            break
        }
    }
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getGasInfo():
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .getWalletBalance(_):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .getTransactionsCount(_):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .signTransaction(_):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .listOfTransaction(_):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .getTokens(_):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .getCryptoCurrency(_):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .getTransactionByHash(_):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .signIn(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .signUp(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        
        return urlRequest
    }
    
}
