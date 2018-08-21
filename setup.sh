#!/bin/bash

echo "Symlinking stuff..."
echo ""
cd ..

ln -nsv android-crawl-console/crawl-ref/source jni

cd assets
ln -sv ../android-crawl-console/crawl-ref/source/dat

ln -sv ../android-crawl-console/crawl-ref/docs

ln -sv ../android-crawl-console/crawl-ref/settings

echo "Making docs..."
echo ""
cd ../android-crawl-console/crawl-ref/source
make docs
cd ../docs/
# These files need to be brought up from the root directory
ln -sv ../CREDITS.txt
ln -sv ../INSTALL.txt

echo "Running perl scripts..."
echo ""
cd ../source/
util/art-data.pl
util/gen-mst.pl
util/cmd-name.pl
util/gen-luatags.pl
util/gen-mi-enum
util/gen_ver.pl build.h
util/gen-cflg.pl compflag.h none armeabi android android

echo "Running make syscalls.h..."
echo ""
make syscalls.h

echo "Running make config.h..."
echo ""
make config.h

echo "Running make mi-enum.h..."
echo ""
make mi-enum.h

echo "Running make cmd-name.h..."
echo ""
make cmd-name.h

echo "Running make in rltiles..."
echo ""
cd rltiles
make STDFLAG=-std=c++11

echo "Setup complete. Run your NDK build tool (ndk-build) from within the project directory to build the project"
