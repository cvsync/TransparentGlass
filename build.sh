#! /bin/sh

VER_MAJOR=1
VER_MINOR=11
UUID1=84efce45-6968-4945-92f5-864af6aee9e2
UUID2=32b5da4e-b95b-450c-a287-83f8f2db7930

RESOURCE_PACK_NAME=TransparentGlass

RESOURCE_PACK_FILE_JAVA=${RESOURCE_PACK_NAME}.zip
RESOURCE_PACK_FILE_BEDROCK_WIN10=${RESOURCE_PACK_NAME}BE.zip
RESOURCE_PACK_FILE_BEDROCK_PORTABLE=${RESOURCE_PACK_NAME}.mcpack

TMPDIR=./tmp

#
# for Java Edition (1.13 or above)
#
TEXTURES_SRCDIR=${RESOURCE_PACK_NAME}/assets/minecraft/textures/blocks
TEXTURES_DSTDIR=${TMPDIR}/assets/minecraft/textures/block
PACK_FORMAT=13
rm -f ${RESOURCE_PACK_FILE_JAVA}
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR} ${TMPDIR}/assets
mkdir -p ${TMPDIR}/assets/minecraft ${TMPDIR}/assets/minecraft/textures ${TMPDIR}/assets/minecraft/textures/block
cp ${TEXTURES_SRCDIR}/glass.png ${TEXTURES_DSTDIR}/glass.png
for _color in black blue brown cyan gray green light_blue lime magenta orange pink purple red white yellow
do
	cp ${TEXTURES_SRCDIR}/glass_${_color}.png ${TEXTURES_DSTDIR}/${_color}_stained_glass.png
done
# silver -> light_gray
cp ${TEXTURES_SRCDIR}/glass_silver.png ${TEXTURES_DSTDIR}/light_gray_stained_glass.png
cp -R ${RESOURCE_PACK_NAME}/pack.png ${TMPDIR}/
cat ${RESOURCE_PACK_NAME}/pack.mcmeta | \
sed "s/XXXPACKFORMATXXX/${PACK_FORMAT}/g" | \
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
