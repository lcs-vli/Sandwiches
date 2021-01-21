//
//  ContentView.swift
//  Shared
//
//  Created by Li, Muchen on 2021/1/20.
//

//shortcuts:
//  command click (VStack)
//  option + command click (inspector)


import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    
    var body: some View {
        NavigationView{
            List{
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleteSandwiches)
                
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    #if os(iOS)
                    EditButton()
                    #endif
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Add", action: makeSandwich)
                }
            }
            
            Text("Select a sandwich")
                .font(.largeTitle)
        }
    }
    
    func makeSandwich(){
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Patty melt", ingredientCount: 3))
        }
    }
    
    func moveSandwiches(from: IndexSet, to: Int){
        withAnimation{
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwiches(offsets: IndexSet){
        withAnimation{
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: testStore)
            ContentView(store: testStore)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: testStore)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)){
            Image(sandwich.thumbnailName)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(sandwich.name)
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
