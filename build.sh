#! /bin/sh

RESOURCE_PACK_NAME=TransparentGlass

RESOURCE_PACK_FILE_JAVA=${RESOURCE_PACK_NAME}.zip
RESOURCE_PACK_FILE_BEDROCK=${RESOURCE_PACK_NAME}BE.zip

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
# for Bedrock Edition
#
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR}
cp -R ${RESOURCE_PACK_NAME}/assets/minecraft/textures ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack_manifest.json        ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack.png                  ${TMPDIR}/pack_icon.png
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_BEDROCK} *)
rm -f -r ${TMPDIR}
