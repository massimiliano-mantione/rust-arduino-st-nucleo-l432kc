cargo xbuild --release --target thumbv7em-none-eabihf

ARDUINODIR=$HOME/Arduino
LIBNAME=rust_main_lib

ARDUINOINSTDIR=$HOME/.arduino15
ARDUINOPLATFORMDIR=$ARDUINOINSTDIR/packages/STM32/hardware/stm32/1.6.1

#MAINDIR=$ARDUINODIR/libraries/rust-main-lib
#SRCDIR=$MAINDIR/src
#LIBDIR=$SRCDIR/cortex-m4
#SKETCHNAME=rust-main-sketch
#SKETCHDIR=$ARDUINODIR/$SKETCHNAME
#mkdir -p $LIBDIR
#mkdir -p $SKETCHDIR
#cp target/thumbv7em-none-eabihf/release/lib$LIBNAME.a $LIBDIR/librust-main-lib.a
#cp rust-main-lib.h $SRCDIR
#cp library.properties $MAINDIR
#cp src/$SKETCHNAME.ino $SKETCHDIR

MAINDIR=$ARDUINODIR/rust-main-lib
cp target/thumbv7em-none-eabihf/release/lib$LIBNAME.a $MAINDIR/librust-main-lib.a
cp rust-main-lib.h $MAINDIR
SKETCHNAME=rust-main-sketch
SKETCHDIR=$ARDUINODIR/$SKETCHNAME
cp src/$SKETCHNAME.ino $SKETCHDIR
cp platform.local.txt $ARDUINOPLATFORMDIR
