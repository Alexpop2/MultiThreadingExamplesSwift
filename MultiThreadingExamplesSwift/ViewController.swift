//
//  ViewController.swift
//  MultiThreadingExamplesSwift
//
//  Created by Рабочий on 22/01/2019.
//  Copyright © 2019 Рабочий. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageWithcCompletion { (image) in
            self.imageView.image = image
        }
    }

    func loadImageWithcCompletion(completion: @escaping (UIImage?) -> Void) {
        let backQueue = DispatchQueue.global(qos: .background)
        
        backQueue.async {
            let image = self.loadImage()
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
    func loadImage()-> UIImage? {
        return UIImage(named: "123")
    }
}

