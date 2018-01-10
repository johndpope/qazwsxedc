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
    case getGasInfo()
    case getWalletBalance(address: String)
    case getTransactionsCount(address: String)
    case signTransaction(hex: String)
    case listOfTransaction(address: String)
    case getTokens(address:String)
    case getEthereumCurrency()
    case getBitcoinCurrency()
    
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
        case .getEthereumCurrency:
            return .get
        case .getBitcoinCurrency:
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
        case .getEthereumCurrency:
            return "/api/v1.0/stat/ETH-USD"
        case .getBitcoinCurrency:
            return "/api/v1.0/stat/BTC-USD"
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
        case .getEthereumCurrency():
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .getBitcoinCurrency():
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        default:
            break
        }
        
        return urlRequest
    }
    
}
