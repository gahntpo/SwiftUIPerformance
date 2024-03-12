//
//  ObservableObjectReduceDependenciesExampleView.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 18.02.24.
//


import SwiftUI

struct ObservableObjectReduceDependenciesExampleView: View {
    @StateObject private var viewModel = InspirationViewModel()
    
    var body: some View {
        HStack {
            VStack {
                List  {
                    ForEach(viewModel.inspirations) {
                        RowView(imageName: $0.imageName,
                                name: $0.name,
                                description: $0.description,
                                action: viewModel.fetchMoreData)
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
            .frame(maxWidth: 200)
        }
    }
}

fileprivate struct RowView: View {
    
    let imageName: String
    let name: String
    let description: String
    
    let action: () -> Void
    
    var body: some View {
       HStack(alignment: .top, spacing: 10) {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .border(Color.random())
            
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                Text(description)
                    .font(.caption)
                    .lineLimit(3)
                Button("Do something") {
                    action()
                }
            }
            .padding(.top, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .testBackground()
    }
}

#Preview {
    ObservableObjectReduceDependenciesExampleView()
}
