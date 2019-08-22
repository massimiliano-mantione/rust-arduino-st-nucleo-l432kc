#![no_std]
use core::panic::PanicInfo;

//mod arduino;
//use arduino::{delay, micros, serial_phex};

#[panic_handler]
#[no_mangle]
pub extern "C" fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

extern "C" {
    pub fn serial_config(baud: i32);
    pub fn serial_message(p: *const u8);
    pub fn wait_msec(msec: i32);
}

fn print(msg: &str) {
    unsafe {
        serial_message(msg.as_bytes().as_ptr());
    }
}

#[no_mangle]
pub extern "C" fn main_setup() -> () {
    unsafe {
        serial_config(38400);
        print("Config done\n\0");
    }
}

#[no_mangle]
pub extern "C" fn main_loop() -> () {
    loop {
        unsafe {
            print("Hello from Rust!\n\0");
            wait_msec(500);
        }
    }
}
