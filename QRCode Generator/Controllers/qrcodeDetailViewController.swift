//
//  qrcodeDetailViewController.swift
//  QRCode Generator
//
//  Created by Rafael Oliveira on 06/11/20.
//

import UIKit

class qrcodeDetailViewController: UIViewController {
    
    @IBOutlet weak var qrCodeContentTitle: UITextField!
    var selectedItem : Item?

    override func viewDidLoad() {
        super.viewDidLoad()

        let newItem = selectedItem
        qrCodeContentTitle.text = newItem?.title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
