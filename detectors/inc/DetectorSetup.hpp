#pragma once
#include "Detector.hpp"
// #include "YoloV4.hpp"
// #include "YoloVn.hpp"
// #include "YOLOv10.hpp"
// #include "YoloNas.hpp"
// #include "RtDetr.hpp"
// #include "RtDetrUltralytics.hpp"


class DetectorSetup {
public:
    static std::unique_ptr<Detector> createDetector(const std::string& detectorType, const ModelInfo& model_info);

private:
    static std::unordered_map<std::string, std::function<std::unique_ptr<Detector>()>> getDetectorCreators(const ModelInfo& model_info);
};