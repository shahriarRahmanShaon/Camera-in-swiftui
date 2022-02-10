import SwiftUI
import UIKit
public struct ImagePicker {
  
    public init() { }
    
    public struct Camera: UIViewControllerRepresentable{
        typealias pickedImageHandler = (UIImage?) -> Void
        var handlePickedImage: pickedImageHandler
        
        public func makeUIViewController(context: Context) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.sourceType = .photoLibrary
            picker.delegate = context.coordinator
            
            return picker
        }
        public func makeCoordinator() -> Coordinator {
            Coordinator(handlePickedImage)
        }
        public class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
            var handlePickedImage: pickedImageHandler
            
            init(_ handlePickedImage: @escaping pickedImageHandler){
                self.handlePickedImage = handlePickedImage
            }
            public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                handlePickedImage(info[.originalImage] as? UIImage)
            }
            public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                handlePickedImage(nil)
            }
        }
        public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
            
        }
        
    }
    

}
