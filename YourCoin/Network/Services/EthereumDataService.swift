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
                print(error)
                completionHandler(nil, error)
                break
            default:
                break
                
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
                print(error)
                completionHandler(nil, error)
                break
            default:
                break
                
            }
    }
    }
    // TODO: Improve realization
//    func GetCryptoCurrency(value: String) {
//            Alamofire.request(Router.getCryptoCurrency(left_value: value))
//                .responseArray {(response: DataResponse<[CryptoCurrency]>)
//                    in switch response.result {
//                    case .success:
//                        let currency = response.result.value
//                        print(currency)
//                        break
//                    case .failure(let error):
//                        print(error)
//                        break
//                    default:
//                        break
//                    }
//                }
//        }
    func GetBallance(address: String, completionHandler: @escaping (Balance?, Error?) -> ()) {
        Alamofire.request(Router.getWalletBalance(address: address)).responseObject {(response: DataResponse<Balance>)
            in switch response.result {
            case .success:
                let balance = response.result.value
                completionHandler(balance, nil)
                break
            case .failure(let error):
                print(error)
                completionHandler(nil, error)
                break
            default:
                break
            }
        }
    }
    
}

