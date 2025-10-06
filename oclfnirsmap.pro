# ------------------------------------------------------------------------
# author Sergey Slyutov
# date October 52, 2025
# media-rite media application for common purposes.
# ------------------------------------------------------------------------

TEMPLATE = app 

TARGET = oclfnirsmap

TARGET_EXT = .exe #use this tp stop qmake adding a number following TARGET filename.

VERSION = 1.0.1.0

QMAKE_TARGET_PRODUCT = "oclfnirsmap"

QMAKE_TARGET_COPYRIGHT =  "Sergey Slyutov" 

QMAKE_TARGET_DESCRIPTION = "fnirs map configiration and data monitor"

QT += widgets core gui multimedia multimediawidgets sql qml quick quickcontrols2 quickwidgets

CONFIG += c++20

CONFIG += debug

DESTDIR_DEBUG = ./DEBUG

DETIDIR_RELEASE = ./RELEASE

QMAKE_CXXFLAGS += /MP

RESOURCES = oclfnirsmap.qrc

INCLUDEPATH += $$PWD/../thirdparty/Win/OpenCL-SDK/install/include

LIBS += -L$$PWD/../thirdparty/Win/OpenCL-SDK/install/lib

LIBS += -lOpenCL
LIBS += -lOpenCLExt
LIBS += -lOpenCLSDK
LIBS += -lOpenCLSDKC
LIBS += -lOpenCLSDKCpp
LIBS += -lOpenCLUtils
LIBS += -lOpenCLUtilsCpp

SOURCE += sphera.cpp

# RC_ICONS = ./resources/sss_b2_copy.ico

# include (media-rite.pri)
