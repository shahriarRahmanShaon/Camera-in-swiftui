import SwiftUI
import UIKit
public struct ImagePicker {
  
    public init() {}
    
    struct Camera: UIViewControllerRepresentable{
        typealias pickedImageHandler = (UIImage?) -> Void
        var handlePickedImage: pickedImageHandler
        
        func makeUIViewController(context: Context) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.sourceType = .photoLibrary
            picker.delegate = context.coordinator
            
            return picker
        }
        func makeCoordinator() -> Coordinator {
            Coordinator(handlePickedImage)
        }
        class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
            var handlePickedImage: pickedImageHandler
            
            init(_ handlePickedImage: @escaping pickedImageHandler){
                self.handlePickedImage = handlePickedImage
            }
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                handlePickedImage(info[.originalImage] as? UIImage)
            }
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                handlePickedImage(nil)
            }
        }
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
            
        }
        
    }
    

}
