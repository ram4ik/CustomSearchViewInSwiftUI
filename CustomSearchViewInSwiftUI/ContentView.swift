//
//  ContentView.swift
//  CustomSearchViewInSwiftUI
//
//  Created by Ramill Ibragimov on 02.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var txt = ""
    
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            
            // main view goes here...
            SearchView(txt: $txt, data: data)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchView: View {
    @Binding var txt: String
    var data: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    TextField("Search", text: $txt)
                        .padding(.trailing, 75)
                }.padding()
                .background(Color.white)
                
                if self.txt != "" {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.txt = ""
                        }) {
                            Text("Cancel")
                        }.foregroundColor(.black)
                    }.padding()
                }
            }
            if self.txt != "" {
                List(self.data.filter{$0.lowercased().contains(self.txt.lowercased())}, id: \.self) { i in
                    Text(i)
                }.frame(height: 500)
            }
            Spacer()
        }.padding()
    }
}
