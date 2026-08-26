cmake_minimum_required(VERSION 3.21)

project(ClarityCheck VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick)
qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(ClarityCheck
    src/main.cpp
    src/ScoringEngine.h
    src/ScoringEngine.cpp
    src/InstrumentData.h
    src/InstrumentData.cpp
    src/AppState.h
    src/AppState.cpp
)

qt_add_qml_module(ClarityCheck
    URI ClarityCheck
    VERSION 1.0
    QML_FILES
        qml/Main.qml
        qml/WelcomeScreen.qml
        qml/InstrumentIntroScreen.qml
        qml/QuestionScreen.qml
        qml/CrisisScreen.qml
        qml/CrisisResourcesScreen.qml
        qml/ResultsScreen.qml
)

target_link_libraries(ClarityCheck PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
)

# Tests — desktop kit only (Qt Test does not run in Wasm target)
if(NOT EMSCRIPTEN)
    enable_testing()
    add_subdirectory(tests)
endif()

# WebAssembly-specific settings
if(EMSCRIPTEN)
    set_target_properties(ClarityCheck PROPERTIES
        QT_WASM_INITIAL_MEMORY "52428800"   # 50 MB
    )
endif()
