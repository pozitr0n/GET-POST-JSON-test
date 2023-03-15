//
//  ViewController.swift
//  GetJSON
//
//  Created by Raman Kozar on 15/03/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //requestGET()
        requestPOST()
    
    }
    
    func requestPOST() {
        
        let myURL = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        guard let myURL = myURL else { return }
        
        var myRequest = URLRequest(url: myURL)
        myRequest.httpMethod = "POST"
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateStyle = .short
        myDateFormatter.timeStyle = .none
        
        let myFinalDate = Date()
        
        let myParams = ["name" : "Raman", "surname" : "Kozar", "age" : "27", "current date" : myDateFormatter.string(from: myFinalDate)]
        myRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        guard let body = try? JSONSerialization.data(withJSONObject: myParams, options: []) else { return }
        myRequest.httpBody = body
        
        let mySession = URLSession.shared
        
        let myTask = mySession.dataTask(with: myRequest) { data, responce, error in
            
            if let data = data {
                
                do {
                    let myJSON = try! JSONSerialization.jsonObject(with: data, options: [])
                    print(myJSON)
                }
                
            }
            
        }
        myTask.resume()
        
    }

    func requestGET() {
        
        let myURL = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        guard let myURL = myURL else { return }
        
        var myRequest = URLRequest(url: myURL)
        myRequest.httpMethod = "GET"
        
        let mySession = URLSession.shared
        let myTask = mySession.dataTask(with: myRequest) { data, responce, error in
            
            if let data = data {
                
                do {
                    let myJSON = try! JSONSerialization.jsonObject(with: data, options: [])
                    print(myJSON)
                }
                
            }
        
        }
        
        myTask.resume()
        
    }

}

