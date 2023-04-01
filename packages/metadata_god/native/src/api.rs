use anyhow::Result;
use audiotags::{MimeType, Tag};

#[derive(Debug)]
pub struct Picture {
    /// The picture's MIME type.
    pub mime_type: String,
    /// The image data.
    pub data: Vec<u8>,
}

#[derive(Debug)]
pub struct Metadata {
    pub title: Option<String>,
    pub duration_ms: Option<f64>,
    pub artist: Option<String>,
    pub album: Option<String>,
    pub album_artist: Option<String>,
    pub track_number: Option<u16>,
    pub track_total: Option<u16>,
    pub disc_number: Option<u16>,
    pub disc_total: Option<u16>,
    pub year: Option<i32>,
    pub genre: Option<String>,
    pub picture: Option<Picture>,
    pub file_size: Option<u64>,
}

pub fn read_metadata(file: String) -> Result<Metadata> {
    let tag = Tag::default().read_from_path(&file)?;
    let cover = tag.album_cover();
    Ok(Metadata {
        title: tag.title().and_then(|s| Some(s.to_string())),
        duration_ms: tag.duration(),
        album: tag.album_title().and_then(|s| Some(s.to_string())),
        album_artist: tag.album_artist().and_then(|s| Some(s.to_string())),
        artist: tag.artist().and_then(|s| Some(s.to_string())),
        track_number: tag.track_number(),
        track_total: tag.total_tracks(),
        disc_number: tag.disc_number(),
        disc_total: tag.total_discs(),
        year: tag.year(),
        genre: tag.genre().and_then(|s| Some(s.to_string())),
        picture: (match cover {
            Some(cover) => Some(Picture {
                mime_type: String::from(cover.mime_type),
                data: cover.data.to_vec(),
            }),
            None => None,
        }),
        file_size: Some(21231_u64),
    })
}

pub fn write_metadata(file: String, metadata: Metadata) -> Result<()> {
    let mut tag = Tag::default().read_from_path(&file)?;

    if metadata.title.is_some() {
        tag.set_title(metadata.title.unwrap().as_str());
    }
    if metadata.album.is_some() {
        tag.set_album_title(metadata.album.unwrap().as_str());
    }
    if metadata.album_artist.is_some() {
        tag.set_album_artist(metadata.album_artist.unwrap().as_str());
    }
    if metadata.artist.is_some() {
        tag.set_artist(metadata.artist.unwrap().as_str());
    }
    if metadata.track_number.is_some() {
        tag.set_track_number(metadata.track_number.unwrap());
    }
    if metadata.track_total.is_some() {
        tag.set_total_tracks(metadata.track_total.unwrap());
    }
    if metadata.disc_number.is_some() {
        tag.set_disc_number(metadata.disc_number.unwrap());
    }
    if metadata.disc_total.is_some() {
        tag.set_total_discs(metadata.disc_total.unwrap());
    }
    if metadata.year.is_some() {
        tag.set_year(metadata.year.unwrap());
    }
    if metadata.genre.is_some() {
        tag.set_genre(metadata.genre.unwrap().as_str());
    }
    if metadata.picture.is_some() {
        let image = metadata.picture.unwrap();
        tag.set_album_cover(audiotags::Picture {
            mime_type: MimeType::try_from(image.mime_type.as_str()).unwrap(),
            data: &image.data,
        });
    }

    tag.write_to_path(&file)?;
    Ok(())
}
