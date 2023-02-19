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
    }
}
