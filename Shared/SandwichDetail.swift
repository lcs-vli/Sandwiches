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
        Image(sandwich.imageName)
            .resizable()
            .aspectRatio(contentMode: zoomed ? .fill : .fit)
            .onTapGesture {
                withAnimation {
                    zoomed.toggle()
                }
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
