//
//  PostCardImageDetailView.swift
//  BaudoAP
//
//  Created by Codez on 12/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardImageDetailView: View {
    @ObservedObject var contentImage = ContentImage()
    var model: Post
    
    @State var isPresented: Bool = false
    
    
    var body: some View {
        
        VStack(alignment: .leading){
//            NavigationLink(destination: PostCardImageDetailViewImage(model: model, $isPresented: false), label: {
//
//                 }
//            )
            WebImage(url: URL(string: model.Url)).resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30)
            
            Button("Ver Imagen Grande"){ isPresented = true }
                
            
            Text(model.Lugar).font(.title3).bold().padding(.leading, 10)
            Text(model.Descripcion).padding(.top,-10).padding(.leading, 10).font(.callout).lineLimit(2)
            Text(model.Autor).padding(.top,-10).padding(.leading, 10).font(.caption).padding(.top)
            }
        .fullScreenCover(isPresented: $isPresented, onDismiss: {isPresented = false}, content: { PostCardImageDetailViewImage(model: model, isPresented: $isPresented).ignoresSafeArea()})
        .foregroundColor(Color("Text"))
    
        .padding(.horizontal,10)
    }
}

struct PostCardImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImageDetailView(model: Post(id: "10",Autor: "BaudoAP", Lugar: "Triguba,Choco", Url: "https://firebasestorage.googleapis.com/v0/b/baudoapswift.appspot.com/o/Pic2-50.jpg?alt=media&token=7ec8709e-9dc6-4ce3-af94-566d48251d60", Tipo: "Imagen", Descripcion: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Categoria: "Medio Ambiente"))
    }
}