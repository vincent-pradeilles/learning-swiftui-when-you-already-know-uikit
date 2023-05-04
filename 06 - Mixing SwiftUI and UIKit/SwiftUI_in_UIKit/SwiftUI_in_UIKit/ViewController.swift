//
//  ViewController.swift
//  SwiftUI_in_UIKit
//
//  Created by Vincent on 04/05/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    let data: [Int] = (0...10).map { $0 }
    
    lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        data.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        let cell = UITableViewCell()
        let number = data[indexPath.row]
        
        cell.contentConfiguration = UIHostingConfiguration {
            VStack(alignment: .leading) {
                Text("Number: \(number)")
                Text(formatter.string(for: number) ?? "")
            }
        }
        
        return cell
    }
}

