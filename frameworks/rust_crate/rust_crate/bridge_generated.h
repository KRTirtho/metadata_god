#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct wire_Image {
  struct wire_uint_8_list *mime_type;
  struct wire_uint_8_list *data;
} wire_Image;

typedef struct wire_Metadata {
  struct wire_uint_8_list *title;
  double *duration_ms;
  struct wire_uint_8_list *artist;
  struct wire_uint_8_list *album;
  struct wire_uint_8_list *album_artist;
  uint16_t *track_number;
  uint16_t *track_total;
  uint16_t *disc_number;
  uint16_t *disc_total;
  int32_t *year;
  struct wire_uint_8_list *genre;
  struct wire_Image *picture;
  uint64_t *file_size;
} wire_Metadata;

typedef struct WireSyncReturnStruct {
  uint8_t *ptr;
  int32_t len;
  bool success;
} WireSyncReturnStruct;

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

void wire_ping(int64_t port_);

void wire_read_metadata(int64_t port_, struct wire_uint_8_list *file);

void wire_write_metadata(int64_t port_,
                         struct wire_uint_8_list *file,
                         struct wire_Metadata *metadata);

double *new_box_autoadd_f64(double value);

int32_t *new_box_autoadd_i32(int32_t value);

struct wire_Image *new_box_autoadd_image(void);

struct wire_Metadata *new_box_autoadd_metadata(void);

uint16_t *new_box_autoadd_u16(uint16_t value);

uint64_t *new_box_autoadd_u64(uint64_t value);

struct wire_uint_8_list *new_uint_8_list(int32_t len);

void free_WireSyncReturnStruct(struct WireSyncReturnStruct val);

void store_dart_post_cobject(DartPostCObjectFnType ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_ping);
    dummy_var ^= ((int64_t) (void*) wire_read_metadata);
    dummy_var ^= ((int64_t) (void*) wire_write_metadata);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_f64);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_i32);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_image);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_metadata);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_u16);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_u64);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturnStruct);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}