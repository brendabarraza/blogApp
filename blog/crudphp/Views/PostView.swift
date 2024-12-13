

import SwiftUI

struct PostView: View {
    
    @StateObject var crud = Crud()
    @State private var titulo = ""
    @State private var contenido = ""
    
    @State private var showImagePIcker = false
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    func loadImage(){
        guard let inputImage = inputImage else { return  }
        image = Image(uiImage: inputImage)
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $titulo)
            TextEditor(text: $contenido)
            Button {
                if image == nil {
                    crud.save(titulo: titulo, contenido: contenido, id: "", editar: false)
                }else{
                    crud.save2(titulo: titulo, contenido: contenido, imagen: inputImage!)
                }
                titulo = ""
                contenido = ""
                image = nil
            } label: {
                Text("Save post")
            }
            .alert(crud.mensaje, isPresented: $crud.show) {
                Button("Accept", role: .none) {}
            }
            image?
                .resizable()
                .scaledToFit()
        }.navigationTitle("Create post")
            .toolbar{
                Button {
                    showImagePIcker = true
                } label: {
                    Image(systemName: "camera")
                }
            }
            .onChange(of: inputImage) { _ in
                loadImage()
            }.sheet(isPresented: $showImagePIcker) {
                ImagePicker(image: $inputImage)
            }


    }
}

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.image = selectedImage
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
