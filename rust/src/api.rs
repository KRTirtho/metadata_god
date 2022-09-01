// This is the entry point of your Rust library.
// When adding new code to your project, note that only items used
// here will be transformed to their Dart equivalents.

use anyhow::Result;
// A plain enum without any fields. This is similar to Dart- or C-style enums.
// flutter_rust_bridge is capable of generating code for enums with fields
// (@freezed classes in Dart and tagged unions in C).
use metadata::*;

pub struct Tag {
    pub name: String,
    pub value: String,
}

pub struct Metadata {
    pub title: String,
    pub duration_ms: f64,
    pub tags: Vec<Tag>,
    pub file_size: u64,
}

pub fn build_metadata(file: String) -> Result<Metadata> {
    let mut meta = MediaFileMetadata::new(&file)?;
    meta.include_checksum(false)?
        .include_tags(true)
        .include_all_tags(true);
    Ok(Metadata {
        title: meta.title.unwrap_or("Unknown".to_string()),
        duration_ms: meta._duration.unwrap_or(0_f64),
        tags: meta
            .tags
            .iter()
            .map(|tag| Tag {
                name: tag.0.clone(),
                value: tag.1.clone(),
            })
            .collect(),
        file_size: meta.file_size,
    })
}
