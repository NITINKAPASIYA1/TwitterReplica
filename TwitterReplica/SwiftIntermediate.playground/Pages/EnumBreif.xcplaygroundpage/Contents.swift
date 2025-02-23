import Foundation


//MARK: standard Enum

enum ColorScheme {
    case light
    case dark
    case custom
}

//Utilize this enum

var scheme : ColorScheme = .dark
scheme = .light

//switch scheme {
//    case .light:
//        print("Color is light")
//    case .dark:
//        print("Color is dark")
//    case .custom:
//        print("Color is custom type")
//}


//MARK: Enum Raw Value

enum WeekDay : String {
    case Monday = "Mon"
    case Tuesday = "Tue"
    case Wednesday = "Wed"
    case Thursday = "Thu"
    case Friday = "Fri"
    case Saturday = "Sat"
    case Sunday = "Sun"
}

let today = WeekDay.Tuesday
//print("DEBUG : Today is \(today)")
//print("DEBUG : Today is \(today.rawValue)")

enum APIStatusCode : Int {
    case success  = 200
    case unauthorized = 401
    case notFound = 404
    case serverError = 500
}

let status = APIStatusCode.serverError
//print("DEBUG : Status Code is \(status.rawValue)")

//switch status{
//    case .success:
//        print("Do something with data")
//    case .unauthorized:
//        print("api request is not authorized : \(status.rawValue)")
//    case .notFound:
//        print("Their is no data : \(status.rawValue)")
//    case .serverError:
//        print("Server Error : \(status.rawValue)")
//}


//MARK: - Associated Values and computed properties

enum OrderStatus {
    case processed
    case shipped(String)
    case delivered(String)
    
    var value : String {
        switch self {
            case .processed:
                return "Processed"
            case .delivered(let idIS):
                return "Delivered is : \(idIS)"
            case .shipped(let trackingID):
                return "Shipped is : \(trackingID)"
        }
    }
}



var statuss: OrderStatus = .processed
print(statuss.value)

statuss = .shipped(NSUUID().uuidString)
print(statuss.value)

statuss = .delivered(NSUUID().uuidString)
print(statuss)
print(statuss.value)
