import SwiftUI

public extension SwiftUI.Font {
    
    enum FontWeight {
        case nunitoSemiBold
        case nunitoBold
        case nunitoExtraBold
    }
    
    enum FontSize {
        /// 11
        case xSmall
        
        /// 12
        case small
        
        /// 13
        case medium
        
        /// 14
        case large
        
        /// 15
        case xLarge
        
        /// 16
        case xxLarge
        
        /// custom
        case custom(size: CGFloat)
        
        public var rawValue: CGFloat {
            switch self {
            case .xSmall:           return 11
            case .small:            return 12
            case .medium:           return 13
            case .large:            return 14
            case .xLarge:           return 15
            case .xxLarge:          return 16
            case .custom(let size): return size
            }
        }
    }
    
    static func font(_ weight: FontWeight, size: FontSize) -> SwiftUI.Font {
        let font: SwiftUI.Font
        switch weight {
        case .nunitoSemiBold:
            font = FontFamily.Nunito.semiBold.swiftUIFont(size: size.rawValue)
        case .nunitoBold:
            font = FontFamily.Nunito.bold.swiftUIFont(size: size.rawValue)
        case .nunitoExtraBold:
            font = FontFamily.Nunito.extraBold.swiftUIFont(size: size.rawValue)
        }
        return font
    }
    
}
