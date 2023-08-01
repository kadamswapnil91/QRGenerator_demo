//
//  ViewController.swift
//  QR Generator
//
//  Created by Apple on 21/09/22.
//

import UIKit

class ViewController: UIViewController {
    var strEnteredString = String()
    @IBOutlet var qrImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 

    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)


        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

    @IBAction func generateQRAction(_ sender: Any) {
           let image = generateQRCode(from: strEnteredString)
            qrImageView.image = image
    }


    

}



