//
//  ObservationTestView.swift
//  LayoutProject
//
//  Created by Karin Prater on 11.02.24.
//

import SwiftUI

struct ObservationExampleView: View {
    
    @State private var viewModel = ObservationData()
    
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
                        viewModel.inspirations.append(ObservationNatureInspiration.example())
                    }, label: {
                        Label("Add More", systemImage: "plus")
                    })
                    Spacer()
                    Button(action: viewModel.toggleTimer, label: {
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
    
    let inspiration: ObservationNatureInspiration
    @Bindable var viewModel: ObservationData
    
    var body: some View {
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
                
                HStack {
                    Button("Do something") {
                        viewModel.fetchMoreData()
                    }
                    
                    TextSubView(viewModel: viewModel)
                }
            }
            .padding(.top, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

fileprivate struct TextSubView: View {
    var viewModel: ObservationData
    var body: some View {
        Text(viewModel.timeRemaining.formatted(date: .omitted, time: .standard))
    }
}

#Preview {
    ObservationExampleView()
}
