//
//  TrailerView.swift
//  TheMovieApp
//
//  Created by Diego Vazquez Sanchez on 30/04/24.
//

import SwiftUI
import WebKit

struct TrailerView: View {
    
    @StateObject var moviesVM: MoviesViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(edges: .all)
            VideoView(videoID: moviesVM.key)
                .frame(minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: UIScreen.main.bounds.height * 0.3)
                .cornerRadius(12)
                .padding(.all)
                .task {
                    await moviesVM.fetchVideo()
                }
        }
    }
    
}

//#Preview {
//    TrailerView()
//}


struct VideoView: UIViewRepresentable {
    let videoID : String
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/watch?v=\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: url))
    }
    
}
