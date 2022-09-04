mod api;

use std::{env, fs};

use api::{read_metadata, write_metadata, Metadata};

fn main() -> () {
    let file = env::args()
        .collect::<Vec<String>>()
        .first()
        .unwrap()
        .to_owned();
    let metadata = match read_metadata(file.clone()) {
        Ok(metadata) => metadata,
        Err(err) => {
            println!("Error: {}", err);
            return;
        }
    };

    println!("Title: {:?}", metadata.title);
    println!("Duration: {:?}", metadata.duration_ms);
    println!("Album: {:?}", metadata.album);
    println!("Album Artist: {:?}", metadata.album_artist);
    println!("Artist: {:?}", metadata.artist);
    println!("Track Number: {:?}", metadata.track_number);
    println!("Track Total: {:?}", metadata.track_total);
    println!("Disc Number: {:?}", metadata.disc_number);
    println!("Disc Total: {:?}", metadata.disc_total);
    println!("Year: {:?}", metadata.year);
    println!("Genre: {:?}", metadata.genre);
    println!("MimeType: {:?}", metadata.picture.unwrap().mime_type);
    println!("File Size: {:?}", metadata.file_size);

    write_metadata(
        file.clone(),
        Metadata {
            album: Some("Scaled and Icy".to_string()),
            album_artist: Some("Twenty One Pilots".to_string()),
            artist: Some("Twenty One Pilots".to_string()),
            title: Some("Shy Away".to_string()),
            disc_number: Some(1),
            disc_total: Some(12),
            duration_ms: Some(255312_f64),
            file_size: Some(31323),
            genre: Some("Alternative/Indie, Pop".to_string()),
            picture: Some(api::Image {
                mime_type: "image/png".to_string(),
                data: fs::read("/home/krtirtho/Downloads/logo.png").unwrap(),
            }),
            track_number: Some(1),
            track_total: Some(12),
            year: Some(2021),
        },
    )
    .unwrap();
}
