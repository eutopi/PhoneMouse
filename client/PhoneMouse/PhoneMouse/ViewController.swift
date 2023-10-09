//
//  ViewController.swift
//  PhoneMouse
//
//  Created by Tongyu Zhou on 10/9/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func leftMouseClick(_ sender: Any) {
        print("left clicked")
        sendMessage(message: "click")
    }
    
    func sendMessage(message: String) {
        guard let url = URL(string: "http://192.168.86.111:5000/click") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = message.data(using: .utf8)
        print(request)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                print("Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }

        task.resume()
    }
}
