#! /bin/sh

VER_MAJOR=1
VER_MINOR=2
UUID1=84efce45-6968-4945-92f5-864af6aee9e2
UUID2=32b5da4e-b95b-450c-a287-83f8f2db7930

RESOURCE_PACK_NAME=TransparentGlass

RESOURCE_PACK_FILE_JAVA=${RESOURCE_PACK_NAME}.zip
RESOURCE_PACK_FILE_BEDROCK_WIN10=${RESOURCE_PACK_NAME}BE.zip
RESOURCE_PACK_FILE_BEDROCK_PORTABLE=${RESOURCE_PACK_NAME}.mcpack

TMPDIR=./tmp

#
# for Java Edition
#
rm -f ${RESOURCE_PACK_FILE_JAVA}
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR}
cp -R ${RESOURCE_PACK_NAME}/assets   ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack.png ${TMPDIR}/
cat ${RESOURCE_PACK_NAME}/pack.mcmeta | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
sed "s/XXXUUID1XXX/${UUID1}/g" | \
sed "s/XXXUUID2XXX/${UUID2}/g" | \
cat > ${TMPDIR}/pack.mcmeta
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_JAVA} *)
rm -f -r ${TMPDIR}

#
# for Bedrock Edition (Windows10)
#
rm -f ${RESOURCE_PACK_FILE_BEDROCK_WIN10}
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR}
cp -R ${RESOURCE_PACK_NAME}/assets/minecraft/textures ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack.png                  ${TMPDIR}/pack_icon.png
cat ${RESOURCE_PACK_NAME}/pack_manifest.json | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
sed "s/XXXUUID1XXX/${UUID1}/g" | \
sed "s/XXXUUID2XXX/${UUID2}/g" | \
cat > ${TMPDIR}/pack_manifest.json
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_BEDROCK_WIN10} *)
rm -f -r ${TMPDIR}

#
# for Bedrock Edition (iOS)
#
rm -f ${RESOURCE_PACK_FILE_BEDROCK_PORTABLE}
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR}
cp -R ${RESOURCE_PACK_NAME}/assets/minecraft/textures ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/manifest.json             ${TMPDIR}/
cp -R ${RESOURCE_PACK_NAME}/pack.png                  ${TMPDIR}/pack_icon.png
cat ${RESOURCE_PACK_NAME}/manifest.json | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
sed "s/XXXUUID1XXX/${UUID1}/g" | \
sed "s/XXXUUID2XXX/${UUID2}/g" | \
cat > ${TMPDIR}/manifest.json
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_BEDROCK_PORTABLE} *)
rm -f -r ${TMPDIR}
