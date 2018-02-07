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
    
    func GetNonce(address: String,completionHandler: @escaping (TransactionCount?, Error?) -> ()) {
        Alamofire.request(Router.getTransactionsCount(address:address)).responseObject { (response:DataResponse<TransactionCount>)
            in switch response.result {
            case .success:
                let transactionCount = response.result.value
                completionHandler(transactionCount, nil)
                break
            case .failure(let error):
                completionHandler(nil, error)
                break
            default:
                break
                
            }
           

        
    }
    }
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
    func GetGasInfo(completionHandler: @escaping (GasData?, Error?) -> ()){
        Alamofire.request(Router.getGasInfo()).responseObject{(response: DataResponse<GasData>)
            in switch response.result {
            case .success:
                let gasData = response.result.value
                completionHandler(gasData, nil)
                break
            case .failure(let error):
                completionHandler(nil, error)
                break
            default:
                break
                
            }
    }
    }
    func GetCryptoCurrency(value: Currency) {
        Alamofire.request(Router.getCryptoCurrency(left_value: value.rawValue)).responseArray { (response: DataResponse<[CryptoCurrency]>)
            in let cryptoCurrency = response.result.value
            if let cryptoCurrency =  cryptoCurrency {
                for item in cryptoCurrency {
                    print(item.hour)
                }
            }
            
            
           
            }
        }
    
}

