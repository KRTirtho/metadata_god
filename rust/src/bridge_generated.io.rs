use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_ping(port_: i64) {
    wire_ping_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_read_metadata(port_: i64, file: *mut wire_uint_8_list) {
    wire_read_metadata_impl(port_, file)
}

#[no_mangle]
pub extern "C" fn wire_write_metadata(
    port_: i64,
    file: *mut wire_uint_8_list,
    metadata: *mut wire_Metadata,
) {
    wire_write_metadata_impl(port_, file, metadata)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_box_autoadd_f64_0(value: f64) -> *mut f64 {
    support::new_leak_box_ptr(value)
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_i32_0(value: i32) -> *mut i32 {
    support::new_leak_box_ptr(value)
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_image_0() -> *mut wire_Image {
    support::new_leak_box_ptr(wire_Image::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_metadata_0() -> *mut wire_Metadata {
    support::new_leak_box_ptr(wire_Metadata::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_u16_0(value: u16) -> *mut u16 {
    support::new_leak_box_ptr(value)
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_u64_0(value: u64) -> *mut u64 {
    support::new_leak_box_ptr(value)
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}

impl Wire2Api<Image> for *mut wire_Image {
    fn wire2api(self) -> Image {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Image>::wire2api(*wrap).into()
    }
}
impl Wire2Api<Metadata> for *mut wire_Metadata {
    fn wire2api(self) -> Metadata {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Metadata>::wire2api(*wrap).into()
    }
}

impl Wire2Api<Image> for wire_Image {
    fn wire2api(self) -> Image {
        Image {
            mime_type: self.mime_type.wire2api(),
            data: self.data.wire2api(),
        }
    }
}
impl Wire2Api<Metadata> for wire_Metadata {
    fn wire2api(self) -> Metadata {
        Metadata {
            title: self.title.wire2api(),
            duration_ms: self.duration_ms.wire2api(),
            artist: self.artist.wire2api(),
            album: self.album.wire2api(),
            album_artist: self.album_artist.wire2api(),
            track_number: self.track_number.wire2api(),
            track_total: self.track_total.wire2api(),
            disc_number: self.disc_number.wire2api(),
            disc_total: self.disc_total.wire2api(),
            year: self.year.wire2api(),
            genre: self.genre.wire2api(),
            picture: self.picture.wire2api(),
            file_size: self.file_size.wire2api(),
        }
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_Image {
    mime_type: *mut wire_uint_8_list,
    data: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Metadata {
    title: *mut wire_uint_8_list,
    duration_ms: *mut f64,
    artist: *mut wire_uint_8_list,
    album: *mut wire_uint_8_list,
    album_artist: *mut wire_uint_8_list,
    track_number: *mut u16,
    track_total: *mut u16,
    disc_number: *mut u16,
    disc_total: *mut u16,
    year: *mut i32,
    genre: *mut wire_uint_8_list,
    picture: *mut wire_Image,
    file_size: *mut u64,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_Image {
    fn new_with_null_ptr() -> Self {
        Self {
            mime_type: core::ptr::null_mut(),
            data: core::ptr::null_mut(),
        }
    }
}

impl NewWithNullPtr for wire_Metadata {
    fn new_with_null_ptr() -> Self {
        Self {
            title: core::ptr::null_mut(),
            duration_ms: core::ptr::null_mut(),
            artist: core::ptr::null_mut(),
            album: core::ptr::null_mut(),
            album_artist: core::ptr::null_mut(),
            track_number: core::ptr::null_mut(),
            track_total: core::ptr::null_mut(),
            disc_number: core::ptr::null_mut(),
            disc_total: core::ptr::null_mut(),
            year: core::ptr::null_mut(),
            genre: core::ptr::null_mut(),
            picture: core::ptr::null_mut(),
            file_size: core::ptr::null_mut(),
        }
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
