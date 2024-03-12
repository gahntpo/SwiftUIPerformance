//
//  RandomColorBackground.swift
//  LayoutProject
//
//  Created by Karin Prater on 11.02.24.
//


import SwiftUI

struct ReducedDependenciesObservableObjectExampleView: View {
    
    @StateObject private var viewModel = InspirationViewModel()
    
    var body: some View {
        HStack {
            VStack {
                List  {
                    ForEach(viewModel.inspirations) {
                        InspirationImage(imageName: $0.imageName)
                       // RowView(inspiration: $0,
                       //         fetchMoreData: viewModel.fetchMoreData)
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
        .environmentObject(viewModel)
    }
}

fileprivate struct RowView: View {
    
    let inspiration: NatureInspiration
    var fetchMoreData: () -> Void
    
    init(inspiration: NatureInspiration, fetchMoreData: @escaping () -> Void) {
        self.inspiration = inspiration
        self.fetchMoreData = fetchMoreData
    }
    
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
                Button("Do something",
                       action: fetchMoreData)
            }
            .padding(.top, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.random())
    }
}

fileprivate struct InspirationImage: View {
   // let inspiration: NatureInspiration
    let imageName: String
   
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .modifier(CustomViewModifier())
               
            RemainingTimeView()
        }
        .listRowBackground(Color.random())
    }
}

fileprivate struct RemainingTimeView: View {
    @EnvironmentObject var viewModel: InspirationViewModel
    
    var body: some View {
        Text(viewModel.timeRemaining.formatted(date: .omitted, time: .standard))
    }
}

fileprivate struct CustomViewModifier: ViewModifier {
    
    @EnvironmentObject var viewModel: InspirationViewModel
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                print("fetch something in the view model")
                viewModel.fetchMoreData()
            }
    }
}


#Preview {
    ReducedDependenciesObservableObjectExampleView()
}

