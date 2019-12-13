//
//  LabQuestionsAPIClient.swift
//  LabQuestions
//
//  Created by casandra grullon on 12/12/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct LabQuestionsAPIClient {
    
    static func fetchQuestions(completion: @escaping (Result<[Question], AppError>) -> ()){
        
        let labEndpointURLString = "https://5df04c1302b2d90014e1bd66.mockapi.io/questions"
        
        guard let url = URL(string: labEndpointURLString) else {
            completion(.failure(.badURL(labEndpointURLString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        //set the http method (GET, POST, DELETE, PUT, UPDATE)
        //by default we are "GET"
        
        //FOR POST REQUEST
        //request.httpMethod = "POST"
        //request.httpBody = data
        //******REQUIRED********
        //inform the post request of the data type. without providing the header value as "application/json" we will get a decoding error when attempting to decode the JSON
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                //construct our [Question] array
                
                do{
                    //for POST need JSONEncoder()
                    let questions = try JSONDecoder().decode([Question].self, from: data)
                    completion(.success(questions))
                }catch{
                    completion(.failure(.decodingError(error)))
                }
                
            }
        }
    }
}
