//
//  LoginViewController.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 09/02/23.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "LoginView"
      //  getToken()
        pruebalogin()
    }
    
    
    func getToken () {
        let urlSession = URLSession.shared
   // https://api.themoviedb.org/3/authentication/token/new?api_key=<<api_key>>
        let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new?api_key=\(dataForAPI.APIKey)")
        urlSession.dataTask(with: url!) { data, respose, error in
                       print("🗳 data", data ?? "")
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data)
                print("🗳 JSON:",json ?? "")
            }
                      print("🗳 respose", respose ?? "")
                       print("🗳 error", error ?? "")
        }.resume()
    }
}


    
    func pruebalogin() {
        //crea NSURL
   // https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=<<api_key>>
        let Url = String(format: "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=\(dataForAPI.APIKey)")
            guard let serviceUrl = URL(string: Url) else { return }
        
        
        let parameterDictionary = ["username":"JCDemoApps","password":"1234","request_token":"86fa5541ffc4d58c7b34c0cf0557c763e0e1404e"]
        
        //let parametersDic = ["username": "JCDemoApps", "password": "1234", "request_token":"86fa5541ffc4d58c7b34c0cf0557c763e0e1404e"]
            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
                return
            }
            request.httpBody = httpBody
            
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
       }

    





