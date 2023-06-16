use anyhow::{Result, anyhow};
use lofty::{Accessor, PictureType, Probe, Tag, TagExt, TaggedFileExt, AudioFile, MimeType};

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
    pub track_number: Option<u32>,
    pub track_total: Option<u32>,
    pub disc_number: Option<u32>,
    pub disc_total: Option<u32>,
    pub year: Option<u32>,
    pub genre: Option<String>,
    pub picture: Option<Picture>,
    pub file_size: Option<u64>,
}

fn read_tag(file: String) -> Result<Tag> {
    let tagged_file = Probe::open(file)?.read()?;
    Ok(match tagged_file.primary_tag() {
        Some(primary_tag) => primary_tag,
        None => match tagged_file.first_tag() {
            Some(tag) => tag,
            None => return Err(anyhow!("Error: no tags found"))
        }
    }.clone())
}

pub fn read_metadata(file: String) -> Result<Metadata> {
    let tagged_file = Probe::open(&file)?.read()?;
    let tag = read_tag(file)?;
    let cover = tag.get_picture_type(PictureType::CoverFront);
    Ok(Metadata {
        title: tag.title().as_deref().map(String::from),
        duration_ms: Some(tagged_file.properties().duration().as_secs_f64()),
        artist: tag.artist().as_deref().map(String::from),
        album: tag.album().as_deref().map(String::from),
        album_artist: tag.get_string(&lofty::ItemKey::AlbumArtist).map(String::from),
        track_number: tag.track(),
        track_total: tag.track_total(),
        disc_number: tag.disk(),
        disc_total: tag.disk_total(),
        year: tag.year(),
        genre: tag.genre().as_deref().map(String::from),
        picture: cover.map(|c| Picture { mime_type: String::from(c.mime_type().as_str()), data: c.data().to_vec() }),
        file_size: Some(21231_u64),
    })
}

pub fn write_metadata(file: String, metadata: Metadata) -> Result<()> {
    let mut tag = read_tag(file.clone())?;

    if metadata.title.is_some() {
        tag.set_title(metadata.title.unwrap());
    }
    if metadata.album.is_some() {
        tag.set_album(metadata.album.unwrap());
    }
    if metadata.album_artist.is_some() {
        tag.insert_text(lofty::ItemKey::AlbumArtist, metadata.album_artist.unwrap());
    }
    if metadata.artist.is_some() {
        tag.set_artist(metadata.artist.unwrap());
    }
    if metadata.track_number.is_some() {
        tag.set_track(metadata.track_number.unwrap());
    }
    if metadata.track_total.is_some() {
        tag.set_track_total(metadata.track_total.unwrap());
    }
    if metadata.disc_number.is_some() {
        tag.set_disk(metadata.disc_number.unwrap());
    }
    if metadata.disc_total.is_some() {
        tag.set_disk_total(metadata.disc_total.unwrap());
    }
    if metadata.year.is_some() {
        tag.set_year(metadata.year.unwrap());
    }
    if metadata.genre.is_some() {
        tag.set_genre(metadata.genre.unwrap());
    }
    if metadata.picture.is_some() {
        let image = metadata.picture.unwrap();
        let pic = lofty::Picture::new_unchecked(PictureType::CoverFront, MimeType::from_str(&image.mime_type), None, image.data);
        tag.push_picture(pic);
    }

    tag.save_to_path(file)?;
    Ok(())
}
