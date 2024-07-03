# Include framework-specific source files and libraries
if (DEFAULT_BACKEND STREQUAL "OPENCV_DNN")
    target_include_directories(${PROJECT_NAME} PRIVATE ${INFER_ROOT}/src/opencv-dnn)
elseif (DEFAULT_BACKEND STREQUAL "ONNX_RUNTIME")
    target_include_directories(${PROJECT_NAME} PRIVATE ${ONNX_RUNTIME_DIR}/include ${INFER_ROOT}/src/onnx-runtime)
    target_link_directories(${PROJECT_NAME} PRIVATE ${ONNX_RUNTIME_DIR}/lib)
    target_link_libraries(${PROJECT_NAME} PRIVATE ${ONNX_RUNTIME_DIR}/lib/libonnxruntime.so)
elseif (DEFAULT_BACKEND STREQUAL "LIBTORCH")
    target_include_directories(${PROJECT_NAME} PRIVATE ${INFER_ROOT}/src/libtorch)
    target_link_libraries(${PROJECT_NAME} PRIVATE ${TORCH_LIBRARIES})
elseif (DEFAULT_BACKEND STREQUAL "TENSORRT")
    target_include_directories(${PROJECT_NAME} PRIVATE /usr/local/cuda/include ${TENSORRT_DIR}/include ${INFER_ROOT}/src/tensorrt)
    target_link_directories(${PROJECT_NAME} PRIVATE  /usr/local/cuda/lib64 ${TENSORRT_DIR}/lib)
    target_link_libraries(${PROJECT_NAME} PRIVATE nvinfer nvonnxparser cudart)
elseif(DEFAULT_BACKEND STREQUAL "LIBTENSORFLOW" )
    target_include_directories(${PROJECT_NAME} PRIVATE ${TensorFlow_INCLUDE_DIRS} ${INFER_ROOT}/src/libtensorflow)
    target_link_libraries(${PROJECT_NAME} PRIVATE ${TensorFlow_LIBRARIES})  
elseif(DEFAULT_BACKEND STREQUAL "OPENVINO")
    target_include_directories(${PROJECT_NAME} PRIVATE ${InferenceEngine_INCLUDE_DIRS} ${INFER_ROOT}/src/openvino)
    target_link_libraries(${PROJECT_NAME} PRIVATE openvino::runtime )
endif()
