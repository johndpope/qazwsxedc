//
//  EthereumDataService.swift
//  YourCoin
//
//  Created by Juden on 1/9/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public class EthereumDataService {
    
    // TODO: Get current account from Wallet Session
    
//    func GetNonce(address: String) {
//        Alamofire.request(Router.GetNonce(address)).responseJSON { (response) in
//            if let jsonDictionary = response.result.value as? [String: Any] {
//                for index in jsonDictionary {
//                    let value = index.key
//                    switch value {
//                    case "TransationCount": gasData.transactionCount = index.value as? Int
//                    default: break
//                    }
//                }
//            }
//        }
//
//        
//    }
//
    func GetTransactionStatus (hash:String) {
        Alamofire.request(Router.getTransactionByHash(hash: hash)).responseJSON {
            (response) in if let jsonDictionary = response.value as? [String: Any] {
                for index in jsonDictionary {
                    switch  index.key {
                        
                        default:
                        break
                    }
                }
            }
            
        }
    }
    func GetGasInfo(completionHandler: @escaping (GasData) -> ()){
        Alamofire.request(Router.getGasInfo()).responseObject{(response: DataResponse<GasData>)
            in switch response.result {
            case .success:
                let gasData = response.result.value
                completionHandler(gasData!)
            default:
                break;
                
            }
            //let gasData = response.result.value
            //print(gasData?.gasLimit)        }
    }
    }
    func GetCryptoCurrency(value: Currency) {
        Alamofire.request(Router.getCryptoCurrency(left_value: value.rawValue)).responseJSON { (response) in
            if let jsonDictionary = response.result.value as? [String: Any] {
                for index in jsonDictionary {
                    let value = index.key
                    
                }
            }
        }
    }

    
}
