//
//  WrapperObservableObjectExampleView.swift
//  ImproveDataFlowProject
//
//  Created by Karin Prater on 28.02.24.
//

import SwiftUI

struct WrapperObservableObjectExampleView: View {
    
    @StateObject private var vmWrapper = InspirationViewModelWrapper()
    
    var body: some View {
        HStack {
            VStack {
                InspirationListView(viewModel: vmWrapper.vm,
                                    viewModelWrapper: vmWrapper)
                
                HStack {
                    Button(action: {
                        vmWrapper.vm.inspirations.append(NatureInspiration.example())
                    }, label: {
                        Label("Add More", systemImage: "plus")
                    })
                    Spacer()
                    Button(action:  vmWrapper.vm.toggleTimer, label: {
                        Label("Toggle Timer", systemImage: "clock")
                    })
                    
                    TimerView(viewModel: vmWrapper.vm)
                   
                }
                .padding(5)
            }
            
            List {
                ForEach($vmWrapper.vm.inspirations) { $inspiration in
                    TextField("inspiration", text: $inspiration.name)
                }
            }
            .frame(width: 200)
        }
    }
}

fileprivate struct RowView: View {
    
    let inspiration: NatureInspiration
    var viewModelWrapper: InspirationViewModelWrapper
    
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
                Button("Do something") {
                    viewModelWrapper.vm.fetchMoreData()
                }
            }
            .padding(.top, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.random())
    }
}

fileprivate struct InspirationListView: View {
    
    @ObservedObject var viewModel: InspirationViewModel
    var viewModelWrapper: InspirationViewModelWrapper
    
    var body: some View {
        List  {
            ForEach(viewModel.inspirations) {
                RowView(inspiration: $0,
                        viewModelWrapper: viewModelWrapper)
            }
        }
    }
}

fileprivate struct TimerView: View {
    
    @ObservedObject var viewModel: InspirationViewModel
    var body: some View {
        Text(viewModel.timeRemaining.formatted(date: .omitted, time: .standard))
    }
}

#Preview {
    WrapperObservableObjectExampleView()
}
