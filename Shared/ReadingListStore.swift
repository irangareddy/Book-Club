//
//  ReadingListStore.swift
//  Book Club
//
//  Created by RANGA REDDY NUKALA on 25/06/20.
//

import Foundation
class ReadingListStore: ObservableObject {
    @Published var books: [Book]
    
    init(books: [Book] = []) {
        self.books = books
    }
    

}

let testStore = ReadingListStore(books: testData)
