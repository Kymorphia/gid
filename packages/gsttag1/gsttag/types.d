/// D types for gsttag1 library
module gsttag.types;

import gid.gid;
import gsttag.c.functions;
import gsttag.c.types;


// Enums

/** */
alias TagDemuxResult = GstTagDemuxResult;

/** */
alias TagImageType = GstTagImageType;

/** */
alias TagLicenseFlags = GstTagLicenseFlags;

/**
    AcoustID Fingerprint (Chromaprint)
*/
enum TAG_ACOUSTID_FINGERPRINT = "chromaprint-fingerprint";

/**
    AcoustID Identifier
*/
enum TAG_ACOUSTID_ID = "acoustid-id";

/**
    Direction of contrast processing applied when capturing an image. (string)
    
    The allowed values are:
     "normal"
     "soft"
     "hard"
*/
enum TAG_CAPTURING_CONTRAST = "capturing-contrast";

/**
    Digital zoom ratio used when capturing an image. (double)
*/
enum TAG_CAPTURING_DIGITAL_ZOOM_RATIO = "capturing-digital-zoom-ratio";

/**
    Exposure compensation using when capturing an image in EV. (double)
*/
enum TAG_CAPTURING_EXPOSURE_COMPENSATION = "capturing-exposure-compensation";

/**
    Exposure mode used when capturing an image. (string)
    
    The allowed values are:
      "auto-exposure"
      "manual-exposure"
      "auto-bracket"
*/
enum TAG_CAPTURING_EXPOSURE_MODE = "capturing-exposure-mode";

/**
    Type of exposure control used when capturing an image. (string)
    
    The allowed values are:
      "undefined"
      "manual"
      "normal" - automatically controlled
      "aperture-priority" - user selects aperture value
      "shutter-priority" - user selects shutter speed
      "creative" - biased towards depth of field
      "action" - biased towards fast shutter speed
      "portrait" - closeup, leaving background out of focus
      "landscape" - landscape photos, background in focus
*/
enum TAG_CAPTURING_EXPOSURE_PROGRAM = "capturing-exposure-program";

/**
    If flash was fired during the capture of an image. (boolean)
    
    Note that if this tag isn't present, it should not be assumed that
    the flash did not fire. It should be treated as unknown.
*/
enum TAG_CAPTURING_FLASH_FIRED = "capturing-flash-fired";

/**
    The flash mode selected during the capture of an image. (string)
    
    The allowed values are:
     "auto"
     "always"
     "never"
*/
enum TAG_CAPTURING_FLASH_MODE = "capturing-flash-mode";

/**
    Focal length used when capturing an image, in mm. (double)
*/
enum TAG_CAPTURING_FOCAL_LENGTH = "capturing-focal-length";

/**
    35 mm equivalent focal length used when capturing an image, in mm. (double)
*/
enum TAG_CAPTURING_FOCAL_LENGTH_35_MM = "capturing-focal-length-35mm";

/**
    Focal ratio (f-number) used when capturing an image. (double)
    
    The value stored is the denominator of the focal ratio (f-number).
    For example, if this tag value is 2, the focal ratio is f/2.
*/
enum TAG_CAPTURING_FOCAL_RATIO = "capturing-focal-ratio";

/**
    Gain adjustment applied to an image. (string)
    
    The allowed values are:
      "none"
      "low-gain-up"
      "high-gain-up"
      "low-gain-down"
      "high-gain-down"
*/
enum TAG_CAPTURING_GAIN_ADJUSTMENT = "capturing-gain-adjustment";

/**
    ISO speed used when capturing an image. (integer)
*/
enum TAG_CAPTURING_ISO_SPEED = "capturing-iso-speed";

/**
    Light source used when capturing an image. (string)
    
    The allowed values are:
      "unknown"
      "daylight"
      "fluorescent"
      "tungsten"
      "flash"
      "fine-weather"
      "cloudy-weather"
      "shade"
      "daylight-fluorescent"
      "day-white-fluorescent"
      "cool-white-fluorescent"
      "white-fluorescent"
      "warm-white-fluorescent"
      "standard-light-A"
      "standard-light-B"
      "standard-light-C"
      "D55"
      "D65"
      "D75"
      "D50"
      "iso-studio-tungsten"
      "other"
*/
enum TAG_CAPTURING_LIGHT_SOURCE = "capturing-light-source";

/**
    Defines the way a camera determines the exposure. (string)
    
    The allowed values are:
      "unknown"
      "average"
      "center-weighted-average"
      "spot"
      "multi-spot"
      "pattern"
      "partial"
      "other"
*/
enum TAG_CAPTURING_METERING_MODE = "capturing-metering-mode";

/**
    Direction of saturation processing applied when capturing an image. (string)
    
    The allowed values are:
     "normal"
     "low-saturation"
     "high-saturation"
*/
enum TAG_CAPTURING_SATURATION = "capturing-saturation";

/**
    Scene mode used when capturing an image. (string)
    
    The allowed values are:
      "standard"
      "landscape"
      "portrait"
      "night-scene"
*/
enum TAG_CAPTURING_SCENE_CAPTURE_TYPE = "capturing-scene-capture-type";

/**
    Direction of sharpness processing applied when capturing an image. (string)
    
    The allowed values are:
     "normal"
     "soft"
     "hard"
*/
enum TAG_CAPTURING_SHARPNESS = "capturing-sharpness";

/**
    Shutter speed used when capturing an image, in seconds. (fraction)
*/
enum TAG_CAPTURING_SHUTTER_SPEED = "capturing-shutter-speed";

/**
    Indicates the source of capture. The device/medium used to do the
    capture. (string)
    
    Allowed values are:
      "dsc" (= digital still camera)
      "transparent-scanner"
      "reflex-scanner"
      "other"
*/
enum TAG_CAPTURING_SOURCE = "capturing-source";

/**
    White balance mode used when capturing an image. (string)
    
    The allowed values are:
      "auto"
      "manual"
      "daylight"
      "cloudy"
      "tungsten"
      "fluorescent"
      "fluorescent h" (newer daylight-calibrated fluorescents)
      "flash"
*/
enum TAG_CAPTURING_WHITE_BALANCE = "capturing-white-balance";

/**
    CDDB disc id in its short form (e.g. 'aa063d0f')
*/
enum TAG_CDDA_CDDB_DISCID = "discid";

/**
    CDDB disc id including all details
*/
enum TAG_CDDA_CDDB_DISCID_FULL = "discid-full";

/**
    Musicbrainz disc id (e.g. 'ahg7JUcfR3vCYBphSDIogOOWrr0-')
*/
enum TAG_CDDA_MUSICBRAINZ_DISCID = "musicbrainz-discid";

/**
    Musicbrainz disc id details
*/
enum TAG_CDDA_MUSICBRAINZ_DISCID_FULL = "musicbrainz-discid-full";

/**
    Annodex CMML clip element tag
*/
enum TAG_CMML_CLIP = "cmml-clip";

/**
    Annodex CMML head element tag
*/
enum TAG_CMML_HEAD = "cmml-head";

/**
    Annodex CMML stream element tag
*/
enum TAG_CMML_STREAM = "cmml-stream";

/**
    ID3V2 header size considered minimum input for some functions such as
    [gsttag.global.tagListFromId3v2Tag] and [gsttag.global.tagGetId3v2TagSize] for example.
*/
enum TAG_ID3V2_HEADER_SIZE = 10;

/**
    Media (image/video) intended horizontal pixel density in ppi. (double)
*/
enum TAG_IMAGE_HORIZONTAL_PPI = "image-horizontal-ppi";

/**
    Media (image/video) intended vertical pixel density in ppi. (double)
*/
enum TAG_IMAGE_VERTICAL_PPI = "image-vertical-ppi";

/**
    Musical key in which the sound starts. It is represented as a string
    with a maximum length of three characters. The ground keys are
    represented with "A","B","C","D","E", "F" and "G" and halfkeys
    represented with "b" and "#". Minor is represented as "m" (e.g. "Dbm").
    Off key is represented with an "o" only.
    This notation might be extended in the future to support non-minor/major
    keys.
*/
enum TAG_MUSICAL_KEY = "musical-key";

/**
    MusicBrainz album artist ID
*/
enum TAG_MUSICBRAINZ_ALBUMARTISTID = "musicbrainz-albumartistid";

/**
    MusicBrainz album ID
*/
enum TAG_MUSICBRAINZ_ALBUMID = "musicbrainz-albumid";

/**
    MusicBrainz artist ID
*/
enum TAG_MUSICBRAINZ_ARTISTID = "musicbrainz-artistid";

/**
    MusicBrainz Release Group ID
*/
enum TAG_MUSICBRAINZ_RELEASEGROUPID = "musicbrainz-releasegroupid";

/**
    MusicBrainz Release Track ID
*/
enum TAG_MUSICBRAINZ_RELEASETRACKID = "musicbrainz-releasetrackid";

/**
    MusicBrainz track ID
*/
enum TAG_MUSICBRAINZ_TRACKID = "musicbrainz-trackid";

/**
    MusicBrainz track TRM ID
*/
enum TAG_MUSICBRAINZ_TRMID = "musicbrainz-trmid";
