//
//  ReadingListViewer.swift
//  Book Club
//
//  Created by RANGA REDDY NUKALA on 25/06/20.
//

import SwiftUI



struct ReadingListViewer: View {
    @StateObject var store: ReadingListStore
    @SceneStorage("selectedItem") private var selectedItem: String?
    
    var selectedID: Binding<UUID?> {
            Binding<UUID?>(
                get: { selectedItem.flatMap { UUID(uuidString: $0) } },
                set: { selectedItem = $0?.uuidString }
            )
        }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.books) { book in
                    BookCell(book: book,selectedId: selectedID)
                }
            }
            .navigationBarTitle("Currently Reading")
            
            Text("No Selection")
        }
        
    }
}

struct ReadingListViewer_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListViewer(store: testStore)
    }
}

struct BookCell: View {
    
    var book: Book
    var selectedId: Binding<UUID?>
    
    var body: some View {
        NavigationLink(destination: BookDetail(book: book),tag: book.id, selection: selectedId) {
            HStack {
                Image(book.imageName)
                    .resizable()
                    .frame(width: 54,height:100)
                    .padding(.horizontal,8)
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.body)
                        .fontWeight(.bold)
                    Text(book.author)
                        .font(.footnote)
                        .foregroundColor(.secondary).padding(.top, 2)
                }
                Spacer()
                ProgressCircle(book: book)
            }
        }
    }
}

struct ProgressCircle: View {
    
    var book: Book
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: CGFloat(book.progress), to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 4, lineCap: .round)
                    
                    
                    
                )
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 3, x: 0, y: 3)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5))
                .frame(width: 50, height: 50)
            Text("\(String(book.progress * 100))")
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}
