//
//  TransactionService.swift
//  YourCoin
//
//  Created by Juden on 1/12/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import BigInt
import Alamofire
import AlamofireObjectMapper

class TransactionService {
    public let keystore: EtherKeystore = EtherKeystore()
    
    // TODO: Get current user account
    
//    func SignTransaction (amount: Int64, to: String) {
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
    
    
    
    func GetTransactionStatus (hash:String, completionHandler: @escaping (TransactionStatus?, Error?) -> ()) {
        Alamofire.request(Router.getTransactionByHash(hash: hash)).responseObject {(response: DataResponse<TransactionStatus>)
            in switch response.result {
            case .success:
                let status = response.result.value
                completionHandler(status, nil)
                break
                
            case .failure(let error):
                print(error)
                completionHandler(nil, error)
                break
            }
        }
    }
}

