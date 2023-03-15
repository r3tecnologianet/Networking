#! /bin/sh -e
# Output Path
OUTPUT_DIR_PATH=$(pwd)/output/
# Xcode Project Name
PROJECT_NAME="Networking"

# Prints the archive path for simulator
function archivePathSimulator {
    local DIR=${OUTPUT_DIR_PATH}/archives/"${1}-SIMULATOR"
    echo "${DIR}"
}

# Prints the archive path for device
function archivePathDevice {
    local DIR=${OUTPUT_DIR_PATH}/archives/"${1}-DEVICE"
    echo "${DIR}"
}

# Prints the archive path for device
function archivePathDevice {
    local DIR=${OUTPUT_DIR_PATH}/archives/"${1}-DEVICE"
    echo "${DIR}"
}

# Builds archive for iOS/tvOS simulator & device
function buildArchive {
    SCHEME=${1}
    archive $SCHEME "generic/platform=iOS Simulator" $(archivePathSimulator $SCHEME)
    archive $SCHEME "generic/platform=iOS" $(archivePathDevice $SCHEME)
    # archive "${SCHEME}TV" "generic/platform=tvOS Simulator" $(archivePathSimulator "${SCHEME}TV")
    # archive "${SCHEME}TV" "generic/platform=tvOS" $(archivePathDevice "${SCHEME}TV")
}

function archive {
    echo "📨 Starts archiving the scheme: ${1} for destination: ${2};\n📝 Archive path: ${3}.xcarchive"
    xcodebuild archive \
    -project ${PROJECT_NAME}.xcodeproj \
    -scheme ${1} \
    -destination "${2}" \
    -archivePath "${3}" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES | xcpretty
}

# Creates xc framework
function createXCFramework {
    FRAMEWORK_ARCHIVE_PATH_POSTFIX=".xcarchive/Products/Library/Frameworks"
    FRAMEWORK_SIMULATOR_DIR="$(archivePathSimulator $1)${FRAMEWORK_ARCHIVE_PATH_POSTFIX}"
    FRAMEWORK_DEVICE_DIR="$(archivePathDevice $1)${FRAMEWORK_ARCHIVE_PATH_POSTFIX}"
    xcodebuild -create-xcframework \
    -framework ${FRAMEWORK_SIMULATOR_DIR}/${1}.framework \
    -framework ${FRAMEWORK_DEVICE_DIR}/${1}.framework \
    -output ${OUTPUT_DIR_PATH}/xcframeworks/${1}.xcframework
}

echo "🚀 Process started 🚀"
xcodegen
echo "📂 Evaluating Output Dir"
echo "🧼 Cleaning the dir: ${OUTPUT_DIR_PATH}"
rm -rf $OUTPUT_DIR_PATH
DYNAMIC_FRAMEWORK=Networking
echo "📝 Archive $DYNAMIC_FRAMEWORK"
buildArchive ${DYNAMIC_FRAMEWORK}
echo "🗜 Create $DYNAMIC_FRAMEWORK.xcframework"
createXCFramework ${DYNAMIC_FRAMEWORK}
mv ${OUTPUT_DIR_PATH}/xcframeworks/${DYNAMIC_FRAMEWORK}.xcframework ${PWD}/${DYNAMIC_FRAMEWORK}.xcframework
rm -rf $OUTPUT_DIR_PATH/