#!/bin/bash

TARGET_FILES=(
    "vendor/asus/sdm660-common/proprietary/vendor/bin/hw/android.hardware.gatekeeper@1.0-service-qti"
    "vendor/asus/sdm660-common/proprietary/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl-qti.so"
    "vendor/asus/sdm660-common/proprietary/vendor/lib64/hw/android.hardware.keymaster@3.0-impl-qti.so"
    "vendor/asus/sdm660-common/proprietary/vendor/bin/hw/android.hardware.keymaster@3.0-service-qti"
    "vendor/asus/sdm660-common/proprietary/vendor/lib/hw/android.hardware.keymaster@3.0-impl-qti.so"
)

for file in "${TARGET_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "Patching $file..."
        patchelf --remove-needed libhidltransport.so "$file"
        patchelf --remove-needed libhwbinder.so "$file"
    else
        echo "File not found: $file"
    fi
done
echo "Patching complete!"
