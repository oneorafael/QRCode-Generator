//
//  qrcodeDetailViewController.swift
//  QRCode Generator
//
//  Created by Rafael Oliveira on 06/11/20.
//

import UIKit

class qrcodeDetailViewController: UIViewController {
    
    @IBOutlet weak var qrCodeContentTitle: UITextField!
    @IBOutlet weak var qrCodeImage: UIImageView!
    var selectedItem : Item?

    override func viewDidLoad() {
        super.viewDidLoad()

        let newItem = selectedItem
        let finalContent = newItem?.title
        qrCodeContentTitle.text = finalContent
        let qrcode = generateQRCode(from: finalContent!)
        qrCodeImage.image = qrcode
        
    }
    

    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
}
