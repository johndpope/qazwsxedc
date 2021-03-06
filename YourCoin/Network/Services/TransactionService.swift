//
//  TransactionService.swift
//  YourCoin
//
//  Created by Juden on 1/12/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import Alamofire

class TransactionService {
    public let keystore: EtherKeystore = EtherKeystore()
    
    // TODO: Get current user account
    
//    func SignTransaction (amount: Int64, to: Address) {
//        let signTransaction = SignTransaction(
//            amount: GethNewBigInt(Int64(0.5)),
//            account: from!,
//            address: to!,
//            nonce: gasData.transactionCount!,
//            speed: .custom(gasPrice: BigInt(gasData.gasPrice!)!, gasLimit: BigInt(gasData.gasLimit!)),
//            data: Data(),
//            chainID: GethNewBigInt(Int64(3)))
//
//        let signedTransaction = keystore.signTransaction(signTransaction)
//        switch signedTransaction {
//        case .success(let data):
//            let sendData = data.hexEncoded
//            Alamofire.request(Router.signTransaction(hex: sendData)).responseJSON(completionHandler: { (response) in
//                print(response)
//            })
//        case .failure(let error):
//            print(error)
//        }
//
//    }
    
    
    // TODO: Using library ObjectMapper get data from API automaticaly, then use that method for other services
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
}

