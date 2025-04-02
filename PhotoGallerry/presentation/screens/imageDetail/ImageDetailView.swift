//
//  PhotoDetailScreen.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 9.02.2025.
//

import SwiftUI

struct ImageDetailView: View {
    
    var image:ImageContent
    @ObservedObject var imageDetailViewModel = ImageDetailViewModel()
    @State var tags:[String]? = nil
    @State var imageLoadedSucess = false
    @State var showMessage = false
    
    func shareImageUrl(textUrl:String){
        let activityVC = UIActivityViewController(activityItems: [textUrl], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true)
        }
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height / 2.5
            VStack(alignment:.leading){
                if let url = image.imageUrl {
                    ImageBox(
                        url: url,
                        height: height,
                        imageLoadedSuccess: {
                            imageLoadedSucess = true
                        }
                    )
                    .padding([.leading, .trailing], 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                    
                HStack{
                    if imageLoadedSucess {
                        if let userImageURL = image.userImageUrl {
                            AsyncImage(url:URL(string: userImageURL)){ phase in
                                switch phase {
                                case .empty:
                                    Circle()
                                        .foregroundStyle(.gray)
                                        .frame(width: 36,height: 36)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .clipShape(Circle())
                                        .padding(5)
                                        .frame(width:36,height: 36)
                                    
                                case .failure:
                                    Circle()
                                        .foregroundStyle(.gray)
                                        .frame(width: 36,height: 36)
                                    
                                @unknown default:
                                    Circle()
                                        .foregroundStyle(.gray)
                                        .frame(width: 36,height: 36)
                                }
                            }
                        }
                        
                        Text(image.user ?? "")
                        
                        Spacer()
                        
                        Image(systemName: imageDetailViewModel.isMark ? "bookmark.fill" : "bookmark" )
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.black)
                            .frame(width: 24,height: 36)
                            .onTapGesture {
                                imageDetailViewModel.setMarkImage(image: image)
                            }
                        
                        if let pageUrl = image.pageUrl {
                            Image("ic_share")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(.black)
                                .frame(width: 36,height: 36)
                                .onTapGesture {
                                    shareImageUrl(textUrl: pageUrl)
                                }
                        }
                        
                        if let imageUrl = image.imageUrl {
                            Image("ic_download")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(.black)
                                .frame(width: 36,height: 36)
                                .padding(.leading,10)
                                .onTapGesture {
                                    imageDetailViewModel.downloadImage(url:imageUrl)
                                    showMessage = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                        showMessage = false
                                    }
                                }
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding([.leading, .trailing],30)
                .padding(.bottom, 20)
                
                if imageLoadedSucess && tags != nil{
                    
                    Text("Tags")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundColor(.black)
                        .padding(.leading,20)
                        .padding(.bottom,20)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHGrid(
                            rows: [
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ]
                        ){
                            ForEach(tags!,id:\.hashValue){ tag in
                                RoundedBox(text:tag,color:.gray).padding(.leading,10)
                            }
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .onAppear{
                tags = image.tags
                imageDetailViewModel.isFavorite(id: image.id)
            }
        }
        .overlay{
            VStack{
                if showMessage{
                    MessagePopup(message: "Fotoğraf başarıyla indirildi.")
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 50)
            .animation(.easeInOut, value: showMessage)
        }
        .background(Color("color_bg"))
    }
}

#Preview {
    ImageDetailView(
        image:ImageContent(id:1,imageUrl:"url")
    )
}
