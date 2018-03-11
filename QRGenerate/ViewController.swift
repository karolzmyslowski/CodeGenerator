//
//  ViewController.swift
//  QRGenerate
//
//  Created by Karol Zmyslowski on 11.03.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var filter: CIFilter!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        if let text = textField.text{
            
            let data = text.data(using: .ascii, allowLossyConversion: false)
            
            if segment.selectedSegmentIndex == 0 {
                filter = CIFilter(name: "CICode128BarcodeGenerator")
            } else {
                filter = CIFilter(name: "CIQRCodeGenerator")
            }
           
            filter?.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let img = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
            
            imageView.image = img
        }
    }
    
}

