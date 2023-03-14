//
//  PostImageDetailViewImage.swift
//  BaudoAP
//
//  Created by Codez on 12/03/23.
//


import SwiftUI
import SDWebImageSwiftUI

struct PostCardImageDetailViewImage: View {
    
    var model: Post
    @Binding var isPresented: Bool
    
    var body: some View {

                ZStack{
                    ScrollView(.horizontal){
                    WebImage(url: URL(string: model.Url))
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    
                    //                .border(Color.red, width: 3)
                        
                    }
                    Button("Close"){
                        isPresented = false
                    }.foregroundColor(.white)
                        .background(Color.red)
            }
        }
}

struct PostCardImageDetailViewImage_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImageDetailViewImage(model: Post(id: "10",Autor: "BaudoAP", Lugar: "Triguba,Choco", Url: "https://firebasestorage.googleapis.com/v0/b/baudoapswift.appspot.com/o/Pic2-50.jpg?alt=media&token=7ec8709e-9dc6-4ce3-af94-566d48251d60", Tipo: "Imagen", Descripcion: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Categoria: "Medio Ambiente"), isPresented: .constant(false))
    }
}