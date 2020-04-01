//
//  NamesModel.swift
//  LoginScreen
//
//  Created by Oleksander on 01.04.2020.
//  Copyright © 2020 Zyma. All rights reserved.
//

import Foundation

class NamesModel {
    
    var names = [NameModel]()
    
    func clearNames() {
        names.removeAll()
    }
    
    func addName(name: NameModel) {
        names.append(name)
    }
    
    func removName(index: Int) {
        names.remove(at: index)
    }
    
    func getName(index: Int)->String {
        return names[index].name
    }
    
    func count()->Int {
        return names.count
    }
    
    
}
