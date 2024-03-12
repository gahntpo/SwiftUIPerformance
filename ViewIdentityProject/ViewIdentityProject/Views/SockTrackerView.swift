//
//  SockTrackerView.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 20.02.24.
//

import SwiftUI

// how to model your data for optimal performance -> identity


struct SockTrackerView: View {
    
    @State private var socks = [Socks(daysWorn: 0, imageName: "black socks"),
                                Socks(daysWorn: 0, imageName: "white socks"),
                                Socks(daysWorn: 0, imageName: "gray socks")]
    
    var body: some View {
        VStack {
            List($socks) { $sock in
                VStack {
                    SocksView(imageName: sock.imageName,
                              daysWorn: sock.daysWorn)
                    EditSocksRowView(socks: $sock)
                }
            }
            
            VStack {
                Button("Washing Day") {
                    self.socks =  socks.map { sock in
                        var sock = sock
                        sock.daysWorn = 0
                        return sock
                    }
                }
                Button("Bought a new pair of black socks") {
                    self.socks.append(Socks(daysWorn: 0, imageName: "black socks"))
                }
            }
            .buttonStyle(.bordered)
            .padding()
        }
    }
}

struct SocksView: View {
    let imageName: String
    let daysWorn: Int
    var body: some View {
        HStack(spacing: 20) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .overlay(content: {
                    if daysWorn > 0 {
                        Color.brown
                            .opacity(0.1 * Double(daysWorn))
                    }
                })
            
            Text("Days worn  \(daysWorn)")
            Spacer()
        }
    }
}


struct EditSocksRowView: View {
    @Binding var socks: Socks
    var body: some View {
        let _ = Self._printChanges()
        HStack(spacing: 20) {
            Spacer()
            Button(action: {
                socks.daysWorn = 0
            }, label: {
                Text("Washed")
            })
            .disabled(socks.daysWorn == 0)
            .buttonStyle(.bordered)
            
            Button(action: {
                socks.daysWorn += 1
            }, label: {
                Text("Worn today")
            })
            .buttonStyle(.borderedProminent)
        }
    }
}


#Preview {
    SockTrackerView()
}
