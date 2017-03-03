//
//  StudentController.swift
//  StudentPutAPI
//
//  Created by Taylor Phillips on 2/22/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
class StudentController {
     static let baseURL = URL(string: "https://aaronclass-362f2.firebaseio.com/students/")
    
    static func fetchStudents(completion: @escaping ([Student])->Void){
        
        guard let unWrappedURL = baseURL else {return}
        
        let url = unWrappedURL.appendingPathExtension("json")
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: nil, body: nil) { (data, error) in
            
            if let error = error{
                print(error.localizedDescription)
                completion([])
                return
            }
            
            guard let data = data,
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: [String:String]] else {completion([]); return}
            
            let students = jsonDictionary.flatMap({Student(dictionary: $0.value)})
            
//            var students2: [Student] = []
//            for dictionary in jsonDictionary {
//                guard let student = Student(dictionary: dictionary.value) else { completion([]); return}
//                students2.append(student)
//            }
            DispatchQueue.main.async {
                completion(students)
        
            }
            
            
        }
    }
    
    // MARK: PUT FUNCTION
    
    static func putStudent(with name: String,  completion: @escaping (Bool)->Void ){
        guard let unwrappedURL = baseURL else {completion(false); return}
        let url = unwrappedURL.appendingPathExtension("json")
        let student = Student(name: name)
        NetworkController.performRequest(for: url, httpMethod: .Post, urlParameters: nil, body: student.jsonData ) { (data, error) in
            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8)
                else { completion(false); return}
            if let error = error {
                print("There was an error posting the student to the database. Error: \(error.localizedDescription)")
            }else if responseDataString.contains("error"){
                print("Error: \(responseDataString)")
                completion(false)
                
            }else{
            
                print("Successsfull saved data to endpoint. \nResponse: \(responseDataString)")
                completion(true)
                
            }
            
        }
        
    }
}
