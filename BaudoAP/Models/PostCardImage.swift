//
//  SwiftUIView.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardImage: View {
    
    var model: Post
    
    @State var isPresentedImage1: Bool = false
    
    var body: some View {
        Button {
            isPresentedImage1 = true
        } label: {
            VStack(alignment: .leading, spacing: 10){
                WebImage(url: URL(string: model.MainMediaUrl))
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(19)
                
    //                .border(Color.red, width: 3)
                    
                
               //WebImage(url: URL(string: model.MainMediaUrl))
                    
                
                HStack(alignment: .center){
                    Spacer()
                    Image("Reactions").padding(.top,-40)
                    Spacer()
                }
                
                Text(model.Location)
                    .font(.custom(
                            "SofiaSans",
                            size: 18,
                            relativeTo: .title))
                    
                    .bold()
                    .padding(.top,0)
                    .padding(.leading, 10)
                Text(model.Description)
                    .padding(.top,-5)
                    .padding(.leading, 10)
                    .font(.custom(
                            "SofiaSans",
                            size: 11,
                            relativeTo: .body))
                    .lineLimit(3)
                Text("Foto por: \(model.Author)").padding(.top,-5)
                    .padding(.leading, 10).font(.caption)
                    .padding(10)
            }.fullScreenCover (isPresented: $isPresentedImage1,
                               onDismiss: { isPresentedImage1 = false },
                               content: { PostCardImageDetailView(model: model, isPresentedImage1: $isPresentedImage1).ignoresSafeArea()})
            .background(Color("BackgroundCards"))
             .cornerRadius(19)
            .multilineTextAlignment(.leading)
            .foregroundColor(Color("Text"))
            .padding(.leading,40).padding(.trailing,40).padding(.bottom,30)
        }

    }
}

struct PostCardImage_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImage(model: Post(id: "10",Thumbnail:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FFoto5-50.jpg?alt=media&token=d045af3c-eb19-41fa-bd87-26053298f427",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FFoto5-50.jpg?alt=media&token=d045af3c-eb19-41fa-bd87-26053298f427", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Title",CreationDate: "23/Marzo/2023"))
    }
}
