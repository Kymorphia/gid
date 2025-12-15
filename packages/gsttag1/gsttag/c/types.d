/// C types for gsttag1 library
module gsttag.c.types;

public import gid.basictypes;
public import gst.c.types;
public import gstbase.c.types;

/**
    Result values from the parse_tag virtual function.
*/
enum GstTagDemuxResult
{
  /**
      cannot parse tag, just skip it
  */
  BrokenTag = 0,

  /**
      call again with less or more data
  */
  Again = 1,

  /**
      parsed tag successfully
  */
  Ok = 2,
}

/**
    Type of image contained in an image tag (specified as "image-type" field in
    the info structure in the image's #GstSample)
*/
enum GstTagImageType
{
  /**
      No image type. Can be used to
           tell functions such as [gsttag.global.tagImageDataToImageSample] that no
           image type should be set.
  */
  None = -1,

  /**
      Undefined/other image type
  */
  Undefined = 0,

  /**
      Cover (front)
  */
  FrontCover = 1,

  /**
      Cover (back)
  */
  BackCover = 2,

  /**
      Leaflet page
  */
  LeafletPage = 3,

  /**
      Medium (e.g. label side of CD)
  */
  Medium = 4,

  /**
      Lead artist/lead performer/soloist
  */
  LeadArtist = 5,

  /**
      Artist/performer
  */
  Artist = 6,

  /**
      Conductor
  */
  Conductor = 7,

  /**
      Band/orchestra
  */
  BandOrchestra = 8,

  /**
      Composer
  */
  Composer = 9,

  /**
      Lyricist/text writer
  */
  Lyricist = 10,

  /**
      Recording location
  */
  RecordingLocation = 11,

  /**
      During recording
  */
  DuringRecording = 12,

  /**
      During performance
  */
  DuringPerformance = 13,

  /**
      Movie/video screen capture
  */
  VideoCapture = 14,

  /**
      A fish as funny as the ID3v2 spec
  */
  Fish = 15,

  /**
      Illustration
  */
  Illustration = 16,

  /**
      Band/artist logotype
  */
  BandArtistLogo = 17,

  /**
      Publisher/studio logotype
  */
  PublisherStudioLogo = 18,
}

/**
    See http://creativecommons.org/ns for more information.
*/
enum GstTagLicenseFlags : uint
{
  /**
      making multiple copies
          is allowed
  */
  PermitsReproduction = 1,

  /**
      distribution, public display
          and public performance are allowed
  */
  PermitsDistribution = 2,

  /**
      distribution of derivative
          works is allowed
  */
  PermitsDerivativeWorks = 4,

  /**
      commercial derivatives are allowed,
          but only non-commercial distribution is allowed
  */
  PermitsSharing = 8,

  /**
      copyright and license notices
          must be kept intact
  */
  RequiresNotice = 256,

  /**
      credit must be given to
          copyright holder and/or author
  */
  RequiresAttribution = 512,

  /**
      derivative works must be
          licensed under the same terms or compatible terms as the original work
  */
  RequiresShareAlike = 1024,

  /**
      source code (the preferred
          form for making modifications) must be provided when exercising some
          rights granted by the license
  */
  RequiresSourceCode = 2048,

  /**
      derivative and combined works
          must be licensed under specified terms, similar to those of the original
          work
  */
  RequiresCopyleft = 4096,

  /**
      derivative works must be
          licensed under specified terms, with at least the same conditions as
          the original work; combinations with the work may be licensed under
          different terms
  */
  RequiresLesserCopyleft = 8192,

  /**
      exercising rights for
          commercial purposes is prohibited
  */
  ProhibitsCommercialUse = 65536,

  /**
      use in a
          non-developing country is prohibited
  */
  ProhibitsHighIncomeNationUse = 131072,

  /**
      this license was created
          by the Creative Commons project
  */
  CreativeCommonsLicense = 16777216,

  /**
      this license was
          created by the Free Software Foundation (FSF)
  */
  FreeSoftwareFoundationLicense = 33554432,
}

/**
    Provides a base class for demuxing tags at the beginning or end of a
    stream and handles things like typefinding, querying, seeking, and
    different modes of operation (chain-based, pull_range-based, and providing
    downstream elements with random access if upstream supports that). The tag
    is stripped from the output, and all offsets are adjusted for the tag
    sizes, so that to the downstream element the stream will appear as if
    there was no tag at all. Also, once the tag has been parsed, GstTagDemux
    will try to determine the media type of the resulting stream and add a
    source pad with the appropriate caps in order to facilitate auto-plugging.
    
    ## Deriving from GstTagDemux
    
    Subclasses have to do four things:
    
     $(LIST
        * In their base init function, they must add a pad template for the sink
          pad to the element class, describing the media type they can parse in
          the caps of the pad template.
        * In their class init function, they must override
          GST_TAG_DEMUX_CLASS(demux_klass)->identify_tag with their own identify
          function.
        * In their class init function, they must override
     )
     GST_TAG_DEMUX_CLASS(demux_klass)->parse_tag with their own parse
     function.
     $(LIST
        * In their class init function, they must also set
          GST_TAG_DEMUX_CLASS(demux_klass)->min_start_size and/or
     )
     GST_TAG_DEMUX_CLASS(demux_klass)->min_end_size to the minimum size required
     for the identify function to decide whether the stream has a supported tag
     or not. A class parsing ID3v1 tags, for example, would set min_end_size to
     128 bytes.
*/
struct GstTagDemux
{
  /**
      parent element
  */
  GstElement element;

  /** */
  GstTagDemuxPrivate* priv;

  /** */
  void*[4] reserved;
}

/**
    The #GstTagDemuxClass structure.  See documentation at beginning of section
    for details about what subclasses need to override and do.
*/
struct GstTagDemuxClass
{
  /**
      the parent class.
  */
  GstElementClass parentClass;

  /**
      minimum size required to identify a tag at the start and
      determine its total size. Set to 0 if not interested in start tags.
      Subclasses should set this in their class_init function.
  */
  uint minStartSize;

  /**
      minimum size required to identify a tag at the end and
      determine its total size. Set to 0 if not interested in end tags.
      Subclasses should set this in their class_init function.
  */
  uint minEndSize;

  /**
      identify tag and determine the size required to parse the
      tag. Buffer may be larger than the specified minimum size.
      Subclassed MUST override this vfunc in their class_init function.
  */
  extern(C) gboolean function(GstTagDemux* demux, GstBuffer* buffer, gboolean startTag, uint* tagSize) identifyTag;

  /**
      parse the tag. Buffer will be exactly of the size determined by
      the identify_tag vfunc before. The parse_tag vfunc may change the size
      stored in *tag_size and return GST_TAG_DEMUX_RESULT_AGAIN to request a
      larger or smaller buffer. It is also permitted to adjust the tag_size to a
      smaller value and then return GST_TAG_DEMUX_RESULT_OK in one go.
      Subclassed MUST override the parse_tag vfunc in their class_init function.
  */
  extern(C) GstTagDemuxResult function(GstTagDemux* demux, GstBuffer* buffer, gboolean startTag, uint* tagSize, GstTagList** tags) parseTag;

  /**
      merge start and end tags. Subclasses may want to override this
      vfunc to allow prioritising of start or end tag according to user
      preference.  Note that both start_tags and end_tags may be NULL. By default
      start tags are preferred over end tags.
  */
  extern(C) GstTagList* function(GstTagDemux* demux, const(GstTagList)* startTags, const(GstTagList)* endTags) mergeTags;

  /** */
  void*[4] reserved;
}

/** */
struct GstTagDemuxPrivate;

/**
    Provides a base class for adding tags at the beginning or end of a
    stream.
    
    ## Deriving from GstTagMux
    
    Subclasses have to do the following things:
    
     $(LIST
        * In their base init function, they must add pad templates for the sink
          pad and the source pad to the element class, describing the media type
          they accept and output in the caps of the pad template.
        * In their class init function, they must override the
          GST_TAG_MUX_CLASS(mux_klass)->render_start_tag and/or
          GST_TAG_MUX_CLASS(mux_klass)->render_end_tag vfuncs and set up a render
          function.
     )
*/
struct GstTagMux
{
  /**
      parent element
  */
  GstElement element;

  /** */
  GstTagMuxPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    The #GstTagMuxClass structure. Subclasses need to override at least one
    of the two render vfuncs.
*/
struct GstTagMuxClass
{
  /**
      the parent class.
  */
  GstElementClass parentClass;

  /**
      create a tag buffer to add to the beginning of the
          input stream given a tag list, or NULL
  */
  extern(C) GstBuffer* function(GstTagMux* mux, const(GstTagList)* tagList) renderStartTag;

  /**
      create a tag buffer to add to the end of the
          input stream given a tag list, or NULL
  */
  extern(C) GstBuffer* function(GstTagMux* mux, const(GstTagList)* tagList) renderEndTag;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstTagMuxPrivate;

/**
    This interface is implemented by elements that are able to do XMP serialization. Examples for
    such elements are #jifmux and #qtmux.
    
    Applications can use this interface to configure which XMP schemas should be used when serializing
    tags into XMP. Schemas are represented by their names, a full list of the supported schemas can be
    obtained from [gsttag.global.tagXmpListSchemas]. By default, all schemas are used.
*/
struct GstTagXmpWriter;

/** */
struct GstTagXmpWriterInterface
{
  /** */
  GTypeInterface parent;
}

