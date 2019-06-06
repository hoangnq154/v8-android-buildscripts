#!/bin/bash -e
source $(dirname $0)/env.sh

######################################################################################
# Patchset management that manage files by commented purpose
######################################################################################
V8_PATCHSET=(
  # V8 shared library support
  "v8_shared_library.patch"

  # Fix cxx includes not found for use_custom_libcxx=false
  "ndk_cxx_stl_root.patch"
)

######################################################################################
# Patchset management end
######################################################################################

for patch in "${V8_PATCHSET[@]}"
do
    printf "### Patch set: $patch\n"
    patch -d $V8_DIR -p1 < $PATCHES_DIR/$patch
done
