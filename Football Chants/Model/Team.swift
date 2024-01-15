//
//  Team.swift
//  Football Chants
//
//  Created by Daniel Kimani on 09/01/2024.
//

import Foundation


class Team{
    let id:TeamType
    let name:String
    let info:String
    let manager:Manager
    let founded:String
    var isPlaying:Bool //= false
    
    internal init(id: TeamType, name: String, info: String, manager: Manager, founded: String, isPlaying: Bool = false) {
        self.id = id
        self.name = name
        self.info = info
        self.manager = manager
        self.founded = founded
        self.isPlaying = isPlaying
    }
}
