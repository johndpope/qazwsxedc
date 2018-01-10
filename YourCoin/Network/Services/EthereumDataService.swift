//
//  EthereumDataService.swift
//  YourCoin
//
//  Created by Juden on 1/9/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation

public class EthereumDataService {
    
    // TODO: Get current account from Wallet Session
    
    func GetNonce(address: String) {
        Alamofire.request(Router.GetNonce(address)).responseJSON { (response) in
            if let jsonDictionary = response.result.value as? [String: Any] {
                for index in jsonDictionary {
                    let value = index.key
                    switch value {
                    case "TransationCount": gasData.transactionCount = index.value as? Int
                    default: break
                    }
                }
            }
        }

        
    }
 
    static func GetGasInfo() {
        Alamofire.request(Router.GetGasInfo()).responseJSON { (response) in
            if let jsonDictionary = response.result.value as? [String: Any] {
                for index in jsonDictionary {
                    let value = index.key
                    switch value {
                        
                    case "gasLimitHex": gasData.gasLimitHex = index.value as? String
                    case "gasPrice": gasData.gasPrice = index.value as? String
                    case "gasPriceHex": gasData.gasPriceHex = index.value as? String
                    case "gasLimit": gasData.gasLimit = index.value as? Int
                    default: break
                    }
                    
                }
            }
        }
    }
    static func GetEthereumCurrency() {
        Alamofire.request(Router.GetEthereumCurrency()).responseJSON { (response) in
            if let jsonDictionary = response.result.value as? [String: Any] {
                for index in jsonDictionary {
                    let value = index.key
                    
                }
            }
        }
    }
    
}
