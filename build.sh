#! /bin/sh

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
cp -R ${RESOURCE_PACK_NAME}/assets      ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack.mcmeta ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack.png    ${TMPDIR}/
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_JAVA} *)
rm -f -r ${TMPDIR}

#
# for Bedrock Edition (Windows10)
#
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR}
cp -R ${RESOURCE_PACK_NAME}/assets/minecraft/textures ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack_manifest.json        ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack.png                  ${TMPDIR}/pack_icon.png
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
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_BEDROCK_PORTABLE} *)
rm -f -r ${TMPDIR}
