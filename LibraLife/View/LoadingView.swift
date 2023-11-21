//
//  LoadingView.swift
//  LibraLife
//
//  Created by Thibaud Barberon on 18/11/2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack {
            Text("LOGO HERE")
            Text("LibraLife")
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .bold))
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.4784, green: 0.7176, blue: 0.8196))

    }
}

#Preview {
    LoadingView()
}
