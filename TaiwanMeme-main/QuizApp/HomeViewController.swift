//
//  HomeViewController.swift
//  QuizApp
//
//  Created by 邱奕軒 on 2023/3/15.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func startGame() {
        let vc = storyboard?.instantiateViewController(identifier: "view") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}
