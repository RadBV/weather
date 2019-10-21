
//
//  FavesPersistenceHelper.swift
//  weather
//
//  Created by Radharani Ribas-Valongo on 10/21/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

struct FavesPersistenceHelper {
    static let manager = FavesPersistenceHelper()
    
    func save(newJournal: PhotoJournal) throws {
        try persistenceHelper.save(newElement: newJournal)
    }
    
    func getFaves() throws -> [PhotoJournal] {
        return try persistenceHelper.getObjects()
    }
    
    func deleteFaves(date: Date) throws {
        do {
            let Faves =  try getFaves()
            //TODO: - figure out delete function
//            let newFaves = journal.filter { $0.date != date}
//            try persistenceHelper.replace(elements: newJournals)
        }
    }
    
    private let persistenceHelper = PersistenceHelper<PhotoJournal>(fileName: "PhotoJournal.plist")
    
    private init() {}
}
