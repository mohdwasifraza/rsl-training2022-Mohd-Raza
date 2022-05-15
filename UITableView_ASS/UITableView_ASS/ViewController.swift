//
//  ViewController.swift
//  UITableView_ASS
//
//  Created by Mohd Raza on 14/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let shopItems = ["Banana", "Apple" , "Grapes"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell1.textLabel?.text = shopItems[indexPath.row]
        return cell1
    }
    
    
}
