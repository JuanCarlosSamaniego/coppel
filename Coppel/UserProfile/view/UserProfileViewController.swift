//
//  UserProfileViewController.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 09/02/23.
//

import UIKit

class UserProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     //  getacount()
        getsesionId()
//https://api.themoviedb.org/3/account?api_key=<<api_key>>
        // Do any additional setup after loading the view.
    }
    
    
    func getsesionId() {
        
        let urlSession = URLSession.shared
        let url = URL(string: "https://api.themoviedb.org/3/authentication/session/new?api_key=\(dataForAPI.APIKey)")
        urlSession.dataTask(with: url!) { data, respose, error in
                       print("🗳 data", data ?? "")
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data)
                print("🗳 JSON:",json ?? "")
            }
                      print("🗳 respose", respose ?? "")
                       print("🗳 error", error ?? "")
        }.resume()
   // https://api.themoviedb.org/3/authentication/session/new?api_key=<<api_key>>
    }
    
    func getacount () {
        let urlSession = URLSession.shared
   // https://api.themoviedb.org/3/authentication/token/new?api_key=<<api_key>>
 //   https://api.themoviedb.org/3/account?api_key=<<api_key>>
        let url = URL(string: "https://api.themoviedb.org/3/account?api_key=\(dataForAPI.APIKey)")
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
