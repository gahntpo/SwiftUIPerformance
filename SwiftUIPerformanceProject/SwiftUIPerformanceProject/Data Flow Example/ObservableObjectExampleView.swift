//
//  RandomColorBackground.swift
//  LayoutProject
//
//  Created by Karin Prater on 11.02.24.
//


import SwiftUI

struct ObservableObjectExampleView: View {
    
    @StateObject private var viewModel = InspirationViewModel()
    
    var body: some View {
        HStack {
            VStack {
                List  {
                    ForEach(viewModel.inspirations) {
                        RowView(inspiration: $0, viewModel: viewModel)
                    }
                }
                
                HStack {
                    Button(action: {
                        viewModel.inspirations.append(NatureInspiration.example())
                    }, label: {
                        Label("Add More", systemImage: "plus")
                    })
                    Spacer()
                    Button(action:  viewModel.toggleTimer, label: {
                        Label("Toggle Timer", systemImage: "clock")
                    })
                    
                    Text(viewModel.timeRemaining.formatted(date: .omitted, time: .standard))
                }
                .padding(5)
            }
            
            List {
                ForEach($viewModel.inspirations) { $inspiration in
                    TextField("inspiration", text: $inspiration.name)
                }
            }
            .frame(width: 200)
        }
    }
}

fileprivate struct RowView: View {
    
    let inspiration: NatureInspiration
    @ObservedObject var viewModel: InspirationViewModel
    
    var body: some View {
        
        let _ = Self._printChanges()
        
       HStack(alignment: .top, spacing: 10) {
            Image(inspiration.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 5))
              
            VStack(alignment: .leading, spacing: 5) {
                Text(inspiration.name)
                Text(inspiration.description)
                    .font(.caption)
                    .lineLimit(3)
                Button("Do something") {
                    viewModel.fetchMoreData()
                }
            }
            .padding(.top, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .testBackground()
        .testAnimatedBackground()
        
    }
}

#Preview {
    ObservableObjectExampleView()
}

