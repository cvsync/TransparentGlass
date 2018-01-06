#! /bin/sh

VER_MAJOR=1
VER_MINOR=1

RESOURCE_PACK_NAME=TransparentGlass

RESOURCE_PACK_FILE_JAVA=${RESOURCE_PACK_NAME}.zip
RESOURCE_PACK_FILE_BEDROCK_WIN10=${RESOURCE_PACK_NAME}BE.zip
RESOURCE_PACK_FILE_BEDROCK_PORTABLE=${RESOURCE_PACK_NAME}.mcpack

TMPDIR=./tmp

rm -f ${RESOURCE_PACK_FILE_JAVA} ${RESOURCE_PACK_FILE_BEDROCK}

#
# for Java Edition
#
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR}
cp -R ${RESOURCE_PACK_NAME}/assets   ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack.png ${TMPDIR}/
cat ${RESOURCE_PACK_NAME}/pack.mcmeta | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
cat > ${TMPDIR}/pack.mcmeta
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_JAVA} *)
rm -f -r ${TMPDIR}

#
# for Bedrock Edition (Windows10)
#
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR}
cp -R ${RESOURCE_PACK_NAME}/assets/minecraft/textures ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack.png                  ${TMPDIR}/pack_icon.png
cat ${RESOURCE_PACK_NAME}/pack_manifest.json | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
cat > ${TMPDIR}/pack_manifest.json
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_BEDROCK_WIN10} *)
rm -f -r ${TMPDIR}

#
# for Bedrock Edition (iOS)
#
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR}
cp -R ${RESOURCE_PACK_NAME}/assets/minecraft/textures ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/manifest.json             ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack.png                  ${TMPDIR}/pack_icon.png
cat ${RESOURCE_PACK_NAME}/manifest.json | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
cat > ${TMPDIR}/manifest.json
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_BEDROCK_PORTABLE} *)
rm -f -r ${TMPDIR}
