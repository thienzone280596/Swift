//
//  RoomListViewModel.swift
//  Rooms
//
//  Created by Mohammad Azam on 3/1/21.
//

import Foundation
import UIKit

class RoomListViewModel: ObservableObject {
    
    let coreDM: CoreDataManager
    
    @Published var rooms: [RoomViewModel] = [RoomViewModel]()
    
    init() {
        coreDM = CoreDataManager.shared
    }
    
    func populateRooms() {
        DispatchQueue.main.async {
            self.rooms = self.coreDM.getAllRooms().map(RoomViewModel.init)
        }
    }
    
}




struct RoomViewModel {
    
    let room: Room
    
    var roomId: ObjectIdentifier {
        return room.id
    }
    
    var color: UIColor {
        return room.color ?? UIColor.clear
    }
    
    var name: String {
        return room.name
    }
    
}
