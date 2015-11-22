//
//  ViewController.swift
//  AlamofireLeakage
//
//  Created by Christian Noon on 11/22/15.
//  Copyright © 2015 Noondev. All rights reserved.
//

import Alamofire
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button: UIButton = {
            let button = UIButton(type: UIButtonType.System)
            button.setTitle("Start Request", forState: .Normal)
            button.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)

            return button
        }()

        view.addSubview(button)

        button.sizeToFit()
        button.center = view.center
    }

    @objc private func buttonTapped() {
        print("Starting Request...")

        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseJSON { response in
                switch response.result {
                case .Success(let json):
                    print(json)
                case .Failure(let error):
                    print(error)
                }
            }
    }
}
