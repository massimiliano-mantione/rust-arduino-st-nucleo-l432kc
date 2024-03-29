#include "rust-main-lib.h"

extern "C" void rust_serial_config(int baud);
void rust_serial_config(int baud)
{
  Serial.begin(baud);
}

extern "C" void rust_serial_message(const char *msg);
void rust_serial_message(const char *msg)
{
  Serial.print(msg);
}

extern "C" void rust_wait_msec(int msec);
void rust_wait_msec(int msec)
{
  delay(msec);
}

void setup()
{
  rust_serial_config(38400);
  rust_serial_message("Hello CONFIG\n");
  main_setup();
  rust_wait_msec(500);
}

void loop()
{
  rust_serial_message("Hello PRE\n");
  main_loop();
  rust_serial_message("Hello POST\n");
  rust_wait_msec(500);
}
