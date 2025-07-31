//
//  NetworkLogger.swift
//  Network
//
//  Created by Mehmet Salih Aslan on 31.07.2025.
//

import Foundation
import Logging

public protocol NetworkLogger {
    func log(
        level: LogLevel,
        message: @autoclosure () -> String
    )
}

public enum LogLevel {
    case trace
    case debug
    case info
    case notice
    case warning
    case error
    case critical
    
    public func toLoggingLevel() -> Logging.Logger.Level {
        switch self {
        case .trace:
            return .trace
        case .debug:
            return .debug
        case .info:
            return .info
        case .notice:
            return .notice
        case .warning:
            return .warning
        case .error:
            return .error
        case .critical:
            return .critical
        }
    }
}

public extension NetworkLogger {
    func log(
        request: URLRequest? = nil,
        data: Data? = nil,
        response: HTTPURLResponse? = nil,
        error: Error? = nil
    ) {
        var message = ""
        if let request = request {
            message += "\n⬅️⬅️⬅️⬅️⬅️ Request:\n\(request.logMessage())"
        }
        
        message += "\n\n➡️➡️➡️➡️➡️ Response:\n"
        
        if let statusCode = response?.statusCode {
            message += "🔢 Status code: \(statusCode)\n"
        }
        
        if let headers = response?.allHeaderFields as? [String: AnyObject] {
            message += "👤 Headers: \(headers.prettyPrint())\n"
        }
        
        if let data = data {
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: AnyObject] {
                message += "📦 Payload: \(json.prettyPrint())\n"
            } else {
                message += "📦 Payload: \(String(data: data, encoding: .utf8) ?? "")\n"
            }
        }
        
        if let error = error {
            message += "⛔️ Error: \(error.localizedDescription)\n"
            log(level: .error, message: message)
        } else {
            log(level: .info, message: message)
        }
    }
}

extension URLRequest {
    func logMessage() -> String {
        var result = ""
        result += "🎯 Endpoint: \(url!)\n"
        result += "👤 Headers: \(allHTTPHeaderFields!)\n"
        result += "⚙️ Method: \(httpMethod!)\n"
        
        if let httpBody = httpBody {
            let bodyDict = try? JSONSerialization.jsonObject(with: httpBody, options: []) as? [String: AnyObject]
            
            if let bodyDict = bodyDict {
                result += "📦 Body: \(bodyDict.prettyPrint())"
            } else if let resultString = String(data: httpBody, encoding: .utf8) {
                result += "📦 Body: \(resultString)"
            }
        }
        
        return result
    }
}

extension Dictionary where Key == String {
    func prettyPrint() -> String {
        var string = ""
        var options: JSONSerialization.WritingOptions
        if #available(iOS 13.0, macOS 11, *) {
            options = [.prettyPrinted, .withoutEscapingSlashes]
        } else {
            options = [.prettyPrinted]
        }
        if let data = try? JSONSerialization.data(withJSONObject: self, options: options) {
            if let nstr = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                string = nstr as String
            }
        }
        return string
    }
}
