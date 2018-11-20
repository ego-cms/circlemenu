//
// Created by Pavel Chehov on 20/11/2018.
// Copyright (c) 2018 Pavel Chehov. All rights reserved.
//

import Foundation

final class JsonReader {
    public static func readJson(fileName: String) -> Any? {
        do {
            let podBundle = Bundle(for: JsonReader.self)
            if let bundleURL = podBundle.url(forResource: "EGOCircleMenu", withExtension: "bundle") {
                if let bundle = Bundle(url: bundleURL) {
                    if let file = bundle.url(forResource: fileName, withExtension: "json") {
                        let data = try Data(contentsOf: file)
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let jsonObject = json as? [String: Any] {
                            return jsonObject
                        } else {
                            assertionFailure("JSON is invalid")
                            return nil
                        }
                    } else {
                        assertionFailure("No file found!")
                        return nil
                    }
                } else {
                    assertionFailure("Could not load the bundle")
                    return nil
                }
            } else {
                assertionFailure("Could not create a path to the bundle")
                return nil
            }
        } catch {
            return nil
        }
    }
}
