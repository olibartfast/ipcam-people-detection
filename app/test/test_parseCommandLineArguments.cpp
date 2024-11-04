#include <gtest/gtest.h>
#include "CommandLineParser.hpp"

TEST(ParseCommandLineArguments, Basic) {
    // Simulate command-line arguments
    const char* argv[] = {
        "program",
        "--type=yolov5",
        "--source=input.mp4",
        "--weights=model.weights",
        "--config=model.cfg",
        "--labels=labels.txt",
        "--use-gpu",
        "--min_confidence=0.5"
    };
    int argc = sizeof(argv) / sizeof(argv[0]);
    std::ofstream myFile("fake_model.cfg");
    myFile.close();
    std::ofstream myFile2("fake_model.weights");
    myFile2.close();
    AppConfig config = CommandLineParser::parseCommandLineArguments(argc, const_cast<char**>(argv));


    EXPECT_EQ(config.detectorType, "yolov5");
    EXPECT_EQ(config.source, "input.mp4");
    EXPECT_EQ(config.weights, "fake_model.weights");
    EXPECT_EQ(config.config, "fake_model.cfg");
    EXPECT_EQ(config.labelsPath, "labels.txt");
    EXPECT_TRUE(config.use_gpu);
    EXPECT_FLOAT_EQ(config.confidenceThreshold, 0.5);
}