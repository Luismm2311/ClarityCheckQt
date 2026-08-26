find_package(Qt6 REQUIRED COMPONENTS Test)

# Shared source files used by multiple test targets
set(SCORING_SRC ${CMAKE_SOURCE_DIR}/src/ScoringEngine.cpp)
set(INSTRUMENT_SRC ${CMAKE_SOURCE_DIR}/src/InstrumentData.cpp)
set(APPSTATE_SRC ${CMAKE_SOURCE_DIR}/src/AppState.cpp)

# tst_scoring — DC-004 §6: UT-ASRS-01–08, UT-PHQ-01–12, UT-GAD-01–09
qt_add_executable(tst_scoring tst_scoring.cpp ${SCORING_SRC})
target_link_libraries(tst_scoring PRIVATE Qt6::Test)
target_include_directories(tst_scoring PRIVATE ${CMAKE_SOURCE_DIR}/src)
add_test(NAME tst_scoring COMMAND tst_scoring)

# tst_appstate — DC-004 FT-SAFE-01, FT-SAFE-02, FT-SAFE-03 and state machine
qt_add_executable(tst_appstate tst_appstate.cpp ${SCORING_SRC} ${INSTRUMENT_SRC} ${APPSTATE_SRC})
target_link_libraries(tst_appstate PRIVATE Qt6::Test Qt6::Core)
target_include_directories(tst_appstate PRIVATE ${CMAKE_SOURCE_DIR}/src)
add_test(NAME tst_appstate COMMAND tst_appstate)
