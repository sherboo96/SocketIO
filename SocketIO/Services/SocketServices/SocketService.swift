//
//  SocketService.swift
//  SocketIO
//
//  Created by Mahmoud Sherbeny on 05/12/2021.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    let BASE_URL = "https://chattychatjb.herokuapp.com/v1/"
    
    let manager: SocketManager
    let socket: SocketIOClient

    override init() {
        manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        socket = manager.defaultSocket
        super.init()
    }
    
    func establishSocketIO() {
        socket.connect()
    }
    
    func stopSocketIO() {
        socket.disconnect()
    }
    
    func createChannel(channelName: String, channelDesciption: String, completion: @escaping (Bool) -> Void) {
        socket.emit("newChannel", channelName, channelDesciption) {
            print("Ok")
            completion(true)
        }
    }
    
    func getChannel(completion: @escaping ([String]) -> Void) {
        socket.on("channelCreated") { dataArray, ack in
            var data = [String]()
            guard let channelName = dataArray[0] as? String else { return }
            data.append(channelName)
            guard let channelDesciption = dataArray[1] as? String else { return }
            data.append(channelDesciption)
            guard let channelID = dataArray[2] as? String else { return }
            data.append(channelID)
            completion(data)
        }
    }
}
