#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
typedef struct _Dart_Handle* Dart_Handle;

typedef struct DartCObject DartCObject;

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct wire_Picture {
  struct wire_uint_8_list *mime_type;
  struct wire_uint_8_list *data;
} wire_Picture;

typedef struct wire_Metadata {
  struct wire_uint_8_list *title;
  double *duration_ms;
  struct wire_uint_8_list *artist;
  struct wire_uint_8_list *album;
  struct wire_uint_8_list *album_artist;
  uint32_t *track_number;
  uint32_t *track_total;
  uint32_t *disc_number;
  uint32_t *disc_total;
  uint32_t *year;
  struct wire_uint_8_list *genre;
  struct wire_Picture *picture;
  uint64_t *file_size;
} wire_Metadata;

typedef struct DartCObject *WireSyncReturn;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

Dart_Handle get_dart_object(uintptr_t ptr);

void drop_dart_object(uintptr_t ptr);

uintptr_t new_dart_opaque(Dart_Handle handle);

intptr_t init_frb_dart_api_dl(void *obj);

void wire_read_metadata(int64_t port_, struct wire_uint_8_list *file);

void wire_write_metadata(int64_t port_,
                         struct wire_uint_8_list *file,
                         struct wire_Metadata *metadata);

double *new_box_autoadd_f64_0(double value);

struct wire_Metadata *new_box_autoadd_metadata_0(void);

struct wire_Picture *new_box_autoadd_picture_0(void);

uint32_t *new_box_autoadd_u32_0(uint32_t value);

uint64_t *new_box_autoadd_u64_0(uint64_t value);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void free_WireSyncReturn(WireSyncReturn ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_read_metadata);
    dummy_var ^= ((int64_t) (void*) wire_write_metadata);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_f64_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_metadata_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_picture_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_u32_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_u64_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturn);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    dummy_var ^= ((int64_t) (void*) get_dart_object);
    dummy_var ^= ((int64_t) (void*) drop_dart_object);
    dummy_var ^= ((int64_t) (void*) new_dart_opaque);
    return dummy_var;
}
