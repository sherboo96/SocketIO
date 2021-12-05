//
//  TestVC.swift
//  SocketIOTest
//
//  Created by Mahmoud Sherbeny on 05/12/2021.
//

import UIKit

class TestVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tfTitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewLoad()
    }
    
    func viewLoad() {
        SocketService.instance.getChannel { result in
            self.lblTitle.text = result[0]
        }
    }

    @IBAction func addButtonTapped(_ sender: UIButton) {
        SocketService.instance.createChannel(channelName: tfTitle.text ?? "Test", channelDesciption: "Hello") { success in
            print("Done")
        }
    }

}
