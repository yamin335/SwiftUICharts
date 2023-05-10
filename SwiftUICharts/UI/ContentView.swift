//
//  ContentView.swift
//  SwiftUICharts
//
//  Created by Md. Yamin on 08.05.23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    SimpleBarChart()
                } label: {
                    HStack {
                        Image(systemName: "chart.bar.xaxis")
                            .foregroundColor(Color("blue2"))
                        
                        Text("Bar chart")
                            .foregroundColor(Color("textColor3"))
                            .font(.system(size: 20))
                    }
                    .padding(10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 5, style: .circular).fill(Color("gray4")))
                }
                Spacer()
            }
            .navigationTitle("SwiftUI Charts")
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
