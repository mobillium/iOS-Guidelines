import UIKit

public extension FontConvertible.Font {
    
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
    
    static func font(_ weight: FontWeight, size: FontSize) -> UIFont {
        let font: UIFont
        switch weight {
        case .nunitoSemiBold:
            font = FontFamily.Nunito.semiBold.font(size: size.rawValue)
        case .nunitoBold:
            font = FontFamily.Nunito.bold.font(size: size.rawValue)
        case .nunitoExtraBold:
            font = FontFamily.Nunito.extraBold.font(size: size.rawValue)
        }
        return font
    }
    
}
