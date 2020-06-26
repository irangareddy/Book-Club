//
//  BookDetail.swift
//  Book Club
//
//  Created by RANGA REDDY NUKALA on 25/06/20.
//

import SwiftUI

struct BookDetail: View {
    
    var book: Book
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            #if os(macOS)
            VStack {
                Image(book.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                Text(book.description).padding(.all, 16)
            }
            #endif
            VStack {
                Image(book.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                Text(book.description).padding(.all, 16)
            }
        }
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: testData[0])
    }
}
