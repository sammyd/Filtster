/*
*   Copyright 2015 Sam Davies
*
*   Licensed under the Apache License, Version 2.0 (the "License");
*   you may not use this file except in compliance with the License.
*   You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
*   Unless required by applicable law or agreed to in writing, software
*   distributed under the License is distributed on an "AS IS" BASIS,
*   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*   See the License for the specific language governing permissions and
*   limitations under the License.
*/

import Foundation

public protocol FilsterFilterDelegate {
  func outputImageDidUpdate(outputImage: CIImage)
}

public class FilsterFilter {
  // MARK:- Public properties
  public var delegate: FilsterFilterDelegate?
  
  public init() {
  }
  
  public var inputImage: CIImage! {
    didSet {
      performFilter()
    }
  }
  
  // MARK:- Filter Parameters
  public var vignetteIntensity: Double = 1.0 {
    didSet {
      performFilter()
    }
  }
  
  public var vignetteRadius: Double = 0.5 {
    didSet {
      performFilter()
    }
  }
  
  public var sepiaIntensity: Double = 1.0 {
    didSet {
      performFilter()
    }
  }
  
  // MARK:- Private methods
  private func performFilter() {
    if let inputImage = inputImage {
      let filter =     vignette(vignetteRadius, vignetteIntensity)
                   >>> sepia(sepiaIntensity)
      delegate?.outputImageDidUpdate(filter(inputImage))
    }
  }
}