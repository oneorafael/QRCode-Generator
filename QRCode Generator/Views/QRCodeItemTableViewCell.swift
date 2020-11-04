//
//  QRCodeItemTableViewCell.swift
//  QRCode Generator
//
//  Created by Rafael Oliveira on 04/11/20.
//

import UIKit

class QRCodeItemTableViewCell: UITableViewCell {
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var titleTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
