//
//  SecondViewController.swift
//  app_1
//
//  Created by Mesrop Kareyan on 1/14/17.
//  Copyright © 2017 Mesrop Kareyan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func viewDidTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

}
