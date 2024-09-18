//
//  ContentView.swift
//  HelloCoreML
//
//  Created by Mohammad Azam on 5/19/23.
//

import SwiftUI
import CoreML
import PhotosUI

struct ProbabilityListView: View {
    
    let probs: [Dictionary<String, Double>.Element]
    
    var body: some View {
        List(probs, id: \.key) { (key, value) in
            
            HStack {
                Text(key)
                Text(NSNumber(value: value), formatter: NumberFormatter.percentage)
            }
        }
    }
}

struct ContentView: View {
    
    let model = try! CatsVsDogsImageClassifier(configuration: MLModelConfiguration())
    @State private var probs: [String: Double] = [: ]
    @State private var selectedPhotoItem: PhotosPickerItem? = nil
    @State private var uiImage: UIImage = UIImage(named: "cat_113")!
    
    var sortedProbs: [Dictionary<String, Double>.Element] {
        
        let probsArray = Array(probs)
        return probsArray.sorted { lhs, rhs in
            lhs.value > rhs.value
        }
    }
    
    var body: some View {
        
        VStack {
            
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
            HStack {
                
                PhotosPicker(selection: $selectedPhotoItem, matching: .images) {
                    Text("Select a Photo")
                }
                
                Button("Camera") {
                    
                }.buttonStyle(.bordered)
                    
            }
            
            
            Button("Predict") {
                
                let resizedImage = uiImage.resizeTo(to: CGSize(width: 299, height: 299)) 
                guard let buffer = resizedImage.toCVPixelBuffer() else { return }
                
                do {
                    let result = try model.prediction(image: buffer)
                    probs = result.classLabelProbs
                } catch {
                    print(error.localizedDescription)
                }
                
            }.buttonStyle(.borderedProminent)
            
            ProbabilityListView(probs: sortedProbs)
        }
        .onChange(of: selectedPhotoItem, perform: { selectedPhotoItem in
            selectedPhotoItem?.loadTransferable(type: Data.self, completionHandler: { result in
                switch result {
                    case .success(let data):
                        if let data {
                            guard let img = UIImage(data: data) else { return }
                            uiImage = img
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            })
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
