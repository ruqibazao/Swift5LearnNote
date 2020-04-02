//
//  ContentView.swift
//  SwiftUILearn
//
//  Created by nenhall on 2020/1/17.
//  Copyright © 2020 nenhall. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        HStack {
            ExtractedButton(title: "1" , backgroundColorName: "operatorBackground") {
                print("1")
            }
            ExtractedButton(title: "2", backgroundColorName: "operatorBackground") {
                print("2")
            }
            ExtractedButton(title: "3", backgroundColorName: "operatorBackground") {
                print("2")
            }
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize = CGSize(width: 88, height: 88)
    let backgroundColorName: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.system(size: fontSize))
                .background(Color(backgroundColorName))
                .foregroundColor(.red)
                .frame(width: 88, height: 88, alignment: .center)
                .cornerRadius(size.width / 2)
        }
    }
}
