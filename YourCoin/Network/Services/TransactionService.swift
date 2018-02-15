//
//  TransactionService.swift
//  YourCoin
//
//  Created by Juden on 1/12/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import Alamofire
import BigInt
import Geth
import AlamofireObjectMapper
import UIKit
import APIKit
import JSONRPCKit
import Result
import Foundation
import Geth
import KeychainSwift
import CryptoSwift
import Alamofire

class TransactionService {
    public let keystore: EtherKeystore = EtherKeystore()
    
    // TODO: Get current user account
    
    func SigningTransaction (amount: GethBigInt, account: Account, address: Address, nonce: TransactionCount, speed: GasData, data: Data, chainId:Int64,  completionHandler: @escaping (SignedTransaction?, Error?) -> ()) {
        let signTransaction = SignTransaction(
            amount: amount,
            account: account,
            address: address,
            nonce: Int(nonce.transactionCount!)!,
            speed: .custom(gasPrice: BigInt(Int(speed.gasPrice!)!), gasLimit: BigInt(speed.gasLimit!)),
            data: Data(),
            chainID: GethNewBigInt(Int64(3)))
        

        let signedTransaction = keystore.signTransaction(signTransaction)
        switch signedTransaction {
        case .success(let data):
            let sendData = data.hexEncoded
            Alamofire.request(Router.signTransaction(hex: sendData)).responseObject {(response: DataResponse<SignedTransaction>)
                in switch response.result {
                case .success:
                    let hash = response.result.value
                    completionHandler(hash, nil)
                    break;
                case .failure(let error):
                    print(error)
                    break
                }
                
            }
        case .failure(let error):
            print(error)
        }

    }
    
    
    
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

