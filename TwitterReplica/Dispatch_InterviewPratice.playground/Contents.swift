import Foundation

print("1")

DispatchQueue.main.async {
    print("3")
    print("3after")
    DispatchQueue.main.async {
        print("4")
        DispatchQueue.main.sync {
            print("7")
        }
    }
    DispatchQueue.main.async {
        print("6")
    }
    
    print("5")
}

print("2")

// Heavy work in background
//DispatchQueue.global().async {
//    print("Processing images in background")
//    // Heavy calculation here
//
//    // Update UI on main queue when done
//    DispatchQueue.main.async {
//        print("Showing processed images on screen")
//    }
//}



//print("A")
//
//DispatchQueue.main.async {
//    print("C")
//    
//    DispatchQueue.main.async {
//        print("D")
//    }
//    
//    DispatchQueue.main.async {
//        print("E")
//        
//        DispatchQueue.main.async {
//            print("G")
//        }
//        
//        DispatchQueue.main.sync {
//            print("H")
//            DispatchQueue.main.sync {
//                print("J")
//            }
//            print("I")
//        }
//    }
//    
//    DispatchQueue.main.async {
//        print("F")
//    }
//}
//
//print("B")


//print("App starting")
//
////// Heavy work in background
////DispatchQueue.global().async {
////    print("Processing images in background")
////    // Heavy calculation here
////    
////    // Update UI on main queue when done
////    DispatchQueue.main.async {
////        print("Showing processed images on screen")
////    }
////    
////}
//
//DispatchQueue.main.async {
//   
//    print("i will print before Global")
//    
//    DispatchQueue.main.async {
//        print("i will print after app is responsive")
//    }
//    
//    DispatchQueue.global().async {
//        print("hey i will print after the main")
//    }
//    
//    DispatchQueue.main.sync {
//        print("I will print before line : 53")
//    }
//    
//}
//
//print("App is responsive, user can interact")
