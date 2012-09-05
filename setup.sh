#!/bin/bash

echo "Symlinking stuff..."
echo ""
cd ..

ln -nsv android-crawl-console/crawl-ref/source jni

cd assets
ln -sv ../android-crawl-console/crawl-ref/source/dat

ln -sv ../android-crawl-console/crawl-ref/docs

ln -sv ../android-crawl-console/crawl-ref/settings

# README.txt is the only text file that needs to be in crawl's root directory (which we make assets)
ln -sv ../android-crawl-console/crawl-ref/README.txt 

echo "Making docs..."
echo ""
cd ../android-crawl-console/crawl-ref/source
make docs
cd ../docs/
# These files need to be brought up from the root directory
ln -sv ../CREDITS.txt
ln -sv ../INSTALL.txt
ln -sv ../licence.txt

echo "Running perl scripts..."
echo ""
cd ../source/
util/art-data.pl
util/gen-mst.pl
util/gen-luatags.pl
util/gen_ver.pl build.h
util/gen-cflg.pl compflag.h none armeabi android android

echo "Running make in rltiles..."
echo ""
cd rltiles
make

echo "Setup complete. Run your NDK build tool (ndk-build) from within the project directory to build the project"
