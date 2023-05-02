//
//  AccountService.swift
//  SwiftUI-Bank_App
//
//  Created by Fadli M on 01/05/23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
    case noData
}

class AccountService {
    
    private init() { }
    
    static let shared = AccountService()
    
    func transferFunds(transferFundRequest: TransferFundRequest, completion: @escaping (Result<TransferFundResponse, NetworkError>) -> Void) {
        
        guard let url = URL.urlForTransfer() else {
            return completion(.failure(.badURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(transferFundRequest)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            print(jsonObject!)
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let transferFundResponse = try decoder.decode(TransferFundResponse.self, from: data)
                completion(.success(transferFundResponse))
            } catch let jsonError {
                print("Failed to decode JSON: \(jsonError)")
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func createAccount(createAccountRequest: CreateAccountRequest, completion: @escaping (Result<CreateAccountResponse, NetworkError>) -> Void) {
        guard let url = URL.urlForCreateAccounts() else {
            return completion(.failure(.badURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(createAccountRequest)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
//            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
//            print(jsonObject!)
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let createAccountResponse = try decoder.decode(CreateAccountResponse.self, from: data)
                completion(.success(createAccountResponse))
            } catch let jsonError {
                print("Failed to decode JSON: \(jsonError)")
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func getAllAccounts(completion: @escaping (Result<[Account]?, NetworkError>) -> Void) {
        
        guard let url = URL.urlForAccounts() else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
        
            // DECODED JSON WITHOUT MODEL / STRUCT
//            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
//            print(jsonObject!)
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let accounts = try decoder.decode([Account].self, from: data)
                completion(.success(accounts))
            } catch let jsonError {
                print("Failed to decode JSON: \(jsonError)")
                completion(.failure(.decodingError))
            }
            
//            let accounts = try? JSONDecoder().decode([Account].self, from: data)
//            
//            if accounts == nil {
//                completion(.failure(.decodingError))
//            } else {
//                completion(.success(accounts))
//            }
        }.resume()
    }
}
