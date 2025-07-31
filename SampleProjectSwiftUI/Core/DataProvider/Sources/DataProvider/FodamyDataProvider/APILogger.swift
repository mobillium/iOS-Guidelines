//
//  APILogger.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 15.11.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Logging
import Network

public struct APILogger: NetworkLogger {
    private let logger: Logging.Logger

    public init(label: String) {
        logger = Logging.Logger(label: label)
    }

    public func log(level: LogLevel, message: @autoclosure () -> String) {
        logger.log(
            level: level.toLoggingLevel(),
            .init(stringLiteral: message())
        )
    }
}

public struct APINoLogger: NetworkLogger {
    private let logger: Logging.Logger

    public init(label: String) {
        logger = Logging.Logger(label: label)
    }

    public func log(level _: LogLevel, message _: @autoclosure () -> String) {
        // Do nothing
    }
}
