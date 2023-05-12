//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Богдан Радченко on 12.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(maxWidth: 700, maxHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
