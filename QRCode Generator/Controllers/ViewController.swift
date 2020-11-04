//
//  ViewController.swift
//  QRCode Generator
//
//  Created by Rafael Oliveira on 04/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data = [
        Data(title: "teste 1"),
        Data(title: "teste 2"),
        Data(title: "teste 3"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.reusableIdentifier)
        
        
    }
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
}

// MARK: - TableView DataSource Methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reusableIdentifier, for: indexPath) as! QRCodeItemTableViewCell
        cell.titleTextLabel.text = data[indexPath.row].title
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
