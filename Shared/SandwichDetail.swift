//
//  SandwichDetail.swift
//  Sandwiches
//
//  Created by Li, Muchen on 2021/1/20.
//

import SwiftUI

struct SandwichDetail: View {
    var sandwich: Sandwich
    @State private var zoomed = false

    var body: some View {
        VStack{
            Spacer(minLength: 0)
            
            Image(sandwich.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            
            Spacer(minLength: 0)
            
            HStack {
                Spacer()
                Label("Spicy", systemImage: "flame.fill")
                Spacer()

            }
            .padding(.all)
            .font(Font.headline.smallCaps())
            .background(Color.red)
            .foregroundColor(.yellow)
        }
        .navigationTitle(sandwich.name)
        .edgesIgnoringSafeArea(.bottom)
        
    }
    
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SandwichDetail(sandwich: testData[0])
        }
    }
}
