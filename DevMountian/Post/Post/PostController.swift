//
//  PostController.swift
//  Post
//
//  Created by Taylor Phillips on 2/21/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
class PostController {
    weak var delegate: PostControllerDelegate?
    var posts: [Post] = []{
        didSet{
            delegate?.postsWereUpdatedTo(post: posts, on: self)
        }
    }
    static let baseURL = URL(string: "https://devmtn-post.firebaseio.com/posts/")
    static let getterEndpoint = baseURL?.appendingPathExtension("json")
    
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts(reset: Bool = true, completion: (([Post]) -> Void)? = nil){
        
        guard let url = PostController.getterEndpoint else {completion?([]); return}
        
        let queryEndInterval = reset ? Date().timeIntervalSince1970 : posts.last?.timestamp ?? Date().timeIntervalSince1970
        
        let urlParameters = ["orderBy": "\"timestamp\"", "endAt": "\(queryEndInterval)", "limitToLast": "20",]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            if let error = error{
                print(error.localizedDescription)
                completion?([])
            }
            guard let data = data,
                let responseString = String(data: data, encoding: .utf8) else {completion?([]); return}
            
            guard let postsDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:[String: Any]] else{

                print(responseString)
                completion?([])
                return
            }
            let post = postsDictionary.flatMap { Post(dictionary: $0.1, identifier: $0.0) }
            let sortedPosts = post.sorted(by: { ($0.1.timestamp < $0.0.timestamp)})
            
            DispatchQueue.main.async {
                reset ? self.posts = sortedPosts : self.posts.append(contentsOf: sortedPosts)
                
                completion?(sortedPosts)
            }
        }
    }
    func addNewPostWith(username: String, text: String, completion: @escaping (Bool)->Void){
        guard let url =  PostController.getterEndpoint else {completion(false); return}
        let post = Post(username: username, text: text)
        NetworkController.performRequest(for: url, httpMethod: .Put, urlParameters: nil, body: post.jsonData) { (data, error) in
            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8)
                else {completion(false); return}
            if let error = error{
                print (error.localizedDescription)
            }else if responseDataString.contains("error"){
                print("Error: \(responseDataString)")
                completion(false)
            }else{
                print("Successful save to endpoint \nResponse: \(responseDataString)")
                completion(true)
            }
        }
        
    }
}

protocol PostControllerDelegate: class {
    func postsWereUpdatedTo(post: [Post], on postController: PostController)
}
