/// C types for gstvideo1 library
module gstvideo.c.types;

public import gid.basictypes;
public import gst.c.types;
public import gstbase.c.types;

/**
    Location of a @GstAncillaryMeta.
*/
enum GstAncillaryMetaField
{
  /**
      Progressive or no field specified (default)
  */
  Progressive = 0,

  /**
      Interlaced first field
  */
  InterlacedFirst = 16,

  /**
      Interlaced second field
  */
  InterlacedSecond = 17,
}

/**
    An enumeration indicating whether an element implements color balancing
    operations in software or in dedicated hardware. In general, dedicated
    hardware implementations (such as those provided by xvimagesink) are
    preferred.
*/
enum GstColorBalanceType
{
  /**
      Color balance is implemented with dedicated
              hardware.
  */
  Hardware = 0,

  /**
      Color balance is implemented via software
              processing.
  */
  Software = 1,
}

/**
    A set of commands that may be issued to an element providing the
    #GstNavigation interface. The available commands can be queried via
    the [gstvideo.navigation.Navigation.queryNewCommands] query.
    
    For convenience in handling DVD navigation, the MENU commands are aliased as:
       GST_NAVIGATION_COMMAND_DVD_MENU            = @GST_NAVIGATION_COMMAND_MENU1
       GST_NAVIGATION_COMMAND_DVD_TITLE_MENU      = @GST_NAVIGATION_COMMAND_MENU2
       GST_NAVIGATION_COMMAND_DVD_ROOT_MENU       = @GST_NAVIGATION_COMMAND_MENU3
       GST_NAVIGATION_COMMAND_DVD_SUBPICTURE_MENU = @GST_NAVIGATION_COMMAND_MENU4
       GST_NAVIGATION_COMMAND_DVD_AUDIO_MENU      = @GST_NAVIGATION_COMMAND_MENU5
       GST_NAVIGATION_COMMAND_DVD_ANGLE_MENU      = @GST_NAVIGATION_COMMAND_MENU6
       GST_NAVIGATION_COMMAND_DVD_CHAPTER_MENU    = @GST_NAVIGATION_COMMAND_MENU7
*/
enum GstNavigationCommand
{
  /**
      An invalid command entry
  */
  Invalid = 0,

  /**
      Execute navigation menu command 1. For DVD,
      this enters the DVD root menu, or exits back to the title from the menu.
  */
  Menu1 = 1,

  /**
      Execute navigation menu command 2. For DVD,
      this jumps to the DVD title menu.
  */
  Menu2 = 2,

  /**
      Execute navigation menu command 3. For DVD,
      this jumps into the DVD root menu.
  */
  Menu3 = 3,

  /**
      Execute navigation menu command 4. For DVD,
      this jumps to the Subpicture menu.
  */
  Menu4 = 4,

  /**
      Execute navigation menu command 5. For DVD,
      the jumps to the audio menu.
  */
  Menu5 = 5,

  /**
      Execute navigation menu command 6. For DVD,
      this jumps to the angles menu.
  */
  Menu6 = 6,

  /**
      Execute navigation menu command 7. For DVD,
      this jumps to the chapter menu.
  */
  Menu7 = 7,

  /**
      Select the next button to the left in a menu,
      if such a button exists.
  */
  Left = 20,

  /**
      Select the next button to the right in a menu,
      if such a button exists.
  */
  Right = 21,

  /**
      Select the button above the current one in a
      menu, if such a button exists.
  */
  Up = 22,

  /**
      Select the button below the current one in a
      menu, if such a button exists.
  */
  Down = 23,

  /**
      Activate (click) the currently selected
      button in a menu, if such a button exists.
  */
  Activate = 24,

  /**
      Switch to the previous angle in a
      multiangle feature.
  */
  PrevAngle = 30,

  /**
      Switch to the next angle in a multiangle
      feature.
  */
  NextAngle = 31,
}

/**
    Enum values for the various events that an element implementing the
    GstNavigation interface might send up the pipeline. Touch events have been
    inspired by the libinput API, and have the same meaning here.
*/
enum GstNavigationEventType
{
  /**
      Returned from
      [gstvideo.navigation.Navigation.eventGetType] when the passed event is not a navigation event.
  */
  Invalid = 0,

  /**
      A key press event. Use
      [gstvideo.navigation.Navigation.eventParseKeyEvent] to extract the details from the event.
  */
  KeyPress = 1,

  /**
      A key release event. Use
      [gstvideo.navigation.Navigation.eventParseKeyEvent] to extract the details from the event.
  */
  KeyRelease = 2,

  /**
      A mouse button press event. Use
      [gstvideo.navigation.Navigation.eventParseMouseButtonEvent] to extract the details from the
      event.
  */
  MouseButtonPress = 3,

  /**
      A mouse button release event. Use
      [gstvideo.navigation.Navigation.eventParseMouseButtonEvent] to extract the details from the
      event.
  */
  MouseButtonRelease = 4,

  /**
      A mouse movement event. Use
      [gstvideo.navigation.Navigation.eventParseMouseMoveEvent] to extract the details from the
      event.
  */
  MouseMove = 5,

  /**
      A navigation command event. Use
      [gstvideo.navigation.Navigation.eventParseCommand] to extract the details from the event.
  */
  Command = 6,

  /**
      A mouse scroll event. Use [gstvideo.navigation.Navigation.eventParseMouseScrollEvent]
      to extract the details from the event.
  */
  MouseScroll = 7,

  /**
      An event describing a new touch point, which will be assigned an identifier
      that is unique to it for the duration of its movement on the screen.
      Use [gstvideo.navigation.Navigation.eventParseTouchEvent] to extract the details
      from the event.
  */
  TouchDown = 8,

  /**
      An event describing the movement of an active touch point across
      the screen. Use [gstvideo.navigation.Navigation.eventParseTouchEvent] to extract
      the details from the event.
  */
  TouchMotion = 9,

  /**
      An event describing a removed touch point. After this event,
      its identifier may be reused for any new touch points.
      Use [gstvideo.navigation.Navigation.eventParseTouchUpEvent] to extract the details
      from the event.
  */
  TouchUp = 10,

  /**
      An event signaling the end of a sequence of simultaneous touch events.
  */
  TouchFrame = 11,

  /**
      An event cancelling all currently active touch points.
  */
  TouchCancel = 12,
}

/**
    A set of notifications that may be received on the bus when navigation
    related status changes.
*/
enum GstNavigationMessageType
{
  /**
      Returned from
      [gstvideo.navigation.Navigation.messageGetType] when the passed message is not a
      navigation message.
  */
  Invalid = 0,

  /**
      Sent when the mouse moves over or leaves a
      clickable region of the output, such as a DVD menu button.
  */
  MouseOver = 1,

  /**
      Sent when the set of available commands
      changes and should re-queried by interested applications.
  */
  CommandsChanged = 2,

  /**
      Sent when display angles in a multi-angle
      feature (such as a multiangle DVD) change - either angles have appeared or
      disappeared.
  */
  AnglesChanged = 3,

  /**
      Sent when a navigation event was not handled
      by any element in the pipeline (Since: 1.6)
  */
  Event = 4,
}

/**
    Flags to indicate the state of modifier keys and mouse buttons
    in events.
    
    Typical modifier keys are Shift, Control, Meta, Super, Hyper, Alt, Compose,
    Apple, CapsLock or ShiftLock.
*/
enum GstNavigationModifierType : uint
{
  /** */
  None = 0,

  /**
      the Shift key.
  */
  ShiftMask = 1,

  /** */
  LockMask = 2,

  /**
      the Control key.
  */
  ControlMask = 4,

  /**
      the third modifier key
  */
  Mod1Mask = 8,

  /**
      the fourth modifier key
  */
  Mod2Mask = 16,

  /**
      the fifth modifier key
  */
  Mod3Mask = 32,

  /**
      the sixth modifier key
  */
  Mod4Mask = 64,

  /**
      the seventh modifier key
  */
  Mod5Mask = 128,

  /**
      the first mouse button (usually the left button).
  */
  Button1Mask = 256,

  /**
      the second mouse button (usually the right button).
  */
  Button2Mask = 512,

  /**
      the third mouse button (usually the mouse wheel button or middle button).
  */
  Button3Mask = 1024,

  /**
      the fourth mouse button (typically the "Back" button).
  */
  Button4Mask = 2048,

  /**
      the fifth mouse button (typically the "forward" button).
  */
  Button5Mask = 4096,

  /**
      the Super modifier
  */
  SuperMask = 67108864,

  /**
      the Hyper modifier
  */
  HyperMask = 134217728,

  /**
      the Meta modifier
  */
  MetaMask = 268435456,

  /**
      A mask covering all entries in #GdkModifierType.
  */
  Mask = 469770239,
}

/**
    Types of navigation interface queries.
*/
enum GstNavigationQueryType
{
  /**
      invalid query
  */
  Invalid = 0,

  /**
      command query
  */
  Commands = 1,

  /**
      viewing angle query
  */
  Angles = 2,
}

/**
    Enumeration of the different standards that may apply to AFD data:
    
    0) ETSI/DVB:
    https://www.etsi.org/deliver/etsi_ts/101100_101199/101154/02.01.01_60/ts_101154v020101p.pdf
    
    1) ATSC A/53:
    https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
    
    2) SMPTE ST2016-1:
*/
enum GstVideoAFDSpec
{
  /**
      AFD value is from DVB/ETSI standard
  */
  DvbEtsi = 0,

  /**
      AFD value is from ATSC A/53 standard
  */
  AtscA53 = 1,

  /** */
  SmpteSt20161 = 2,
}

/**
    Enumeration of the various values for Active Format Description (AFD)
    
    AFD should be included in video user data whenever the rectangular
    picture area containing useful information does not extend to the full height or width of the coded
    frame. AFD data may also be included in user data when the rectangular picture area containing
    useful information extends to the full height and width of the coded frame.
    
    For details, see Table 6.14 Active Format in:
    
    ATSC Digital Television Standard:
    Part 4 – MPEG-2 Video System Characteristics
    
    https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
    
    and Active Format Description in Complete list of AFD codes
    
    https://en.wikipedia.org/wiki/Active_Format_Description#Complete_list_of_AFD_codes
    
    and SMPTE ST2016-1
    
    Notes:
    
    1) AFD 0 is undefined for ATSC and SMPTE ST2016-1, indicating that AFD data is not available:
    If Bar Data is not present, AFD '0000' indicates that exact information
    is not available and the active image should be assumed to be the same as the coded frame. AFD '0000'.
    AFD '0000' accompanied by Bar Data signals that the active image’s aspect ratio is narrower than 16:9,
    but is not 4:3 or 14:9. As the exact aspect ratio cannot be conveyed by AFD alone, wherever possible,
    AFD ‘0000’ should be accompanied by Bar Data to define the exact vertical or horizontal extent
    of the active image.
    2) AFD 0 is reserved for DVB/ETSI
    3) values 1, 5, 6, 7, and 12 are reserved for both ATSC and DVB/ETSI
    4) values 2 and 3 are not recommended for ATSC, but are valid for DVB/ETSI
*/
enum GstVideoAFDValue
{
  /**
      Unavailable (see note 0 below).
  */
  Unavailable = 0,

  /**
      For 4:3 coded frame, letterbox 16:9 image,
           at top of the coded frame. For 16:9 coded frame, full frame 16:9 image,
           the same as the coded frame.
  */
  _169TopAligned = 2,

  /**
      For 4:3 coded frame, letterbox 14:9 image,
           at top of the coded frame. For 16:9 coded frame, pillarbox 14:9 image,
           horizontally centered in the coded frame.
  */
  _149TopAligned = 3,

  /**
      For 4:3 coded frame, letterbox image with an aspect ratio
           greater than 16:9, vertically centered in the coded frame. For 16:9 coded frame,
           letterbox image with an aspect ratio greater than 16:9.
  */
  GreaterThan169 = 4,

  /**
      For 4:3 coded frame, full frame 4:3 image,
           the same as the coded frame. For 16:9 coded frame, full frame 16:9 image, the same as
           the coded frame.
  */
  _43Full169Full = 8,

  /**
      For 4:3 coded frame, full frame 4:3 image, the same as
           the coded frame. For 16:9 coded frame, pillarbox 4:3 image, horizontally centered in the
           coded frame.
  */
  _43Full43Pillar = 9,

  /**
      For 4:3 coded frame, letterbox 16:9 image, vertically centered in
           the coded frame with all image areas protected. For 16:9 coded frame, full frame 16:9 image,
           with all image areas protected.
  */
  _169Letter169Full = 10,

  /**
      For 4:3 coded frame, letterbox 14:9 image, vertically centered in
           the coded frame. For 16:9 coded frame, pillarbox 14:9 image, horizontally centered in the
           coded frame.
  */
  _149Letter149Pillar = 11,

  /**
      For 4:3 coded frame, full frame 4:3 image, with alternative 14:9
           center. For 16:9 coded frame, pillarbox 4:3 image, with alternative 14:9 center.
  */
  _43Full149Center = 13,

  /**
      For 4:3 coded frame, letterbox 16:9 image, with alternative 14:9
           center. For 16:9 coded frame, full frame 16:9 image, with alternative 14:9 center.
  */
  _169Letter149Center = 14,

  /**
      For 4:3 coded frame, letterbox 16:9 image, with alternative 4:3
           center. For 16:9 coded frame, full frame 16:9 image, with alternative 4:3 center.
  */
  _169Letter43Center = 15,
}

/**
    Different alpha modes.
*/
enum GstVideoAlphaMode
{
  /**
      When input and output have alpha, it will be copied.
              When the input has no alpha, alpha will be set to
              #GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE
  */
  Copy = 0,

  /**
      set all alpha to
         #GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE
  */
  Set = 1,

  /**
      multiply all alpha with
              #GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE.
              When the input format has no alpha but the output format has, the
              alpha value will be set to #GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE
  */
  Mult = 2,
}

/** */
enum GstVideoAncillaryDID
{
  /** */
  Undefined = 0,

  /** */
  Deletion = 128,

  /** */
  Hanc3gAudioDataFirst = 160,

  /** */
  Hanc3gAudioDataLast = 167,

  /** */
  HancHdtvAudioDataFirst = 224,

  /** */
  HancHdtvAudioDataLast = 231,

  /** */
  HancSdtvAudioData1First = 236,

  /** */
  HancSdtvAudioData1Last = 239,

  /** */
  CameraPosition = 240,

  /** */
  HancErrorDetection = 244,

  /** */
  HancSdtvAudioData2First = 248,

  /** */
  HancSdtvAudioData2Last = 255,
}

/**
    Some know types of Ancillary Data identifiers.
*/
enum GstVideoAncillaryDID16
{
  /**
      CEA 708 Ancillary data according to SMPTE 334
  */
  S334Eia708 = 24833,

  /**
      CEA 608 Ancillary data according to SMPTE 334
  */
  S334Eia608 = 24834,

  /**
      AFD/Bar Ancillary data according to SMPTE 2016-3 (Since: 1.18)
  */
  S20163AfdBar = 16645,
}

/**
    Additional video buffer flags. These flags can potentially be used on any
    buffers carrying closed caption data, or video data - even encoded data.
    
    Note that these are only valid for #GstCaps of type: video/... and caption/...
    They can conflict with other extended buffer flags.
*/
enum GstVideoBufferFlags : uint
{
  /**
      If the #GstBuffer is interlaced. In mixed
                                          interlace-mode, this flags specifies if the frame is
                                          interlaced or progressive.
  */
  Interlaced = 1048576,

  /**
      If the #GstBuffer is interlaced, then the first field
                                          in the video frame is the top field.  If unset, the
                                          bottom field is first.
  */
  Tff = 2097152,

  /**
      If the #GstBuffer is interlaced, then the first field
                                          (as defined by the [gstvideo.types.VideoBufferFlags.Tff] flag setting)
                                          is repeated.
  */
  Rff = 4194304,

  /**
      If the #GstBuffer is interlaced, then only the
                                          first field (as defined by the [gstvideo.types.VideoBufferFlags.Tff]
                                          flag setting) is to be displayed (Since: 1.16).
  */
  Onefield = 8388608,

  /**
      The #GstBuffer contains one or more specific views,
                                          such as left or right eye view. This flags is set on
                                          any buffer that contains non-mono content - even for
                                          streams that contain only a single viewpoint. In mixed
                                          mono / non-mono streams, the absence of the flag marks
                                          mono buffers.
  */
  MultipleView = 16777216,

  /**
      When conveying stereo/multiview content with
                                          frame-by-frame methods, this flag marks the first buffer
                                           in a bundle of frames that belong together.
  */
  FirstInBundle = 33554432,

  /**
      The video frame has the top field only. This is the
                                          same as GST_VIDEO_BUFFER_FLAG_TFF |
                                          GST_VIDEO_BUFFER_FLAG_ONEFIELD (Since: 1.16).
                                          Use GST_VIDEO_BUFFER_IS_TOP_FIELD() to check for this flag.
  */
  TopField = 10485760,

  /**
      The video frame has the bottom field only. This is
                                          the same as GST_VIDEO_BUFFER_FLAG_ONEFIELD
                                          (GST_VIDEO_BUFFER_FLAG_TFF flag unset) (Since: 1.16).
                                          Use GST_VIDEO_BUFFER_IS_BOTTOM_FIELD() to check for this flag.
  */
  BottomField = 8388608,

  /**
      The #GstBuffer contains the end of a video field or frame
                                          boundary such as the last subframe or packet (Since: 1.18).
  */
  Marker = 512,

  /**
      Offset to define more flags
  */
  Last = 268435456,
}

/**
    The various known types of Closed Caption (CC).
*/
enum GstVideoCaptionType
{
  /**
      Unknown type of CC
  */
  Unknown = 0,

  /**
      CEA-608 as byte pairs. Note that
           this format is not recommended since is does not specify to
           which field the caption comes from and therefore assumes
           it comes from the first field (and that there is no information
           on the second field). Use @GST_VIDEO_CAPTION_TYPE_CEA708_RAW
           if you wish to store CEA-608 from two fields and prefix each byte pair
           with 0xFC for the first field and 0xFD for the second field.
  */
  Cea608Raw = 1,

  /**
      CEA-608 as byte triplets as defined
           in SMPTE S334-1 Annex A. The second and third byte of the byte triplet
           is the raw CEA608 data, the first byte is a bitfield: The top/7th bit is
           0 for the second field, 1 for the first field, bit 6 and 5 are 0 and
           bits 4 to 0 are a 5 bit unsigned integer that represents the line
           offset relative to the base-line of the original image format (line 9
           for 525-line field 1, line 272 for 525-line field 2, line 5 for
           625-line field 1 and line 318 for 625-line field 2).
  */
  Cea608S3341a = 2,

  /**
      CEA-708 as cc_data byte triplets. They
           can also contain 608-in-708 and the first byte of each triplet has to
           be inspected for detecting the type.
  */
  Cea708Raw = 3,

  /**
      CEA-708 (and optionally CEA-608) in
           a CDP (Caption Distribution Packet) defined by SMPTE S-334-2.
           Contains the whole CDP (starting with 0x9669).
  */
  Cea708Cdp = 4,
}

/**
    Extra flags that influence the result from [gstvideo.video_chroma_resample.VideoChromaResample.new_].
*/
enum GstVideoChromaFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      the input is interlaced
  */
  Interlaced = 1,
}

/**
    Different subsampling and upsampling methods
*/
enum GstVideoChromaMethod
{
  /**
      Duplicates the chroma samples when
         upsampling and drops when subsampling
  */
  Nearest = 0,

  /**
      Uses linear interpolation to reconstruct
         missing chroma and averaging to subsample
  */
  Linear = 1,
}

/**
    Different chroma downsampling and upsampling modes
*/
enum GstVideoChromaMode
{
  /**
      do full chroma up and down sampling
  */
  Full = 0,

  /**
      only perform chroma upsampling
  */
  UpsampleOnly = 1,

  /**
      only perform chroma downsampling
  */
  DownsampleOnly = 2,

  /**
      disable chroma resampling
  */
  None = 3,
}

/**
    Various Chroma sitings.
*/
enum GstVideoChromaSite : uint
{
  /**
      unknown cositing
  */
  Unknown = 0,

  /**
      no cositing
  */
  None = 1,

  /**
      chroma is horizontally cosited
  */
  HCosited = 2,

  /**
      chroma is vertically cosited
  */
  VCosited = 4,

  /**
      choma samples are sited on alternate lines
  */
  AltLine = 8,

  /**
      chroma samples cosited with luma samples
  */
  Cosited = 6,

  /**
      jpeg style cositing, also for mpeg1 and mjpeg
  */
  Jpeg = 1,

  /**
      mpeg2 style cositing
  */
  Mpeg2 = 2,

  /**
      DV style cositing
  */
  Dv = 14,
}

/**
    Flags for #GstVideoCodecFrame
*/
enum GstVideoCodecFrameFlags : uint
{
  /**
      is the frame only meant to be decoded
  */
  DecodeOnly = 1,

  /**
      is the frame a synchronization point (keyframe)
  */
  SyncPoint = 2,

  /**
      should the output frame be made a keyframe
  */
  ForceKeyframe = 4,

  /**
      should the encoder output stream headers
  */
  ForceKeyframeHeaders = 8,

  /**
      The buffer data is corrupted.
  */
  Corrupted = 16,
}

/**
    The color matrix is used to convert between Y'PbPr and
    non-linear RGB (R'G'B')
*/
enum GstVideoColorMatrix
{
  /**
      unknown matrix
  */
  Unknown = 0,

  /**
      identity matrix. Order of coefficients is
      actually GBR, also IEC 61966-2-1 (sRGB)
  */
  Rgb = 1,

  /**
      FCC Title 47 Code of Federal Regulations 73.682 (a)(20)
  */
  Fcc = 2,

  /**
      ITU-R BT.709 color matrix, also ITU-R BT1361
      / IEC 61966-2-4 xvYCC709 / SMPTE RP177 Annex B
  */
  Bt709 = 3,

  /**
      ITU-R BT.601 color matrix, also SMPTE170M / ITU-R BT1358 525 / ITU-R BT1700 NTSC
  */
  Bt601 = 4,

  /**
      SMPTE 240M color matrix
  */
  Smpte240m = 5,

  /**
      ITU-R BT.2020 color matrix. Since: 1.6
  */
  Bt2020 = 6,
}

/**
    The color primaries define the how to transform linear RGB values to and from
    the CIE XYZ colorspace.
*/
enum GstVideoColorPrimaries
{
  /**
      unknown color primaries
  */
  Unknown = 0,

  /**
      BT709 primaries, also ITU-R BT1361 / IEC
      61966-2-4 / SMPTE RP177 Annex B
  */
  Bt709 = 1,

  /**
      BT470M primaries, also FCC Title 47 Code
      of Federal Regulations 73.682 (a)(20)
  */
  Bt470m = 2,

  /**
      BT470BG primaries, also ITU-R BT601-6
      625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM
  */
  Bt470bg = 3,

  /**
      SMPTE170M primaries, also ITU-R
      BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC
  */
  Smpte170m = 4,

  /**
      SMPTE240M primaries
  */
  Smpte240m = 5,

  /**
      Generic film (colour filters using
      Illuminant C)
  */
  Film = 6,

  /**
      ITU-R BT2020 primaries. Since: 1.6
  */
  Bt2020 = 7,

  /**
      Adobe RGB primaries. Since: 1.8
  */
  Adobergb = 8,

  /**
      SMPTE ST 428 primaries (CIE 1931
      XYZ). Since: 1.16
  */
  Smptest428 = 9,

  /**
      SMPTE RP 431 primaries (ST 431-2
      (2011) / DCI P3). Since: 1.16
  */
  Smpterp431 = 10,

  /**
      SMPTE EG 432 primaries (ST 432-1
      (2010) / P3 D65). Since: 1.16
  */
  Smpteeg432 = 11,

  /**
      EBU 3213 primaries (JEDEC P22
      phosphors). Since: 1.16
  */
  Ebu3213 = 12,
}

/**
    Possible color range values. These constants are defined for 8 bit color
    values and can be scaled for other bit depths.
*/
enum GstVideoColorRange
{
  /**
      unknown range
  */
  Unknown = 0,

  /**
      [0..255] for 8 bit components
  */
  _0255 = 1,

  /**
      [16..235] for 8 bit components. Chroma has
                      [16..240] range.
  */
  _16235 = 2,
}

/**
    Flags to be used in combination with [gstvideo.video_decoder.VideoDecoder.requestSyncPoint].
    See the function documentation for more details.
*/
enum GstVideoDecoderRequestSyncPointFlags : uint
{
  /**
      discard all following
          input until the next sync point.
  */
  DiscardInput = 1,

  /**
      discard all following
          output until the next sync point.
  */
  CorruptOutput = 2,
}

/**
    Extra flags that influence the result from [gstvideo.video_chroma_resample.VideoChromaResample.new_].
*/
enum GstVideoDitherFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      the input is interlaced
  */
  Interlaced = 1,

  /**
      quantize values in addition to adding dither.
  */
  Quantize = 2,
}

/**
    Different dithering methods to use.
*/
enum GstVideoDitherMethod
{
  /**
      no dithering
  */
  None = 0,

  /**
      propagate rounding errors downwards
  */
  Verterr = 1,

  /**
      Dither with floyd-steinberg error diffusion
  */
  FloydSteinberg = 2,

  /**
      Dither with Sierra Lite error diffusion
  */
  SierraLite = 3,

  /**
      ordered dither using a bayer pattern
  */
  Bayer = 4,
}

/**
    Field order of interlaced content. This is only valid for
    interlace-mode=interleaved and not interlace-mode=mixed. In the case of
    mixed or GST_VIDEO_FIELD_ORDER_UNKOWN, the field order is signalled via
    buffer flags.
*/
enum GstVideoFieldOrder
{
  /**
      unknown field order for interlaced content.
          The actual field order is signalled via buffer flags.
  */
  Unknown = 0,

  /**
      top field is first
  */
  TopFieldFirst = 1,

  /**
      bottom field is first
  */
  BottomFieldFirst = 2,
}

/**
    Extra video flags
*/
enum GstVideoFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      a variable fps is selected, fps_n and fps_d
          denote the maximum fps of the video
  */
  VariableFps = 1,

  /**
      Each color has been scaled by the alpha
          value.
  */
  PremultipliedAlpha = 2,
}

/**
    Enum value describing the most common video formats.
    
    See the [GStreamer raw video format design document](https://gstreamer.freedesktop.org/documentation/additional/design/mediatype-video-raw.html#formats)
    for details about the layout and packing of these formats in memory.
*/
enum GstVideoFormat
{
  /**
      Unknown or unset video format id
  */
  Unknown = 0,

  /**
      Encoded video format. Only ever use that in caps for
                                 special video formats in combination with non-system
                                 memory GstCapsFeatures where it does not make sense
                                 to specify a real video format.
  */
  Encoded = 1,

  /**
      planar 4:2:0 YUV
  */
  I420 = 2,

  /**
      planar 4:2:0 YVU (like I420 but UV planes swapped)
  */
  Yv12 = 3,

  /**
      packed 4:2:2 YUV (Y0-U0-Y1-V0 Y2-U2-Y3-V2 Y4 ...)
  */
  Yuy2 = 4,

  /**
      packed 4:2:2 YUV (U0-Y0-V0-Y1 U2-Y2-V2-Y3 U4 ...)
  */
  Uyvy = 5,

  /**
      packed 4:4:4 YUV with alpha channel (A0-Y0-U0-V0 ...)
  */
  Ayuv = 6,

  /**
      sparse rgb packed into 32 bit, space last
  */
  Rgbx = 7,

  /**
      sparse reverse rgb packed into 32 bit, space last
  */
  Bgrx = 8,

  /**
      sparse rgb packed into 32 bit, space first
  */
  Xrgb = 9,

  /**
      sparse reverse rgb packed into 32 bit, space first
  */
  Xbgr = 10,

  /**
      rgb with alpha channel last
  */
  Rgba = 11,

  /**
      reverse rgb with alpha channel last
  */
  Bgra = 12,

  /**
      rgb with alpha channel first
  */
  Argb = 13,

  /**
      reverse rgb with alpha channel first
  */
  Abgr = 14,

  /**
      RGB packed into 24 bits without padding (`R-G-B-R-G-B`)
  */
  Rgb = 15,

  /**
      reverse RGB packed into 24 bits without padding (`B-G-R-B-G-R`)
  */
  Bgr = 16,

  /**
      planar 4:1:1 YUV
  */
  Y41b = 17,

  /**
      planar 4:2:2 YUV
  */
  Y42b = 18,

  /**
      packed 4:2:2 YUV (Y0-V0-Y1-U0 Y2-V2-Y3-U2 Y4 ...)
  */
  Yvyu = 19,

  /**
      planar 4:4:4 YUV
  */
  Y444 = 20,

  /**
      packed 4:2:2 10-bit YUV, complex format
  */
  V210 = 21,

  /**
      packed 4:2:2 16-bit YUV, Y0-U0-Y1-V1 order
  */
  V216 = 22,

  /**
      planar 4:2:0 YUV with interleaved UV plane
  */
  Nv12 = 23,

  /**
      planar 4:2:0 YUV with interleaved VU plane
  */
  Nv21 = 24,

  /**
      8-bit grayscale
  */
  Gray8 = 25,

  /**
      16-bit grayscale, most significant byte first
  */
  Gray16Be = 26,

  /**
      16-bit grayscale, least significant byte first
  */
  Gray16Le = 27,

  /**
      packed 4:4:4 YUV (Y-U-V ...)
  */
  V308 = 28,

  /**
      rgb 5-6-5 bits per component
  */
  Rgb16 = 29,

  /**
      reverse rgb 5-6-5 bits per component
  */
  Bgr16 = 30,

  /**
      rgb 5-5-5 bits per component
  */
  Rgb15 = 31,

  /**
      reverse rgb 5-5-5 bits per component
  */
  Bgr15 = 32,

  /**
      packed 10-bit 4:2:2 YUV (U0-Y0-V0-Y1 U2-Y2-V2-Y3 U4 ...)
  */
  Uyvp = 33,

  /**
      planar 4:4:2:0 AYUV
  */
  A420 = 34,

  /**
      8-bit paletted RGB
  */
  Rgb8p = 35,

  /**
      planar 4:1:0 YUV
  */
  Yuv9 = 36,

  /**
      planar 4:1:0 YUV (like YUV9 but UV planes swapped)
  */
  Yvu9 = 37,

  /**
      packed 4:1:1 YUV (Cb-Y0-Y1-Cr-Y2-Y3 ...)
  */
  Iyu1 = 38,

  /**
      rgb with alpha channel first, 16 bits (native endianness) per channel
  */
  Argb64 = 39,

  /**
      packed 4:4:4 YUV with alpha channel, 16 bits (native endianness) per channel (A0-Y0-U0-V0 ...)
  */
  Ayuv64 = 40,

  /**
      packed 4:4:4 RGB, 10 bits per channel
  */
  R210 = 41,

  /**
      planar 4:2:0 YUV, 10 bits per channel
  */
  I42010be = 42,

  /**
      planar 4:2:0 YUV, 10 bits per channel
  */
  I42010le = 43,

  /**
      planar 4:2:2 YUV, 10 bits per channel
  */
  I42210be = 44,

  /**
      planar 4:2:2 YUV, 10 bits per channel
  */
  I42210le = 45,

  /**
      planar 4:4:4 YUV, 10 bits per channel (Since: 1.2)
  */
  Y44410be = 46,

  /**
      planar 4:4:4 YUV, 10 bits per channel (Since: 1.2)
  */
  Y44410le = 47,

  /**
      planar 4:4:4 RGB, 8 bits per channel (Since: 1.2)
  */
  Gbr = 48,

  /**
      planar 4:4:4 RGB, 10 bits per channel (Since: 1.2)
  */
  Gbr10be = 49,

  /**
      planar 4:4:4 RGB, 10 bits per channel (Since: 1.2)
  */
  Gbr10le = 50,

  /**
      planar 4:2:2 YUV with interleaved UV plane (Since: 1.2)
  */
  Nv16 = 51,

  /**
      planar 4:4:4 YUV with interleaved UV plane (Since: 1.2)
  */
  Nv24 = 52,

  /**
      NV12 with 64x32 tiling in zigzag pattern (Since: 1.4)
  */
  Nv1264z32 = 53,

  /**
      planar 4:4:2:0 YUV, 10 bits per channel (Since: 1.6)
  */
  A42010be = 54,

  /**
      planar 4:4:2:0 YUV, 10 bits per channel (Since: 1.6)
  */
  A42010le = 55,

  /**
      planar 4:4:2:2 YUV, 10 bits per channel (Since: 1.6)
  */
  A42210be = 56,

  /**
      planar 4:4:2:2 YUV, 10 bits per channel (Since: 1.6)
  */
  A42210le = 57,

  /**
      planar 4:4:4:4 YUV, 10 bits per channel (Since: 1.6)
  */
  A44410be = 58,

  /**
      planar 4:4:4:4 YUV, 10 bits per channel (Since: 1.6)
  */
  A44410le = 59,

  /**
      planar 4:2:2 YUV with interleaved VU plane (Since: 1.6)
  */
  Nv61 = 60,

  /**
      planar 4:2:0 YUV with interleaved UV plane, 10 bits per channel (Since: 1.10)
  */
  P01010be = 61,

  /**
      planar 4:2:0 YUV with interleaved UV plane, 10 bits per channel (Since: 1.10)
  */
  P01010le = 62,

  /**
      packed 4:4:4 YUV (U-Y-V ...) (Since: 1.10)
  */
  Iyu2 = 63,

  /**
      packed 4:2:2 YUV (V0-Y0-U0-Y1 V2-Y2-U2-Y3 V4 ...)
  */
  Vyuy = 64,

  /**
      planar 4:4:4:4 ARGB, 8 bits per channel (Since: 1.12)
  */
  Gbra = 65,

  /**
      planar 4:4:4:4 ARGB, 10 bits per channel (Since: 1.12)
  */
  Gbra10be = 66,

  /**
      planar 4:4:4:4 ARGB, 10 bits per channel (Since: 1.12)
  */
  Gbra10le = 67,

  /**
      planar 4:4:4 RGB, 12 bits per channel (Since: 1.12)
  */
  Gbr12be = 68,

  /**
      planar 4:4:4 RGB, 12 bits per channel (Since: 1.12)
  */
  Gbr12le = 69,

  /**
      planar 4:4:4:4 ARGB, 12 bits per channel (Since: 1.12)
  */
  Gbra12be = 70,

  /**
      planar 4:4:4:4 ARGB, 12 bits per channel (Since: 1.12)
  */
  Gbra12le = 71,

  /**
      planar 4:2:0 YUV, 12 bits per channel (Since: 1.12)
  */
  I42012be = 72,

  /**
      planar 4:2:0 YUV, 12 bits per channel (Since: 1.12)
  */
  I42012le = 73,

  /**
      planar 4:2:2 YUV, 12 bits per channel (Since: 1.12)
  */
  I42212be = 74,

  /**
      planar 4:2:2 YUV, 12 bits per channel (Since: 1.12)
  */
  I42212le = 75,

  /**
      planar 4:4:4 YUV, 12 bits per channel (Since: 1.12)
  */
  Y44412be = 76,

  /**
      planar 4:4:4 YUV, 12 bits per channel (Since: 1.12)
  */
  Y44412le = 77,

  /**
      10-bit grayscale, packed into 32bit words (2 bits padding) (Since: 1.14)
  */
  Gray10Le32 = 78,

  /**
      10-bit variant of @GST_VIDEO_FORMAT_NV12, packed into 32bit words (MSB 2 bits padding) (Since: 1.14)
  */
  Nv1210le32 = 79,

  /**
      10-bit variant of @GST_VIDEO_FORMAT_NV16, packed into 32bit words (MSB 2 bits padding) (Since: 1.14)
  */
  Nv1610le32 = 80,

  /**
      Fully packed variant of NV12_10LE32 (Since: 1.16)
  */
  Nv1210le40 = 81,

  /**
      packed 4:2:2 YUV, 10 bits per channel (Since: 1.16)
  */
  Y210 = 82,

  /**
      packed 4:4:4 YUV, 10 bits per channel(A-V-Y-U...) (Since: 1.16)
  */
  Y410 = 83,

  /**
      packed 4:4:4 YUV with alpha channel (V0-U0-Y0-A0...) (Since: 1.16)
  */
  Vuya = 84,

  /**
      packed 4:4:4 RGB with alpha channel(B-G-R-A), 10 bits for R/G/B channel and MSB 2 bits for alpha channel (Since: 1.16)
  */
  Bgr10a2Le = 85,

  /**
      packed 4:4:4 RGB with alpha channel(R-G-B-A), 10 bits for R/G/B channel and MSB 2 bits for alpha channel (Since: 1.18)
  */
  Rgb10a2Le = 86,

  /**
      planar 4:4:4 YUV, 16 bits per channel (Since: 1.18)
  */
  Y44416be = 87,

  /**
      planar 4:4:4 YUV, 16 bits per channel (Since: 1.18)
  */
  Y44416le = 88,

  /**
      planar 4:2:0 YUV with interleaved UV plane, 16 bits per channel (Since: 1.18)
  */
  P016Be = 89,

  /**
      planar 4:2:0 YUV with interleaved UV plane, 16 bits per channel (Since: 1.18)
  */
  P016Le = 90,

  /**
      planar 4:2:0 YUV with interleaved UV plane, 12 bits per channel (Since: 1.18)
  */
  P012Be = 91,

  /**
      planar 4:2:0 YUV with interleaved UV plane, 12 bits per channel (Since: 1.18)
  */
  P012Le = 92,

  /**
      packed 4:2:2 YUV, 12 bits per channel (Y-U-Y-V) (Since: 1.18)
  */
  Y212Be = 93,

  /**
      packed 4:2:2 YUV, 12 bits per channel (Y-U-Y-V) (Since: 1.18)
  */
  Y212Le = 94,

  /**
      packed 4:4:4:4 YUV, 12 bits per channel(U-Y-V-A...) (Since: 1.18)
  */
  Y412Be = 95,

  /**
      packed 4:4:4:4 YUV, 12 bits per channel(U-Y-V-A...) (Since: 1.18)
  */
  Y412Le = 96,

  /**
      NV12 with 4x4 tiles in linear order.
  */
  Nv124l4 = 97,

  /**
      NV12 with 32x32 tiles in linear order.
  */
  Nv1232l32 = 98,

  /**
      Planar 4:4:4 RGB, R-G-B order
  */
  Rgbp = 99,

  /**
      Planar 4:4:4 RGB, B-G-R order
  */
  Bgrp = 100,

  /**
      Planar 4:2:0 YUV with interleaved UV plane with alpha as
      3rd plane.
  */
  Av12 = 101,

  /**
      RGB with alpha channel first, 16 bits (little endian)
      per channel.
  */
  Argb64Le = 102,

  /**
      RGB with alpha channel first, 16 bits (big endian)
      per channel.
  */
  Argb64Be = 103,

  /**
      RGB with alpha channel last, 16 bits (little endian)
      per channel.
  */
  Rgba64Le = 104,

  /**
      RGB with alpha channel last, 16 bits (big endian)
      per channel.
  */
  Rgba64Be = 105,

  /**
      Reverse RGB with alpha channel last, 16 bits (little endian)
      per channel.
  */
  Bgra64Le = 106,

  /**
      Reverse RGB with alpha channel last, 16 bits (big endian)
      per channel.
  */
  Bgra64Be = 107,

  /**
      Reverse RGB with alpha channel first, 16 bits (little endian)
      per channel.
  */
  Abgr64Le = 108,

  /**
      Reverse RGB with alpha channel first, 16 bits (big endian)
      per channel.
  */
  Abgr64Be = 109,

  /**
      NV12 with 16x32 Y tiles and 16x16 UV tiles.
  */
  Nv1216l32s = 110,

  /**
      NV12 with 8x128 tiles in linear order.
  */
  Nv128l128 = 111,

  /**
      NV12 10bit big endian with 8x128 tiles in linear order.
  */
  Nv1210be8l128 = 112,

  /**
      @GST_VIDEO_FORMAT_NV12_10LE40 with 4x4 pixels tiles (5 bytes
       per tile row). This format is produced by Verisilicon/Hantro decoders.
  */
  Nv1210le404l4 = 113,

  /**
      @GST_VIDEO_FORMAT_DMA_DRM represent the DMA DRM special format. It's
      only used with memory:DMABuf #GstCapsFeatures, where an extra
      parameter (drm-format) is required to define the image format and
      its memory layout.
  */
  DmaDrm = 114,

  /**
      Mediatek 10bit NV12 little endian with 16x32 tiles in linear order, tile 2
      bits.
  */
  Mt2110t = 115,

  /**
      Mediatek 10bit NV12 little endian with 16x32 tiles in linear order, raster
      2 bits.
  */
  Mt2110r = 116,

  /**
      planar 4:4:2:2 YUV, 8 bits per channel
  */
  A422 = 117,

  /**
      planar 4:4:4:4 YUV, 8 bits per channel
  */
  A444 = 118,

  /**
      planar 4:4:4:4 YUV, 12 bits per channel
  */
  A44412le = 119,

  /**
      planar 4:4:4:4 YUV, 12 bits per channel
  */
  A44412be = 120,

  /**
      planar 4:4:2:2 YUV, 12 bits per channel
  */
  A42212le = 121,

  /**
      planar 4:4:2:2 YUV, 12 bits per channel
  */
  A42212be = 122,

  /**
      planar 4:4:2:0 YUV, 12 bits per channel
  */
  A42012le = 123,

  /**
      planar 4:4:2:0 YUV, 12 bits per channel
  */
  A42012be = 124,

  /**
      planar 4:4:4:4 YUV, 16 bits per channel
  */
  A44416le = 125,

  /**
      planar 4:4:4:4 YUV, 16 bits per channel
  */
  A44416be = 126,

  /**
      planar 4:4:2:2 YUV, 16 bits per channel
  */
  A42216le = 127,

  /**
      planar 4:4:2:2 YUV, 16 bits per channel
  */
  A42216be = 128,

  /**
      planar 4:4:2:0 YUV, 16 bits per channel
  */
  A42016le = 129,

  /**
      planar 4:4:2:0 YUV, 16 bits per channel
  */
  A42016be = 130,

  /**
      planar 4:4:4 RGB, 16 bits per channel
  */
  Gbr16le = 131,

  /**
      planar 4:4:4 RGB, 16 bits per channel
  */
  Gbr16be = 132,

  /**
      packed RGB with alpha, 8 bits per channel
  */
  Rbga = 133,
}

/**
    The different video flags that a format info can have.
*/
enum GstVideoFormatFlags : uint
{
  /**
      The video format is YUV, components are numbered
        0=Y, 1=U, 2=V.
  */
  Yuv = 1,

  /**
      The video format is RGB, components are numbered
        0=R, 1=G, 2=B.
  */
  Rgb = 2,

  /**
      The video is gray, there is one gray component
        with index 0.
  */
  Gray = 4,

  /**
      The video format has an alpha components with
        the number 3.
  */
  Alpha = 8,

  /**
      The video format has data stored in little
        endianness.
  */
  Le = 16,

  /**
      The video format has a palette. The palette
        is stored in the second plane and indexes are stored in the first plane.
  */
  Palette = 32,

  /**
      The video format has a complex layout that
        can't be described with the usual information in the #GstVideoFormatInfo.
  */
  Complex = 64,

  /**
      This format can be used in a
        #GstVideoFormatUnpack and #GstVideoFormatPack function.
  */
  Unpack = 128,

  /**
      The format is tiled, there is tiling information
        in the last plane.
  */
  Tiled = 256,

  /**
      The tile size varies per plane according to the subsampling.
  */
  Subtiles = 512,
}

/**
    Extra video frame flags
*/
enum GstVideoFrameFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      The video frame is interlaced. In mixed
                interlace-mode, this flag specifies if the frame is interlaced or
                progressive.
  */
  Interlaced = 1,

  /**
      The video frame has the top field first
  */
  Tff = 2,

  /**
      The video frame has the repeat flag
  */
  Rff = 4,

  /**
      The video frame has one field
  */
  Onefield = 8,

  /**
      The video contains one or
          more non-mono views
  */
  MultipleView = 16,

  /**
      The video frame is the first
          in a set of corresponding views provided as sequential frames.
  */
  FirstInBundle = 32,

  /**
      The video frame has the top field only. This
          is the same as GST_VIDEO_FRAME_FLAG_TFF | GST_VIDEO_FRAME_FLAG_ONEFIELD
          (Since: 1.16).
  */
  TopField = 10,

  /**
      The video frame has the bottom field
          only. This is the same as GST_VIDEO_FRAME_FLAG_ONEFIELD
          (GST_VIDEO_FRAME_FLAG_TFF flag unset) (Since: 1.16).
  */
  BottomField = 8,
}

/**
    Additional mapping flags for [gstvideo.video_frame.VideoFrame.map].
*/
enum GstVideoFrameMapFlags : uint
{
  /**
      Don't take another reference of the buffer and store it in
                                         the GstVideoFrame. This makes sure that the buffer stays
                                         writable while the frame is mapped, but requires that the
                                         buffer reference stays valid until the frame is unmapped again.
  */
  NoRef = 65536,

  /**
      Offset to define more flags
  */
  Last = 16777216,
}

/**
    The orientation of the GL texture.
*/
enum GstVideoGLTextureOrientation
{
  /**
      Top line first in memory, left row first
  */
  NormalYNormal = 0,

  /**
      Bottom line first in memory, left row first
  */
  NormalYFlip = 1,

  /**
      Top line first in memory, right row first
  */
  FlipYNormal = 2,

  /**
      Bottom line first in memory, right row first
  */
  FlipYFlip = 3,
}

/**
    The GL texture type.
*/
enum GstVideoGLTextureType
{
  /**
      Luminance texture, GL_LUMINANCE
  */
  Luminance = 0,

  /**
      Luminance-alpha texture, GL_LUMINANCE_ALPHA
  */
  LuminanceAlpha = 1,

  /**
      RGB 565 texture, GL_RGB
  */
  Rgb16 = 2,

  /**
      RGB texture, GL_RGB
  */
  Rgb = 3,

  /**
      RGBA texture, GL_RGBA
  */
  Rgba = 4,

  /**
      R texture, GL_RED_EXT
  */
  R = 5,

  /**
      RG texture, GL_RG_EXT
  */
  Rg = 6,
}

/** */
enum GstVideoGammaMode
{
  /**
      disable gamma handling
  */
  None = 0,

  /**
      convert between input and output gamma
      Different gamma conversion modes
  */
  Remap = 1,
}

/**
    The possible values of the #GstVideoInterlaceMode describing the interlace
    mode of the stream.
*/
enum GstVideoInterlaceMode
{
  /**
      all frames are progressive
  */
  Progressive = 0,

  /**
      2 fields are interleaved in one video
          frame. Extra buffer flags describe the field order.
  */
  Interleaved = 1,

  /**
      frames contains both interlaced and
          progressive video, the buffer flags describe the frame and fields.
  */
  Mixed = 2,

  /**
      2 fields are stored in one buffer, use the
          frame ID to get access to the required field. For multiview (the
          'views' property > 1) the fields of view N can be found at frame ID
          (N * 2) and (N * 2) + 1.
          Each field has only half the amount of lines as noted in the
          height property. This mode requires multiple GstVideoMeta metadata
          to describe the fields.
  */
  Fields = 3,

  /**
      1 field is stored in one buffer,
          @GST_VIDEO_BUFFER_FLAG_TF or @GST_VIDEO_BUFFER_FLAG_BF indicates if
          the buffer is carrying the top or bottom field, respectively. The top and
          bottom buffers must alternate in the pipeline, with this mode
          (Since: 1.16).
  */
  Alternate = 4,
}

/**
    Different color matrix conversion modes
*/
enum GstVideoMatrixMode
{
  /**
      do conversion between color matrices
  */
  Full = 0,

  /**
      use the input color matrix to convert
        to and from R'G'B
  */
  InputOnly = 1,

  /**
      use the output color matrix to convert
        to and from R'G'B
  */
  OutputOnly = 2,

  /**
      disable color matrix conversion.
  */
  None = 3,
}

/**
    GstVideoMultiviewFlags are used to indicate extra properties of a
    stereo/multiview stream beyond the frame layout and buffer mapping
    that is conveyed in the #GstVideoMultiviewMode.
*/
enum GstVideoMultiviewFlags : uint
{
  /**
      No flags
  */
  None = 0,

  /**
      For stereo streams, the
          normal arrangement of left and right views is reversed.
  */
  RightViewFirst = 1,

  /**
      The left view is vertically
          mirrored.
  */
  LeftFlipped = 2,

  /**
      The left view is horizontally
          mirrored.
  */
  LeftFlopped = 4,

  /**
      The right view is
          vertically mirrored.
  */
  RightFlipped = 8,

  /**
      The right view is
          horizontally mirrored.
  */
  RightFlopped = 16,

  /**
      For frame-packed
          multiview modes, indicates that the individual
          views have been encoded with half the true width or height
          and should be scaled back up for display. This flag
          is used for overriding input layout interpretation
          by adjusting pixel-aspect-ratio.
          For side-by-side, column interleaved or checkerboard packings, the
          pixel width will be doubled. For row interleaved and top-bottom
          encodings, pixel height will be doubled.
  */
  HalfAspect = 16384,

  /**
      The video stream contains both
          mono and multiview portions, signalled on each buffer by the
          absence or presence of the @GST_VIDEO_BUFFER_FLAG_MULTIPLE_VIEW
          buffer flag.
  */
  MixedMono = 32768,
}

/**
    #GstVideoMultiviewFramePacking represents the subset of #GstVideoMultiviewMode
    values that can be applied to any video frame without needing extra metadata.
    It can be used by elements that provide a property to override the
    multiview interpretation of a video stream when the video doesn't contain
    any markers.
    
    This enum is used (for example) on playbin, to re-interpret a played
    video stream as a stereoscopic video. The individual enum values are
    equivalent to and have the same value as the matching #GstVideoMultiviewMode.
*/
enum GstVideoMultiviewFramePacking
{
  /**
      A special value indicating
      no frame packing info.
  */
  None = -1,

  /**
      All frames are monoscopic.
  */
  Mono = 0,

  /**
      All frames represent a left-eye view.
  */
  Left = 1,

  /**
      All frames represent a right-eye view.
  */
  Right = 2,

  /**
      Left and right eye views are
      provided in the left and right half of the frame respectively.
  */
  SideBySide = 3,

  /**
      Left and right eye
      views are provided in the left and right half of the frame, but
      have been sampled using quincunx method, with half-pixel offset
      between the 2 views.
  */
  SideBySideQuincunx = 4,

  /**
      Alternating vertical
      columns of pixels represent the left and right eye view respectively.
  */
  ColumnInterleaved = 5,

  /**
      Alternating horizontal
      rows of pixels represent the left and right eye view respectively.
  */
  RowInterleaved = 6,

  /**
      The top half of the frame
      contains the left eye, and the bottom half the right eye.
  */
  TopBottom = 7,

  /**
      Pixels are arranged with
      alternating pixels representing left and right eye views in a
      checkerboard fashion.
  */
  Checkerboard = 8,
}

/**
    All possible stereoscopic 3D and multiview representations.
    In conjunction with #GstVideoMultiviewFlags, describes how
    multiview content is being transported in the stream.
*/
enum GstVideoMultiviewMode
{
  /**
      A special value indicating
      no multiview information. Used in GstVideoInfo and other places to
      indicate that no specific multiview handling has been requested or
      provided. This value is never carried on caps.
  */
  None = -1,

  /**
      All frames are monoscopic.
  */
  Mono = 0,

  /**
      All frames represent a left-eye view.
  */
  Left = 1,

  /**
      All frames represent a right-eye view.
  */
  Right = 2,

  /**
      Left and right eye views are
      provided in the left and right half of the frame respectively.
  */
  SideBySide = 3,

  /**
      Left and right eye
      views are provided in the left and right half of the frame, but
      have been sampled using quincunx method, with half-pixel offset
      between the 2 views.
  */
  SideBySideQuincunx = 4,

  /**
      Alternating vertical
      columns of pixels represent the left and right eye view respectively.
  */
  ColumnInterleaved = 5,

  /**
      Alternating horizontal
      rows of pixels represent the left and right eye view respectively.
  */
  RowInterleaved = 6,

  /**
      The top half of the frame
      contains the left eye, and the bottom half the right eye.
  */
  TopBottom = 7,

  /**
      Pixels are arranged with
      alternating pixels representing left and right eye views in a
      checkerboard fashion.
  */
  Checkerboard = 8,

  /**
      Left and right eye views
      are provided in separate frames alternately.
  */
  FrameByFrame = 32,

  /**
      Multiple
      independent views are provided in separate frames in sequence.
      This method only applies to raw video buffers at the moment.
      Specific view identification is via the `GstVideoMultiviewMeta`
      and #GstVideoMeta(s) on raw video buffers.
  */
  MultiviewFrameByFrame = 33,

  /**
      Multiple views are
      provided as separate #GstMemory framebuffers attached to each
      #GstBuffer, described by the `GstVideoMultiviewMeta`
      and #GstVideoMeta(s)
  */
  Separated = 34,
}

/**
    The different video orientation methods.
*/
enum GstVideoOrientationMethod
{
  /**
      Identity (no rotation)
  */
  Identity = 0,

  /**
      Rotate clockwise 90 degrees
  */
  _90r = 1,

  /**
      Rotate 180 degrees
  */
  _180 = 2,

  /**
      Rotate counter-clockwise 90 degrees
  */
  _90l = 3,

  /**
      Flip horizontally
  */
  Horiz = 4,

  /**
      Flip vertically
  */
  Vert = 5,

  /**
      Flip across upper left/lower right diagonal
  */
  UlLr = 6,

  /**
      Flip across upper right/lower left diagonal
  */
  UrLl = 7,

  /**
      Select flip method based on image-orientation tag
  */
  Auto = 8,

  /**
      Current status depends on plugin internal setup
  */
  Custom = 9,
}

/**
    Overlay format flags.
*/
enum GstVideoOverlayFormatFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      RGB are premultiplied by A/255.
  */
  PremultipliedAlpha = 1,

  /**
      a global-alpha value != 1 is set.
  */
  GlobalAlpha = 2,
}

/**
    The different flags that can be used when packing and unpacking.
*/
enum GstVideoPackFlags : uint
{
  /**
      No flag
  */
  None = 0,

  /**
      When the source has a smaller depth
        than the target format, set the least significant bits of the target
        to 0. This is likely slightly faster but less accurate. When this flag
        is not specified, the most significant bits of the source are duplicated
        in the least significant bits of the destination.
  */
  TruncateRange = 1,

  /**
      The source is interlaced. The unpacked
        format will be interlaced as well with each line containing
        information from alternating fields. (Since: 1.2)
  */
  Interlaced = 2,
}

/**
    Different primaries conversion modes
*/
enum GstVideoPrimariesMode
{
  /**
      disable conversion between primaries
  */
  None = 0,

  /**
      do conversion between primaries only
        when it can be merged with color matrix conversion.
  */
  MergeOnly = 1,

  /**
      fast conversion between primaries
  */
  Fast = 2,
}

/**
    Different resampler flags.
*/
enum GstVideoResamplerFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      when no taps are given, half the
                   number of calculated taps. This can be used when making scalers
                   for the different fields of an interlaced picture. Since: 1.10
  */
  HalfTaps = 1,
}

/**
    Different subsampling and upsampling methods
*/
enum GstVideoResamplerMethod
{
  /**
      Duplicates the samples when
         upsampling and drops when downsampling
  */
  Nearest = 0,

  /**
      Uses linear interpolation to reconstruct
         missing samples and averaging to downsample
  */
  Linear = 1,

  /**
      Uses cubic interpolation
  */
  Cubic = 2,

  /**
      Uses sinc interpolation
  */
  Sinc = 3,

  /**
      Uses lanczos interpolation
  */
  Lanczos = 4,
}

/**
    Different scale flags.
*/
enum GstVideoScalerFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      Set up a scaler for interlaced content
  */
  Interlaced = 1,
}

/**
    Enum value describing the available tiling modes.
*/
enum GstVideoTileMode
{
  /**
      Unknown or unset tile mode
  */
  Unknown = 0,

  /**
      Every four adjacent blocks - two
         horizontally and two vertically are grouped together and are located
         in memory in Z or flipped Z order. In case of odd rows, the last row
         of blocks is arranged in linear order.
  */
  Zflipz2x2 = 65536,

  /**
      Tiles are in row order.
  */
  Linear = 131072,
}

/**
    Enum value describing the most common tiling types.
*/
enum GstVideoTileType
{
  /**
      Tiles are indexed. Use
        gst_video_tile_get_index () to retrieve the tile at the requested
        coordinates.
  */
  Indexed = 0,
}

/**
    Flags related to the time code information.
    For drop frame, only 30000/1001 and 60000/1001 frame rates are supported.
*/
enum GstVideoTimeCodeFlags : uint
{
  /**
      No flags
  */
  None = 0,

  /**
      Whether we have drop frame rate
  */
  DropFrame = 1,

  /**
      Whether we have interlaced video
  */
  Interlaced = 2,
}

/**
    The video transfer function defines the formula for converting between
    non-linear RGB (R'G'B') and linear RGB
*/
enum GstVideoTransferFunction
{
  /**
      unknown transfer function
  */
  Unknown = 0,

  /**
      linear RGB, gamma 1.0 curve
  */
  Gamma10 = 1,

  /**
      Gamma 1.8 curve
  */
  Gamma18 = 2,

  /**
      Gamma 2.0 curve
  */
  Gamma20 = 3,

  /**
      Gamma 2.2 curve
  */
  Gamma22 = 4,

  /**
      Gamma 2.2 curve with a linear segment in the lower
                                range, also ITU-R BT470M / ITU-R BT1700 625 PAL &
                                SECAM / ITU-R BT1361
  */
  Bt709 = 5,

  /**
      Gamma 2.2 curve with a linear segment in the
                                    lower range
  */
  Smpte240m = 6,

  /**
      Gamma 2.4 curve with a linear segment in the lower
                               range. IEC 61966-2-1 (sRGB or sYCC)
  */
  Srgb = 7,

  /**
      Gamma 2.8 curve, also ITU-R BT470BG
  */
  Gamma28 = 8,

  /**
      Logarithmic transfer characteristic
                                  100:1 range
  */
  Log100 = 9,

  /**
      Logarithmic transfer characteristic
                                  316.22777:1 range (100 * sqrt(10) : 1)
  */
  Log316 = 10,

  /**
      Gamma 2.2 curve with a linear segment in the lower
                                     range. Used for BT.2020 with 12 bits per
                                     component. Since: 1.6
  */
  Bt202012 = 11,

  /**
      Gamma 2.19921875. Since: 1.8
  */
  Adobergb = 12,

  /**
      Rec. ITU-R BT.2020-2 with 10 bits per component.
                                     (functionally the same as the values
                                     GST_VIDEO_TRANSFER_BT709 and GST_VIDEO_TRANSFER_BT601).
                                     Since: 1.18
  */
  Bt202010 = 13,

  /**
      SMPTE ST 2084 for 10, 12, 14, and 16-bit systems.
                                     Known as perceptual quantization (PQ)
                                     Since: 1.18
  */
  Smpte2084 = 14,

  /**
      Association of Radio Industries and Businesses (ARIB)
                                        STD-B67 and Rec. ITU-R BT.2100-1 hybrid loggamma (HLG) system
                                        Since: 1.18
  */
  AribStdB67 = 15,

  /**
      also known as SMPTE170M / ITU-R BT1358 525 or 625 / ITU-R BT1700 NTSC
  */
  Bt601 = 16,
}

/**
    Return values for #GstVideoVBIParser
*/
enum GstVideoVBIParserResult
{
  /**
      No line were provided, or no more Ancillary data was found.
  */
  Done = 0,

  /**
      A #GstVideoAncillary was found.
  */
  Ok = 1,

  /**
      An error occurred
  */
  Error = 2,
}

/**
    #GstMeta for carrying SMPTE-291M Ancillary data. Note that all the ADF fields
       (@DID to @checksum) are 10bit values with parity/non-parity high-bits set.
*/
struct GstAncillaryMeta
{
  /**
      Parent #GstMeta
  */
  GstMeta meta;

  /**
      The field where the ancillary data is located
  */
  GstAncillaryMetaField field;

  /**
      Which channel (luminance or chrominance) the ancillary
         data is located. 0 if content is SD or stored in the luminance channel
         (default). 1 if HD and stored in the chrominance channel.
  */
  gboolean cNotYChannel;

  /**
      The line on which the ancillary data is located (max 11bit). There
         are two special values: 0x7ff if no line is specified (default), 0x7fe
         to specify the ancillary data is on any valid line before active video
  */
  ushort line;

  /**
      The location of the ancillary data packet in a SDI raster relative
         to the start of active video (max 12bits). A value of 0 means the ADF of
         the ancillary packet starts immediately following SAV. There are 3
         special values: 0xfff: No specified location (default), 0xffe: within
         HANC data space, 0xffd: within the ancillary data space located between
         SAV and EAV
  */
  ushort offset;

  /**
      Data Identified
  */
  ushort DID;

  /**
      Secondary Data identification (if type 2) or Data block
         number (if type 1)
  */
  ushort SDIDBlockNumber;

  /**
      The amount of user data
  */
  ushort dataCount;

  /**
      The User data
  */
  ushort* data;

  /**
      The checksum of the ADF
  */
  ushort checksum;
}

/**
    This interface is implemented by elements which can perform some color
    balance operation on video frames they process. For example, modifying
    the brightness, contrast, hue or saturation.
    
    Example elements are 'xvimagesink' and 'colorbalance'
*/
struct GstColorBalance;

/**
    The #GstColorBalanceChannel object represents a parameter
    for modifying the color balance implemented by an element providing the
    #GstColorBalance interface. For example, Hue or Saturation.
*/
struct GstColorBalanceChannel
{
  /** */
  GObject parent;

  /**
      A string containing a descriptive name for this channel
  */
  char* label;

  /**
      The minimum valid value for this channel.
  */
  int minValue;

  /**
      The maximum valid value for this channel.
  */
  int maxValue;

  /** */
  void*[4] GstReserved;
}

/**
    Color-balance channel class.
*/
struct GstColorBalanceChannelClass
{
  /**
      the parent class
  */
  GObjectClass parent;

  /**
      default handler for value changed notification
  */
  extern(C) void function(GstColorBalanceChannel* channel, int value) valueChanged;

  /** */
  void*[4] GstReserved;
}

/**
    Color-balance interface.
*/
struct GstColorBalanceInterface
{
  /**
      the parent interface
  */
  GTypeInterface iface;

  /**
      list handled channels
  */
  extern(C) const(GList)* function(GstColorBalance* balance) listChannels;

  /**
      set a channel value
  */
  extern(C) void function(GstColorBalance* balance, GstColorBalanceChannel* channel, int value) setValue;

  /**
      get a channel value
  */
  extern(C) int function(GstColorBalance* balance, GstColorBalanceChannel* channel) getValue;

  /**
      implementation type
  */
  extern(C) GstColorBalanceType function(GstColorBalance* balance) getBalanceType;

  /**
      default handler for value changed notification
  */
  extern(C) void function(GstColorBalance* balance, GstColorBalanceChannel* channel, int value) valueChanged;

  /** */
  void*[4] GstReserved;
}

/**
    The Navigation interface is used for creating and injecting navigation
    related events such as mouse button presses, cursor motion and key presses.
    The associated library also provides methods for parsing received events, and
    for sending and receiving navigation related bus events. One main usecase is
    DVD menu navigation.
    
    The main parts of the API are:
    
    $(LIST
      * The GstNavigation interface, implemented by elements which provide an
        application with the ability to create and inject navigation events into
        the pipeline.
      * GstNavigation event handling API. GstNavigation events are created in
        response to calls on a GstNavigation interface implementation, and sent in
        the pipeline. Upstream elements can use the navigation event API functions
        to parse the contents of received messages.
      
      * GstNavigation message handling API. GstNavigation messages may be sent on
        the message bus to inform applications of navigation related changes in the
        pipeline, such as the mouse moving over a clickable region, or the set of
        available angles changing.
    )
      
    The GstNavigation message functions provide functions for creating and
    parsing custom bus messages for signaling GstNavigation changes.
*/
struct GstNavigation;

/**
    Navigation interface.
*/
struct GstNavigationInterface
{
  /**
      the parent interface
  */
  GTypeInterface iface;

  /**
      sending a navigation event
  */
  extern(C) void function(GstNavigation* navigation, GstStructure* structure) sendEvent;

  /**
      sending a navigation event (Since: 1.22)
  */
  extern(C) void function(GstNavigation* navigation, GstEvent* event) sendEventSimple;
}

/**
    Active Format Description (AFD)
    
    For details, see Table 6.14 Active Format in:
    
    ATSC Digital Television Standard:
    Part 4 – MPEG-2 Video System Characteristics
    
    https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
    
    and Active Format Description in Complete list of AFD codes
    
    https://en.wikipedia.org/wiki/Active_Format_Description#Complete_list_of_AFD_codes
    
    and SMPTE ST2016-1
*/
struct GstVideoAFDMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      0 for progressive or field 1 and 1 for field 2
  */
  ubyte field;

  /**
      #GstVideoAFDSpec that applies to @afd
  */
  GstVideoAFDSpec spec;

  /**
      #GstVideoAFDValue AFD value
  */
  GstVideoAFDValue afd;
}

/**
    Extra buffer metadata for performing an affine transformation using a 4x4
    matrix. The transformation matrix can be composed with
    [gstvideo.video_affine_transformation_meta.VideoAffineTransformationMeta.applyMatrix].
    
    The vertices operated on are all in the range 0 to 1, not in
    Normalized Device Coordinates (-1 to +1). Transforming points in this space
    are assumed to have an origin at (0.5, 0.5, 0.5) in a left-handed coordinate
    system with the x-axis moving horizontally (positive values to the right),
    the y-axis moving vertically (positive values up the screen) and the z-axis
    perpendicular to the screen (positive values into the screen).
*/
struct GstVideoAffineTransformationMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      the column-major 4x4 transformation matrix
  */
  float[16] matrix;
}

/**
    VideoAggregator can accept AYUV, ARGB and BGRA video streams. For each of the requested
    sink pads it will compare the incoming geometry and framerate to define the
    output parameters. Indeed output video frames will have the geometry of the
    biggest incoming video stream and the framerate of the fastest incoming one.
    
    VideoAggregator will do colorspace conversion.
    
    Zorder for each input stream can be configured on the
    #GstVideoAggregatorPad.
*/
struct GstVideoAggregator
{
  /** */
  GstAggregator aggregator;

  /**
      The #GstVideoInfo representing the currently set
      srcpad caps.
  */
  GstVideoInfo info;

  /** */
  GstVideoAggregatorPrivate* priv;

  /** */
  void*[20] GstReserved;
}

/** */
struct GstVideoAggregatorClass
{
  /** */
  GstAggregatorClass parentClass;

  /**
      Optional.
                                 Lets subclasses update the #GstCaps representing
                                 the src pad caps before usage.  Return null to indicate failure.
  */
  extern(C) GstCaps* function(GstVideoAggregator* videoaggregator, GstCaps* caps) updateCaps;

  /**
      Lets subclasses aggregate frames that are ready. Subclasses
                                 should iterate the GstElement.sinkpads and use the already
                                 mapped #GstVideoFrame from [gstvideo.video_aggregator_pad.VideoAggregatorPad.getPreparedFrame]
                                 or directly use the #GstBuffer from [gstvideo.video_aggregator_pad.VideoAggregatorPad.getCurrentBuffer]
                                 if it needs to map the buffer in a special way. The result of the
                                 aggregation should land in @outbuffer.
  */
  extern(C) GstFlowReturn function(GstVideoAggregator* videoaggregator, GstBuffer* outbuffer) aggregateFrames;

  /**
      Optional.
                                 Lets subclasses provide a #GstBuffer to be used as @outbuffer of
                                 the #aggregate_frames vmethod.
  */
  extern(C) GstFlowReturn function(GstVideoAggregator* videoaggregator, GstBuffer** outbuffer) createOutputBuffer;

  /**
      Optional.
                                 Lets subclasses decide of the best common format to use.
  */
  extern(C) void function(GstVideoAggregator* vagg, GstCaps* downstreamCaps, GstVideoInfo* bestInfo, gboolean* atLeastOneAlpha) findBestFormat;

  /** */
  void*[20] GstReserved;
}

/**
    An implementation of GstPad that can be used with #GstVideoAggregator.
    
    See #GstVideoAggregator for more details.
*/
struct GstVideoAggregatorConvertPad
{
  /** */
  GstVideoAggregatorPad parent;

  /** */
  GstVideoAggregatorConvertPadPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstVideoAggregatorConvertPadClass
{
  /** */
  GstVideoAggregatorPadClass parentClass;

  /** */
  extern(C) void function(GstVideoAggregatorConvertPad* pad, GstVideoAggregator* agg, GstVideoInfo* conversionInfo) createConversionInfo;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstVideoAggregatorConvertPadPrivate;

/** */
struct GstVideoAggregatorPad
{
  /** */
  GstAggregatorPad parent;

  /**
      The #GstVideoInfo currently set on the pad
  */
  GstVideoInfo info;

  /** */
  GstVideoAggregatorPadPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstVideoAggregatorPadClass
{
  /** */
  GstAggregatorPadClass parentClass;

  /**
      Called when either the input or output formats
                               have changed.
  */
  extern(C) void function(GstVideoAggregatorPad* pad) updateConversionInfo;

  /**
      Prepare the frame from the pad buffer and sets it to prepared_frame.
           Implementations should always return TRUE.  Returning FALSE will cease
           iteration over subsequent pads.
  */
  extern(C) gboolean function(GstVideoAggregatorPad* pad, GstVideoAggregator* videoaggregator, GstBuffer* buffer, GstVideoFrame* preparedFrame) prepareFrame;

  /**
      clean the frame previously prepared in prepare_frame
  */
  extern(C) void function(GstVideoAggregatorPad* pad, GstVideoAggregator* videoaggregator, GstVideoFrame* preparedFrame) cleanFrame;

  /** */
  extern(C) void function(GstVideoAggregatorPad* pad, GstVideoAggregator* videoaggregator, GstBuffer* buffer, GstVideoFrame* preparedFrame) prepareFrameStart;

  /** */
  extern(C) void function(GstVideoAggregatorPad* pad, GstVideoAggregator* videoaggregator, GstVideoFrame* preparedFrame) prepareFrameFinish;

  /** */
  void*[18] GstReserved;
}

/** */
struct GstVideoAggregatorPadPrivate;

/**
    An implementation of GstPad that can be used with #GstVideoAggregator.
    
    See #GstVideoAggregator for more details.
*/
struct GstVideoAggregatorParallelConvertPad
{
  /** */
  GstVideoAggregatorConvertPad parentInstance;
}

/** */
struct GstVideoAggregatorParallelConvertPadClass
{
  /** */
  GstVideoAggregatorConvertPadClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstVideoAggregatorPrivate;

/**
    Extra alignment parameters for the memory of video buffers. This
    structure is usually used to configure the bufferpool if it supports the
    #GST_BUFFER_POOL_OPTION_VIDEO_ALIGNMENT.
*/
struct GstVideoAlignment
{
  /**
      extra pixels on the top
  */
  uint paddingTop;

  /**
      extra pixels on the bottom
  */
  uint paddingBottom;

  /**
      extra pixels on the left side
  */
  uint paddingLeft;

  /**
      extra pixels on the right side
  */
  uint paddingRight;

  /**
      array with extra alignment requirements for the strides
  */
  uint[4] strideAlign;
}

/**
    Video Ancillary data, according to SMPTE-291M specification.
    
    Note that the contents of the data are always stored as 8bit data (i.e. do not contain
    the parity check bits).
*/
struct GstVideoAncillary
{
  /**
      The Data Identifier
  */
  ubyte DID;

  /**
      The Secondary Data Identifier (if type 2) or the Data
                          Block Number (if type 1)
  */
  ubyte SDIDBlockNumber;

  /**
      The amount of data (in bytes) in @data (max 255 bytes)
  */
  ubyte dataCount;

  /**
      The user data content of the Ancillary packet.
         Does not contain the ADF, DID, SDID nor CS.
  */
  ubyte* data;

  /** */
  void*[4] GstReserved;
}

/**
    Bar data should be included in video user data
    whenever the rectangular picture area containing useful information
    does not extend to the full height or width of the coded frame
    and AFD alone is insufficient to describe the extent of the image.
    
    Note: either vertical or horizontal bars are specified, but not both.
    
    For more details, see:
    
    https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
    
    and SMPTE ST2016-1
*/
struct GstVideoBarMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      0 for progressive or field 1 and 1 for field 2
  */
  ubyte field;

  /**
      if true then bar data specifies letterbox, otherwise pillarbox
  */
  gboolean isLetterbox;

  /**
      If @is_letterbox is true, then the value specifies the
           last line of a horizontal letterbox bar area at top of reconstructed frame.
           Otherwise, it specifies the last horizontal luminance sample of a vertical pillarbox
           bar area at the left side of the reconstructed frame
  */
  uint barData1;

  /**
      If @is_letterbox is true, then the value specifies the
           first line of a horizontal letterbox bar area at bottom of reconstructed frame.
           Otherwise, it specifies the first horizontal
           luminance sample of a vertical pillarbox bar area at the right side of the reconstructed frame.
  */
  uint barData2;
}

/** */
struct GstVideoBufferPool
{
  /** */
  GstBufferPool bufferpool;

  /** */
  GstVideoBufferPoolPrivate* priv;
}

/** */
struct GstVideoBufferPoolClass
{
  /** */
  GstBufferPoolClass parentClass;
}

/** */
struct GstVideoBufferPoolPrivate;

/**
    Extra buffer metadata providing Closed Caption.
*/
struct GstVideoCaptionMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      The type of Closed Caption contained in the meta.
  */
  GstVideoCaptionType captionType;

  /**
      The Closed Caption data.
  */
  ubyte* data;

  /**
      The size in bytes of @data
  */
  size_t size;
}

/** */
struct GstVideoChromaResample;

/**
    This meta is primarily for internal use in GStreamer elements to support
    VP8/VP9 transparent video stored into WebM or Matroska containers, or
    transparent static AV1 images. Nothing prevents you from using this meta
    for custom purposes, but it generally can't be used to easily to add support
    for alpha channels to CODECs or formats that don't support that out of the
    box.
*/
struct GstVideoCodecAlphaMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      the encoded alpha frame
  */
  GstBuffer* buffer;
}

/**
    A #GstVideoCodecFrame represents a video frame both in raw and
    encoded form.
*/
struct GstVideoCodecFrame
{
  /** */
  int refCount;

  /** */
  uint flags;

  /**
      Unique identifier for the frame. Use this if you need
            to get hold of the frame later (like when data is being decoded).
            Typical usage in decoders is to set this on the opaque value provided
            to the library and get back the frame using [gstvideo.video_decoder.VideoDecoder.getFrame]
  */
  uint systemFrameNumber;

  /** */
  uint decodeFrameNumber;

  /** */
  uint presentationFrameNumber;

  /**
      Decoding timestamp
  */
  GstClockTime dts;

  /**
      Presentation timestamp
  */
  GstClockTime pts;

  /**
      Duration of the frame
  */
  GstClockTime duration;

  /**
      Distance in frames from the last synchronization point.
  */
  int distanceFromSync;

  /**
      the input #GstBuffer that created this frame. The buffer is owned
                by the frame and references to the frame instead of the buffer should
                be kept.
  */
  GstBuffer* inputBuffer;

  /**
      the output #GstBuffer. Implementations should set this either
                directly, or by using the
                [gstvideo.video_decoder.VideoDecoder.allocateOutputFrame] or
                [gstvideo.video_decoder.VideoDecoder.allocateOutputBuffer] methods. The buffer is
                owned by the frame and references to the frame instead of the
                buffer should be kept.
  */
  GstBuffer* outputBuffer;

  /**
      Running time when the frame will be used.
  */
  GstClockTime deadline;

  /** */
  GList* events;

  /** */
  void* userData;

  /** */
  GDestroyNotify userDataDestroyNotify;

  /** */
  /** */
  union AbidataType
  {
    /** */
    /** */
    struct ABIType
    {
      /** */
      GstClockTime ts;

      /** */
      GstClockTime ts2;

      /** */
      uint numSubframes;

      /** */
      uint subframesProcessed;
    }

    ABIType ABI;

    /** */
    void*[20] padding;
  }

  AbidataType abidata;
}

/**
    Structure representing the state of an incoming or outgoing video
    stream for encoders and decoders.
    
    Decoders and encoders will receive such a state through their
    respective @set_format vmethods.
    
    Decoders and encoders can set the downstream state, by using the
    [gstvideo.video_decoder.VideoDecoder.setOutputState] or
    [gstvideo.video_encoder.VideoEncoder.setOutputState] methods.
*/
struct GstVideoCodecState
{
  /** */
  int refCount;

  /**
      The #GstVideoInfo describing the stream
  */
  GstVideoInfo info;

  /**
      The #GstCaps used in the caps negotiation of the pad.
  */
  GstCaps* caps;

  /**
      a #GstBuffer corresponding to the
          'codec_data' field of a stream, or NULL.
  */
  GstBuffer* codecData;

  /**
      The #GstCaps for allocation query and pool
          negotiation. Since: 1.10
  */
  GstCaps* allocationCaps;

  /**
      Mastering display color volume information (HDR metadata) for the stream.
  */
  GstVideoMasteringDisplayInfo* masteringDisplayInfo;

  /**
      Content light level information for the stream.
  */
  GstVideoContentLightLevel* contentLightLevel;

  /** */
  void*[17] padding;
}

/**
    Structure describing the chromaticity coordinates of an RGB system. These
    values can be used to construct a matrix to transform RGB to and from the
    XYZ colorspace.
*/
struct GstVideoColorPrimariesInfo
{
  /**
      a #GstVideoColorPrimaries
  */
  GstVideoColorPrimaries primaries;

  /**
      reference white x coordinate
  */
  double Wx;

  /**
      reference white y coordinate
  */
  double Wy;

  /**
      red x coordinate
  */
  double Rx;

  /**
      red y coordinate
  */
  double Ry;

  /**
      green x coordinate
  */
  double Gx;

  /**
      green y coordinate
  */
  double Gy;

  /**
      blue x coordinate
  */
  double Bx;

  /**
      blue y coordinate
  */
  double By;
}

/**
    Structure describing the color info.
*/
struct GstVideoColorimetry
{
  /**
      the color range. This is the valid range for the samples.
              It is used to convert the samples to Y'PbPr values.
  */
  GstVideoColorRange range;

  /**
      the color matrix. Used to convert between Y'PbPr and
               non-linear RGB (R'G'B')
  */
  GstVideoColorMatrix matrix;

  /**
      the transfer function. used to convert between R'G'B' and RGB
  */
  GstVideoTransferFunction transfer;

  /**
      color primaries. used to convert between R'G'B' and CIE XYZ
  */
  GstVideoColorPrimaries primaries;
}

/**
    Content light level information specified in CEA-861.3, Appendix A.
*/
struct GstVideoContentLightLevel
{
  /**
      the maximum content light level
        (abbreviated to MaxCLL) in candelas per square meter (cd/m^2 and nit)
  */
  ushort maxContentLightLevel;

  /**
      the maximum frame average light level
        (abbreviated to MaxFLL) in candelas per square meter (cd/m^2 and nit)
  */
  ushort maxFrameAverageLightLevel;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstVideoConverter;

/**
    Extra buffer metadata describing image cropping.
*/
struct GstVideoCropMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      the horizontal offset
  */
  uint x;

  /**
      the vertical offset
  */
  uint y;

  /**
      the cropped width
  */
  uint width;

  /**
      the cropped height
  */
  uint height;
}

/**
    This base class is for video decoders turning encoded data into raw video
    frames.
    
    The GstVideoDecoder base class and derived subclasses should cooperate as
    follows:
    
    ## Configuration
    
      $(LIST
          * Initially, GstVideoDecoder calls @start when the decoder element
            is activated, which allows the subclass to perform any global setup.
        
          * GstVideoDecoder calls @set_format to inform the subclass of caps
            describing input video data that it is about to receive, including
            possibly configuration data.
            While unlikely, it might be called more than once, if changing input
            parameters require reconfiguration.
        
          * Incoming data buffers are processed as needed, described in Data
            Processing below.
        
          * GstVideoDecoder calls @stop at end of all processing.
      )
        
    ## Data processing
    
      $(LIST
          * The base class gathers input data, and optionally allows subclass
            to parse this into subsequently manageable chunks, typically
            corresponding to and referred to as 'frames'.
        
          * Each input frame is provided in turn to the subclass' @handle_frame
            callback.
          * When the subclass enables the subframe mode with [gstvideo.video_decoder.VideoDecoder.setSubframeMode],
            the base class will provide to the subclass the same input frame with
            different input buffers to the subclass @handle_frame
            callback. During this call, the subclass needs to take
            ownership of the input_buffer as @GstVideoCodecFrame.input_buffer
            will have been changed before the next subframe buffer is received.
            The subclass will call [gstvideo.video_decoder.VideoDecoder.haveLastSubframe]
            when a new input frame can be created by the base class.
            Every subframe will share the same @GstVideoCodecFrame.output_buffer
            to write the decoding result. The subclass is responsible to protect
            its access.
        
          * If codec processing results in decoded data, the subclass should call
            @gst_video_decoder_finish_frame to have decoded data pushed
            downstream. In subframe mode
            the subclass should call @gst_video_decoder_finish_subframe until the
            last subframe where it should call @gst_video_decoder_finish_frame.
            The subclass can detect the last subframe using GST_VIDEO_BUFFER_FLAG_MARKER
            on buffers or using its own logic to collect the subframes.
            In case of decoding failure, the subclass must call
            @gst_video_decoder_drop_frame or @gst_video_decoder_drop_subframe,
            to allow the base class to do timestamp and offset tracking, and possibly
            to requeue the frame for a later attempt in the case of reverse playback.
      )
        
    ## Shutdown phase
    
      $(LIST
          * The GstVideoDecoder class calls @stop to inform the subclass that data
            parsing will be stopped.
      )
        
    ## Additional Notes
    
      $(LIST
          * Seeking/Flushing
        
            * When the pipeline is seeked or otherwise flushed, the subclass is
              informed via a call to its @reset callback, with the hard parameter
              set to true. This indicates the subclass should drop any internal data
              queues and timestamps and prepare for a fresh set of buffers to arrive
              for parsing and decoding.
        
          * End Of Stream
        
            * At end-of-stream, the subclass @parse function may be called some final
              times with the at_eos parameter set to true, indicating that the element
              should not expect any more data to be arriving, and it should parse and
              remaining frames and call [gstvideo.video_decoder.VideoDecoder.haveFrame] if possible.
      )
        
    The subclass is responsible for providing pad template caps for
    source and sink pads. The pads need to be named "sink" and "src". It also
    needs to provide information about the output caps, when they are known.
    This may be when the base class calls the subclass' @set_format function,
    though it might be during decoding, before calling
    @gst_video_decoder_finish_frame. This is done via
    @gst_video_decoder_set_output_state
    
    The subclass is also responsible for providing (presentation) timestamps
    (likely based on corresponding input ones).  If that is not applicable
    or possible, the base class provides limited framerate based interpolation.
    
    Similarly, the base class provides some limited (legacy) seeking support
    if specifically requested by the subclass, as full-fledged support
    should rather be left to upstream demuxer, parser or alike.  This simple
    approach caters for seeking and duration reporting using estimated input
    bitrates. To enable it, a subclass should call
    @gst_video_decoder_set_estimate_rate to enable handling of incoming
    byte-streams.
    
    The base class provides some support for reverse playback, in particular
    in case incoming data is not packetized or upstream does not provide
    fragments on keyframe boundaries.  However, the subclass should then be
    prepared for the parsing and frame processing stage to occur separately
    (in normal forward processing, the latter immediately follows the former),
    The subclass also needs to ensure the parsing stage properly marks
    keyframes, unless it knows the upstream elements will do so properly for
    incoming data.
    
    The bare minimum that a functional subclass needs to implement is:
    
      $(LIST
          * Provide pad templates
          * Inform the base class of output caps via
             @gst_video_decoder_set_output_state
        
          * Parse input data, if it is not considered packetized from upstream
             Data will be provided to @parse which should invoke
             @gst_video_decoder_add_to_frame and @gst_video_decoder_have_frame to
             separate the data belonging to each video frame.
        
          * Accept data in @handle_frame and provide decoded results to
             @gst_video_decoder_finish_frame, or call @gst_video_decoder_drop_frame.
      )
*/
struct GstVideoDecoder
{
  /** */
  GstElement element;

  /** */
  GstPad* sinkpad;

  /** */
  GstPad* srcpad;

  /** */
  GRecMutex streamLock;

  /** */
  GstSegment inputSegment;

  /** */
  GstSegment outputSegment;

  /** */
  GstVideoDecoderPrivate* priv;

  /** */
  void*[20] padding;
}

/**
    Subclasses can override any of the available virtual methods or not, as
    needed. At minimum @handle_frame needs to be overridden, and @set_format
    and likely as well.  If non-packetized input is supported or expected,
    @parse needs to be overridden as well.
*/
struct GstVideoDecoderClass
{
  /** */
  GstElementClass elementClass;

  /**
      Optional.
                       Called when the element changes to GST_STATE_READY.
                       Allows opening external resources.
  */
  extern(C) gboolean function(GstVideoDecoder* decoder) open;

  /**
      Optional.
                       Called when the element changes to GST_STATE_NULL.
                       Allows closing external resources.
  */
  extern(C) gboolean function(GstVideoDecoder* decoder) close;

  /**
      Optional.
                       Called when the element starts processing.
                       Allows opening external resources.
  */
  extern(C) gboolean function(GstVideoDecoder* decoder) start;

  /**
      Optional.
                       Called when the element stops processing.
                       Allows closing external resources.
  */
  extern(C) gboolean function(GstVideoDecoder* decoder) stop;

  /**
      Required for non-packetized input.
                       Allows chopping incoming data into manageable units (frames)
                       for subsequent decoding.
  */
  extern(C) GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame, GstAdapter* adapter, gboolean atEos) parse;

  /**
      Notifies subclass of incoming data format (caps).
  */
  extern(C) gboolean function(GstVideoDecoder* decoder, GstVideoCodecState* state) setFormat;

  /**
      Optional.
                       Allows subclass (decoder) to perform post-seek semantics reset.
                       Deprecated.
  */
  extern(C) gboolean function(GstVideoDecoder* decoder, gboolean hard) reset;

  /**
      Optional.
                       Called to request subclass to dispatch any pending remaining
                       data at EOS. Sub-classes can refuse to decode new data after.
  */
  extern(C) GstFlowReturn function(GstVideoDecoder* decoder) finish;

  /**
      Provides input data frame to subclass. In subframe mode, the subclass needs
                       to take ownership of @GstVideoCodecFrame.input_buffer as it will be modified
                       by the base class on the next subframe buffer receiving.
  */
  extern(C) GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) handleFrame;

  /**
      Optional.
                       Event handler on the sink pad. This function should return
                       TRUE if the event was handled and should be discarded
                       (i.e. not unref'ed).
                       Subclasses should chain up to the parent implementation to
                       invoke the default handler.
  */
  extern(C) gboolean function(GstVideoDecoder* decoder, GstEvent* event) sinkEvent;

  /**
      Optional.
                       Event handler on the source pad. This function should return
                       TRUE if the event was handled and should be discarded
                       (i.e. not unref'ed).
                       Subclasses should chain up to the parent implementation to
                       invoke the default handler.
  */
  extern(C) gboolean function(GstVideoDecoder* decoder, GstEvent* event) srcEvent;

  /**
      Optional.
                       Negotiate with downstream and configure buffer pools, etc.
                       Subclasses should chain up to the parent implementation to
                       invoke the default handler.
  */
  extern(C) gboolean function(GstVideoDecoder* decoder) negotiate;

  /**
      Optional.
                          Setup the allocation parameters for allocating output
                          buffers. The passed in query contains the result of the
                          downstream allocation query.
                          Subclasses should chain up to the parent implementation to
                          invoke the default handler.
  */
  extern(C) gboolean function(GstVideoDecoder* decoder, GstQuery* query) decideAllocation;

  /**
      Optional.
                           Propose buffer allocation parameters for upstream elements.
                           Subclasses should chain up to the parent implementation to
                           invoke the default handler.
  */
  extern(C) gboolean function(GstVideoDecoder* decoder, GstQuery* query) proposeAllocation;

  /**
      Optional.
                           Flush all remaining data from the decoder without
                           pushing it downstream. Since: 1.2
  */
  extern(C) gboolean function(GstVideoDecoder* decoder) flush;

  /**
      Optional.
                       Query handler on the sink pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.4
  */
  extern(C) gboolean function(GstVideoDecoder* decoder, GstQuery* query) sinkQuery;

  /**
      Optional.
                       Query handler on the source pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.4
  */
  extern(C) gboolean function(GstVideoDecoder* decoder, GstQuery* query) srcQuery;

  /**
      Optional.
                       Allows for a custom sink getcaps implementation.
                       If not implemented, default returns
                       gst_video_decoder_proxy_getcaps
                       applied to sink template caps.
  */
  extern(C) GstCaps* function(GstVideoDecoder* decoder, GstCaps* filter) getcaps;

  /**
      Optional.
                       Called to request subclass to decode any data it can at this
                       point, but that more data may arrive after. (e.g. at segment end).
                       Sub-classes should be prepared to handle new data afterward,
                       or seamless segment processing will break. Since: 1.6
  */
  extern(C) GstFlowReturn function(GstVideoDecoder* decoder) drain;

  /**
      Optional. Transform the metadata on the input buffer to the
                       output buffer. By default this method is copies all meta without
                       tags and meta with only the "video" tag. subclasses can
                       implement this method and return true if the metadata is to be
                       copied. Since: 1.6
  */
  extern(C) gboolean function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame, GstMeta* meta) transformMeta;

  /** */
  extern(C) gboolean function(GstVideoDecoder* decoder, GstClockTime timestamp, GstClockTime duration) handleMissingData;

  /** */
  void*[13] padding;
}

/** */
struct GstVideoDecoderPrivate;

/**
    The interface allows unified access to control flipping and rotation
    operations of video-sources or operators.
*/
struct GstVideoDirection;

/**
    #GstVideoDirectionInterface interface.
*/
struct GstVideoDirectionInterface
{
  /**
      parent interface type.
  */
  GTypeInterface iface;
}

/**
    GstVideoDither provides implementations of several dithering algorithms
    that can be applied to lines of video pixels to quantize and dither them.
*/
struct GstVideoDither;

/**
    This base class is for video encoders turning raw video into
    encoded video data.
    
    GstVideoEncoder and subclass should cooperate as follows.
    
    ## Configuration
    
      $(LIST
          * Initially, GstVideoEncoder calls @start when the encoder element
            is activated, which allows subclass to perform any global setup.
          * GstVideoEncoder calls @set_format to inform subclass of the format
            of input video data that it is about to receive.  Subclass should
            setup for encoding and configure base class as appropriate
            (e.g. latency). While unlikely, it might be called more than once,
            if changing input parameters require reconfiguration.  Baseclass
            will ensure that processing of current configuration is finished.
          * GstVideoEncoder calls @stop at end of all processing.
      )
        
    ## Data processing
    
        $(LIST
              * Base class collects input data and metadata into a frame and hands
                this to subclass' @handle_frame.
          
              * If codec processing results in encoded data, subclass should call
                @gst_video_encoder_finish_frame to have encoded data pushed
                downstream.
          
              * If implemented, baseclass calls subclass @pre_push just prior to
                pushing to allow subclasses to modify some metadata on the buffer.
                If it returns GST_FLOW_OK, the buffer is pushed downstream.
          
              * GstVideoEncoderClass will handle both srcpad and sinkpad events.
                Sink events will be passed to subclass if @event callback has been
                provided.
        )
          
    ## Shutdown phase
    
      $(LIST
          * GstVideoEncoder class calls @stop to inform the subclass that data
            parsing will be stopped.
      )
        
    Subclass is responsible for providing pad template caps for
    source and sink pads. The pads need to be named "sink" and "src". It should
    also be able to provide fixed src pad caps in @getcaps by the time it calls
    @gst_video_encoder_finish_frame.
    
    Things that subclass need to take care of:
    
      $(LIST
          * Provide pad templates
          * Provide source pad caps before pushing the first buffer
          * Accept data in @handle_frame and provide encoded results to
             @gst_video_encoder_finish_frame.
      )
        
        
    The #GstVideoEncoder:qos property will enable the Quality-of-Service
    features of the encoder which gather statistics about the real-time
    performance of the downstream elements. If enabled, subclasses can
    use [gstvideo.video_encoder.VideoEncoder.getMaxEncodeTime] to check if input frames
    are already late and drop them right away to give a chance to the
    pipeline to catch up.
*/
struct GstVideoEncoder
{
  /** */
  GstElement element;

  /** */
  GstPad* sinkpad;

  /** */
  GstPad* srcpad;

  /** */
  GRecMutex streamLock;

  /** */
  GstSegment inputSegment;

  /** */
  GstSegment outputSegment;

  /** */
  GstVideoEncoderPrivate* priv;

  /** */
  void*[20] padding;
}

/**
    Subclasses can override any of the available virtual methods or not, as
    needed. At minimum @handle_frame needs to be overridden, and @set_format
    and @get_caps are likely needed as well.
*/
struct GstVideoEncoderClass
{
  /** */
  GstElementClass elementClass;

  /**
      Optional.
                       Called when the element changes to GST_STATE_READY.
                       Allows opening external resources.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder) open;

  /**
      Optional.
                       Called when the element changes to GST_STATE_NULL.
                       Allows closing external resources.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder) close;

  /**
      Optional.
                       Called when the element starts processing.
                       Allows opening external resources.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder) start;

  /**
      Optional.
                       Called when the element stops processing.
                       Allows closing external resources.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder) stop;

  /**
      Optional.
                       Notifies subclass of incoming data format.
                       GstVideoCodecState fields have already been
                       set according to provided caps.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder, GstVideoCodecState* state) setFormat;

  /**
      Provides input frame to subclass.
  */
  extern(C) GstFlowReturn function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) handleFrame;

  /**
      Optional.
                       Allows subclass (encoder) to perform post-seek semantics reset.
                       Deprecated.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder, gboolean hard) reset;

  /**
      Optional.
                       Called to request subclass to dispatch any pending remaining
                       data (e.g. at EOS).
  */
  extern(C) GstFlowReturn function(GstVideoEncoder* encoder) finish;

  /**
      Optional.
                       Allows subclass to push frame downstream in whatever
                       shape or form it deems appropriate.  If not provided,
                       provided encoded frame data is simply pushed downstream.
  */
  extern(C) GstFlowReturn function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) prePush;

  /**
      Optional.
                       Allows for a custom sink getcaps implementation (e.g.
                       for multichannel input specification).  If not implemented,
                       default returns gst_video_encoder_proxy_getcaps
                       applied to sink template caps.
  */
  extern(C) GstCaps* function(GstVideoEncoder* enc, GstCaps* filter) getcaps;

  /**
      Optional.
                       Event handler on the sink pad. This function should return
                       TRUE if the event was handled and should be discarded
                       (i.e. not unref'ed).
                       Subclasses should chain up to the parent implementation to
                       invoke the default handler.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder, GstEvent* event) sinkEvent;

  /**
      Optional.
                       Event handler on the source pad. This function should return
                       TRUE if the event was handled and should be discarded
                       (i.e. not unref'ed).
                       Subclasses should chain up to the parent implementation to
                       invoke the default handler.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder, GstEvent* event) srcEvent;

  /**
      Optional.
                       Negotiate with downstream and configure buffer pools, etc.
                       Subclasses should chain up to the parent implementation to
                       invoke the default handler.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder) negotiate;

  /**
      Optional.
                          Setup the allocation parameters for allocating output
                          buffers. The passed in query contains the result of the
                          downstream allocation query.
                          Subclasses should chain up to the parent implementation to
                          invoke the default handler.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder, GstQuery* query) decideAllocation;

  /**
      Optional.
                           Propose buffer allocation parameters for upstream elements.
                           Subclasses should chain up to the parent implementation to
                           invoke the default handler.
  */
  extern(C) gboolean function(GstVideoEncoder* encoder, GstQuery* query) proposeAllocation;

  /**
      Optional.
                           Flush all remaining data from the encoder without
                           pushing it downstream. Since: 1.2
  */
  extern(C) gboolean function(GstVideoEncoder* encoder) flush;

  /**
      Optional.
                       Query handler on the sink pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.4
  */
  extern(C) gboolean function(GstVideoEncoder* encoder, GstQuery* query) sinkQuery;

  /**
      Optional.
                       Query handler on the source pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.4
  */
  extern(C) gboolean function(GstVideoEncoder* encoder, GstQuery* query) srcQuery;

  /**
      Optional. Transform the metadata on the input buffer to the
                       output buffer. By default this method is copies all meta without
                       tags and meta with only the "video" tag. subclasses can
                       implement this method and return true if the metadata is to be
                       copied. Since: 1.6
  */
  extern(C) gboolean function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame, GstMeta* meta) transformMeta;

  /** */
  void*[16] GstReserved;
}

/** */
struct GstVideoEncoderPrivate;

/**
    Provides useful functions and a base class for video filters.
    
    The videofilter will by default enable QoS on the parent GstBaseTransform
    to implement frame dropping.
*/
struct GstVideoFilter
{
  /** */
  GstBaseTransform element;

  /** */
  gboolean negotiated;

  /** */
  GstVideoInfo inInfo;

  /** */
  GstVideoInfo outInfo;

  /** */
  void*[4] GstReserved;
}

/**
    The video filter class structure.
*/
struct GstVideoFilterClass
{
  /**
      the parent class structure
  */
  GstBaseTransformClass parentClass;

  /**
      function to be called with the negotiated caps and video infos
  */
  extern(C) gboolean function(GstVideoFilter* filter, GstCaps* incaps, GstVideoInfo* inInfo, GstCaps* outcaps, GstVideoInfo* outInfo) setInfo;

  /**
      transform a video frame
  */
  extern(C) GstFlowReturn function(GstVideoFilter* filter, GstVideoFrame* inframe, GstVideoFrame* outframe) transformFrame;

  /**
      transform a video frame in place
  */
  extern(C) GstFlowReturn function(GstVideoFilter* trans, GstVideoFrame* frame) transformFrameIp;

  /** */
  void*[4] GstReserved;
}

/**
    Information for a video format.
*/
struct GstVideoFormatInfo
{
  /**
      #GstVideoFormat
  */
  GstVideoFormat format;

  /**
      string representation of the format
  */
  const(char)* name;

  /**
      use readable description of the format
  */
  const(char)* description;

  /**
      #GstVideoFormatFlags
  */
  GstVideoFormatFlags flags;

  /**
      The number of bits used to pack data items. This can be less than 8
         when multiple pixels are stored in a byte. for values > 8 multiple bytes
         should be read according to the endianness flag before applying the shift
         and mask.
  */
  uint bits;

  /**
      the number of components in the video format.
  */
  uint nComponents;

  /**
      the number of bits to shift away to get the component data
  */
  uint[4] shift;

  /**
      the depth in bits for each component
  */
  uint[4] depth;

  /**
      the pixel stride of each component. This is the amount of
         bytes to the pixel immediately to the right. When bits < 8, the stride is
         expressed in bits. For 24-bit RGB, this would be 3 bytes, for example,
         while it would be 4 bytes for RGBx or ARGB.
  */
  int[4] pixelStride;

  /**
      the number of planes for this format. The number of planes can be
         less than the amount of components when multiple components are packed into
         one plane.
  */
  uint nPlanes;

  /**
      the plane number where a component can be found
  */
  uint[4] plane;

  /**
      the offset in the plane where the first pixel of the components
         can be found.
  */
  uint[4] poffset;

  /**
      subsampling factor of the width for the component. Use
          GST_VIDEO_SUB_SCALE to scale a width.
  */
  uint[4] wSub;

  /**
      subsampling factor of the height for the component. Use
          GST_VIDEO_SUB_SCALE to scale a height.
  */
  uint[4] hSub;

  /**
      the format of the unpacked pixels. This format must have the
          #GST_VIDEO_FORMAT_FLAG_UNPACK flag set.
  */
  GstVideoFormat unpackFormat;

  /**
      an unpack function for this format
  */
  GstVideoFormatUnpack unpackFunc;

  /**
      the amount of lines that will be packed
  */
  int packLines;

  /**
      an pack function for this format
  */
  GstVideoFormatPack packFunc;

  /**
      The tiling mode
  */
  GstVideoTileMode tileMode;

  /**
      The width of a tile, in bytes, represented as a shift. DEPRECATED,
      use tile_info[] array instead.
  */
  uint tileWs;

  /**
      The height of a tile, in bytes, represented as a shift. DEPREACTED,
      use tile_info[] array instead.
  */
  uint tileHs;

  /**
      Information about the tiles for each of the planes.
  */
  GstVideoTileInfo[4] tileInfo;
}

/**
    A video frame obtained from [gstvideo.video_frame.VideoFrame.map]
*/
struct GstVideoFrame
{
  /**
      the #GstVideoInfo
  */
  GstVideoInfo info;

  /**
      #GstVideoFrameFlags for the frame
  */
  GstVideoFrameFlags flags;

  /**
      the mapped buffer
  */
  GstBuffer* buffer;

  /**
      pointer to metadata if any
  */
  void* meta;

  /**
      id of the mapped frame. the id can for example be used to
        identify the frame in case of multiview video.
  */
  int id;

  /**
      pointers to the plane data
  */
  void*[4] data;

  /**
      mappings of the planes
  */
  GstMapInfo[4] map;

  /** */
  void*[4] GstReserved;
}

/**
    Extra buffer metadata for uploading a buffer to an OpenGL texture
    ID. The caller of [gstvideo.video_gltexture_upload_meta.VideoGLTextureUploadMeta.upload] must
    have OpenGL set up and call this from a thread where it is valid
    to upload something to an OpenGL texture.
*/
struct GstVideoGLTextureUploadMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      Orientation of the textures
  */
  GstVideoGLTextureOrientation textureOrientation;

  /**
      Number of textures that are generated
  */
  uint nTextures;

  /**
      Type of each texture
  */
  GstVideoGLTextureType[4] textureType;

  /** */
  GstBuffer* buffer;

  /** */
  GstVideoGLTextureUpload upload;

  /** */
  void* userData;

  /** */
  GBoxedCopyFunc userDataCopy;

  /** */
  GBoxedFreeFunc userDataFree;
}

/**
    Information describing image properties. This information can be filled
    in from GstCaps with [gstvideo.video_info.VideoInfo.fromCaps]. The information is also used
    to store the specific video info when mapping a video frame with
    [gstvideo.video_frame.VideoFrame.map].
    
    Use the provided macros to access the info in this structure.
*/
struct GstVideoInfo
{
  /**
      the format info of the video
  */
  const(GstVideoFormatInfo)* finfo;

  /**
      the interlace mode
  */
  GstVideoInterlaceMode interlaceMode;

  /**
      additional video flags
  */
  GstVideoFlags flags;

  /**
      the width of the video
  */
  int width;

  /**
      the height of the video
  */
  int height;

  /**
      the default size of one frame
  */
  size_t size;

  /**
      the number of views for multiview video
  */
  int views;

  /**
      a #GstVideoChromaSite.
  */
  GstVideoChromaSite chromaSite;

  /**
      the colorimetry info
  */
  GstVideoColorimetry colorimetry;

  /**
      the pixel-aspect-ratio numerator
  */
  int parN;

  /**
      the pixel-aspect-ratio denominator
  */
  int parD;

  /**
      the framerate numerator
  */
  int fpsN;

  /**
      the framerate denominator
  */
  int fpsD;

  /**
      offsets of the planes
  */
  size_t[4] offset;

  /**
      strides of the planes
  */
  int[4] stride;

  /** */
  /** */
  union ABIType
  {
    /** */
    /** */
    struct AbiType
    {
      /** */
      GstVideoMultiviewMode multiviewMode;

      /** */
      GstVideoMultiviewFlags multiviewFlags;

      /** */
      GstVideoFieldOrder fieldOrder;
    }

    AbiType abi;

    /** */
    void*[4] GstReserved;
  }

  ABIType ABI;
}

/**
    Information describing a DMABuf image properties. It wraps #GstVideoInfo and
    adds DRM information such as drm-fourcc and drm-modifier, required for
    negotiation and mapping.
*/
struct GstVideoInfoDmaDrm
{
  /**
      the associated #GstVideoInfo
  */
  GstVideoInfo vinfo;

  /**
      the fourcc defined by drm
  */
  uint drmFourcc;

  /**
      the drm modifier
  */
  ulong drmModifier;

  /** */
  uint[20] GstReserved;
}

/**
    Mastering display color volume information defined by SMPTE ST 2086
    (a.k.a static HDR metadata).
*/
struct GstVideoMasteringDisplayInfo
{
  /**
      the xy coordinates of primaries in the CIE 1931 color space.
        the index 0 contains red, 1 is for green and 2 is for blue.
        each value is normalized to 50000 (meaning that in unit of 0.00002)
  */
  GstVideoMasteringDisplayInfoCoordinates[3] displayPrimaries;

  /**
      the xy coordinates of white point in the CIE 1931 color space.
        each value is normalized to 50000 (meaning that in unit of 0.00002)
  */
  GstVideoMasteringDisplayInfoCoordinates whitePoint;

  /**
      the maximum value of display luminance
        in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  uint maxDisplayMasteringLuminance;

  /**
      the minimum value of display luminance
        in unit of 0.0001 candelas per square metre (cd/m^2 and nit)
  */
  uint minDisplayMasteringLuminance;

  /** */
  void*[4] GstReserved;
}

/**
    Used to represent display_primaries and white_point of
    #GstVideoMasteringDisplayInfo struct. See #GstVideoMasteringDisplayInfo
*/
struct GstVideoMasteringDisplayInfoCoordinates
{
  /**
      the x coordinate of CIE 1931 color space in unit of 0.00002.
  */
  ushort x;

  /**
      the y coordinate of CIE 1931 color space in unit of 0.00002.
  */
  ushort y;
}

/**
    Extra buffer metadata describing image properties
    
    This meta can also be used by downstream elements to specifiy their
    buffer layout requirements for upstream. Upstream should try to
    fit those requirements, if possible, in order to prevent buffer copies.
    
    This is done by passing a custom #GstStructure to
    [gst.query.Query.addAllocationMeta] when handling the ALLOCATION query.
    This structure should be named 'video-meta' and can have the following
    fields:
    $(LIST
      * padding-top (uint): extra pixels on the top
      * padding-bottom (uint): extra pixels on the bottom
      * padding-left (uint): extra pixels on the left side
      * padding-right (uint): extra pixels on the right side
    )
    The padding fields have the same semantic as #GstVideoMeta.alignment
    and so represent the paddings requested on produced video buffers.
    
    Since 1.24 it can be serialized using [gst.meta.Meta.serialize] and
    [gst.meta.Meta.deserialize].
*/
struct GstVideoMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      the buffer this metadata belongs to
  */
  GstBuffer* buffer;

  /**
      additional video flags
  */
  GstVideoFrameFlags flags;

  /**
      the video format
  */
  GstVideoFormat format;

  /**
      identifier of the frame
  */
  int id;

  /**
      the video width
  */
  uint width;

  /**
      the video height
  */
  uint height;

  /**
      the number of planes in the image
  */
  uint nPlanes;

  /**
      array of offsets for the planes. This field might not always be
               valid, it is used by the default implementation of @map.
  */
  size_t[4] offset;

  /**
      array of strides for the planes. This field might not always be
               valid, it is used by the default implementation of @map.
  */
  int[4] stride;

  /**
      map the memory of a plane
  */
  extern(C) gboolean function(GstVideoMeta* meta, uint plane, GstMapInfo* info, void** data, int* stride, GstMapFlags flags) map;

  /**
      unmap the memory of a plane
  */
  extern(C) gboolean function(GstVideoMeta* meta, uint plane, GstMapInfo* info) unmap;

  /**
      the paddings and alignment constraints of the video buffer.
      It is up to the caller of `[gstvideo.global.bufferAddVideoMetaFull]` to set it
      using [gstvideo.video_meta.VideoMeta.setAlignment], if they did not it defaults
      to no padding and no alignment. Since: 1.18
  */
  GstVideoAlignment alignment;
}

/**
    Extra data passed to a video transform #GstMetaTransformFunction such as:
    "gst-video-scale".
*/
struct GstVideoMetaTransform
{
  /**
      the input #GstVideoInfo
  */
  GstVideoInfo* inInfo;

  /**
      the output #GstVideoInfo
  */
  GstVideoInfo* outInfo;
}

/**
    See #GstVideoMultiviewFlags.
*/
struct GstVideoMultiviewFlagsSet;

/**
    The interface allows unified access to control flipping and autocenter
    operation of video-sources or operators.
*/
struct GstVideoOrientation;

/**
    #GstVideoOrientationInterface interface.
*/
struct GstVideoOrientationInterface
{
  /**
      parent interface type.
  */
  GTypeInterface iface;

  /**
      virtual method to get horizontal flipping state
  */
  extern(C) gboolean function(GstVideoOrientation* videoOrientation, gboolean* flip) getHflip;

  /**
      virtual method to get vertical flipping state
  */
  extern(C) gboolean function(GstVideoOrientation* videoOrientation, gboolean* flip) getVflip;

  /**
      virtual method to get horizontal centering state
  */
  extern(C) gboolean function(GstVideoOrientation* videoOrientation, int* center) getHcenter;

  /**
      virtual method to get vertical centering state
  */
  extern(C) gboolean function(GstVideoOrientation* videoOrientation, int* center) getVcenter;

  /**
      virtual method to set horizontal flipping state
  */
  extern(C) gboolean function(GstVideoOrientation* videoOrientation, gboolean flip) setHflip;

  /**
      virtual method to set vertical flipping state
  */
  extern(C) gboolean function(GstVideoOrientation* videoOrientation, gboolean flip) setVflip;

  /**
      virtual method to set horizontal centering state
  */
  extern(C) gboolean function(GstVideoOrientation* videoOrientation, int center) setHcenter;

  /**
      virtual method to set vertical centering state
  */
  extern(C) gboolean function(GstVideoOrientation* videoOrientation, int center) setVcenter;
}

/**
    The #GstVideoOverlay interface is used for 2 main purposes :
    
    $(LIST
      * To get a grab on the Window where the video sink element is going to render.
        This is achieved by either being informed about the Window identifier that
        the video sink element generated, or by forcing the video sink element to use
        a specific Window identifier for rendering.
      * To force a redrawing of the latest video frame the video sink element
        displayed on the Window. Indeed if the #GstPipeline is in #GST_STATE_PAUSED
        state, moving the Window around will damage its content. Application
        developers will want to handle the Expose events themselves and force the
        video sink element to refresh the Window's content.
    )
      
    Using the Window created by the video sink is probably the simplest scenario,
    in some cases, though, it might not be flexible enough for application
    developers if they need to catch events such as mouse moves and button
    clicks.
    
    Setting a specific Window identifier on the video sink element is the most
    flexible solution but it has some issues. Indeed the application needs to set
    its Window identifier at the right time to avoid internal Window creation
    from the video sink element. To solve this issue a #GstMessage is posted on
    the bus to inform the application that it should set the Window identifier
    immediately. Here is an example on how to do that correctly:
    ```
    static GstBusSyncReply
    create_window (GstBus * bus, GstMessage * message, GstPipeline * pipeline)
    {
     // ignore anything but 'prepare-window-handle' element messages
     if (!gst_is_video_overlay_prepare_window_handle_message (message))
       return GST_BUS_PASS;
    
     win = XCreateSimpleWindow (disp, root, 0, 0, 320, 240, 0, 0, 0);
    
     XSetWindowBackgroundPixmap (disp, win, None);
    
     XMapRaised (disp, win);
    
     XSync (disp, FALSE);
    
     gst_video_overlay_set_window_handle (GST_VIDEO_OVERLAY (GST_MESSAGE_SRC (message)),
         win);
    
     gst_message_unref (message);
    
     return GST_BUS_DROP;
    }
    ...
    int
    main (int argc, char **argv)
    {
    ...
     bus = gst_pipeline_get_bus (GST_PIPELINE (pipeline));
     gst_bus_set_sync_handler (bus, (GstBusSyncHandler) create_window, pipeline,
            NULL);
    ...
    }
    ```
    
    ## Two basic usage scenarios
    
    There are two basic usage scenarios: in the simplest case, the application
    uses #playbin or #playsink or knows exactly what particular element is used
    for video output, which is usually the case when the application creates
    the videosink to use (e.g. #xvimagesink, #ximagesink, etc.) itself; in this
    case, the application can just create the videosink element, create and
    realize the window to render the video on and then
    call [gstvideo.video_overlay.VideoOverlay.setWindowHandle] directly with the XID or native
    window handle, before starting up the pipeline.
    As #playbin and #playsink implement the video overlay interface and proxy
    it transparently to the actual video sink even if it is created later, this
    case also applies when using these elements.
    
    In the other and more common case, the application does not know in advance
    what GStreamer video sink element will be used for video output. This is
    usually the case when an element such as #autovideosink is used.
    In this case, the video sink element itself is created
    asynchronously from a GStreamer streaming thread some time after the
    pipeline has been started up. When that happens, however, the video sink
    will need to know right then whether to render onto an already existing
    application window or whether to create its own window. This is when it
    posts a prepare-window-handle message, and that is also why this message needs
    to be handled in a sync bus handler which will be called from the streaming
    thread directly (because the video sink will need an answer right then).
    
    As response to the prepare-window-handle element message in the bus sync
    handler, the application may use [gstvideo.video_overlay.VideoOverlay.setWindowHandle] to tell
    the video sink to render onto an existing window surface. At this point the
    application should already have obtained the window handle / XID, so it
    just needs to set it. It is generally not advisable to call any GUI toolkit
    functions or window system functions from the streaming thread in which the
    prepare-window-handle message is handled, because most GUI toolkits and
    windowing systems are not thread-safe at all and a lot of care would be
    required to co-ordinate the toolkit and window system calls of the
    different threads (Gtk+ users please note: prior to Gtk+ 2.18
    `GDK_WINDOW_XID` was just a simple structure access, so generally fine to do
    within the bus sync handler; this macro was changed to a function call in
    Gtk+ 2.18 and later, which is likely to cause problems when called from a
    sync handler; see below for a better approach without `GDK_WINDOW_XID`
    used in the callback).
    
    ## GstVideoOverlay and Gtk+
    
    ```
    #include <gst/video/videooverlay.h>
    #include <gtk/gtk.h>
    #ifdef GDK_WINDOWING_X11
    #include <gdk/gdkx.h>  // for GDK_WINDOW_XID
    #endif
    #ifdef GDK_WINDOWING_WIN32
    #include <gdk/gdkwin32.h>  // for GDK_WINDOW_HWND
    #endif
    ...
    static guintptr video_window_handle = 0;
    ...
    static GstBusSyncReply
    bus_sync_handler (GstBus * bus, GstMessage * message, gpointer user_data)
    {
     // ignore anything but 'prepare-window-handle' element messages
     if (!gst_is_video_overlay_prepare_window_handle_message (message))
       return GST_BUS_PASS;
    
     if (video_window_handle != 0) {
       GstVideoOverlay *overlay;
    
       // GST_MESSAGE_SRC (message) will be the video sink element
       overlay = GST_VIDEO_OVERLAY (GST_MESSAGE_SRC (message));
       gst_video_overlay_set_window_handle (overlay, video_window_handle);
     } else {
       g_warning ("Should have obtained video_window_handle by now!");
     }
    
     gst_message_unref (message);
     return GST_BUS_DROP;
    }
    ...
    static void
    video_widget_realize_cb (GtkWidget * widget, gpointer data)
    {
    #if GTK_CHECK_VERSION(2,18,0)
      // Tell Gtk+/Gdk to create a native window for this widget instead of
      // drawing onto the parent widget.
      // This is here just for pedagogical purposes, GDK_WINDOW_XID will call
      // it as well in newer Gtk versions
      if (!gdk_window_ensure_native (widget->window))
        g_error ("Couldn't create native window needed for GstVideoOverlay!");
    #endif
    
    #ifdef GDK_WINDOWING_X11
      {
        gulong xid = GDK_WINDOW_XID (gtk_widget_get_window (video_window));
        video_window_handle = xid;
      }
    #endif
    #ifdef GDK_WINDOWING_WIN32
      {
        HWND wnd = GDK_WINDOW_HWND (gtk_widget_get_window (video_window));
        video_window_handle = (guintptr) wnd;
      }
    #endif
    }
    ...
    int
    main (int argc, char **argv)
    {
      GtkWidget *video_window;
      GtkWidget *app_window;
      ...
      app_window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      ...
      video_window = gtk_drawing_area_new ();
      g_signal_connect (video_window, "realize",
          G_CALLBACK (video_widget_realize_cb), NULL);
      gtk_widget_set_double_buffered (video_window, FALSE);
      ...
      // usually the video_window will not be directly embedded into the
      // application window like this, but there will be many other widgets
      // and the video window will be embedded in one of them instead
      gtk_container_add (GTK_CONTAINER (ap_window), video_window);
      ...
      // show the GUI
      gtk_widget_show_all (app_window);
    
      // realize window now so that the video window gets created and we can
      // obtain its XID/HWND before the pipeline is started up and the videosink
      // asks for the XID/HWND of the window to render onto
      gtk_widget_realize (video_window);
    
      // we should have the XID/HWND now
      g_assert (video_window_handle != 0);
      ...
      // set up sync handler for setting the xid once the pipeline is started
      bus = gst_pipeline_get_bus (GST_PIPELINE (pipeline));
      gst_bus_set_sync_handler (bus, (GstBusSyncHandler) bus_sync_handler, NULL,
          NULL);
      gst_object_unref (bus);
      ...
      gst_element_set_state (pipeline, GST_STATE_PLAYING);
      ...
    }
    ```
    
    ## GstVideoOverlay and Qt
    
    ```
    #include <glib.h>;
    #include <gst/gst.h>;
    #include <gst/video/videooverlay.h>;
    
    #include <QApplication>;
    #include <QTimer>;
    #include <QWidget>;
    
    int main(int argc, char *argv[])
    {
      if (!g_thread_supported ())
        g_thread_init (NULL);
    
      gst_init (&argc, &argv);
      QApplication app(argc, argv);
      app.connect(&app, SIGNAL(lastWindowClosed()), &app, SLOT(quit ()));
    
      // prepare the pipeline
    
      GstElement *pipeline = gst_pipeline_new ("xvoverlay");
      GstElement *src = gst_element_factory_make ("videotestsrc", NULL);
      GstElement *sink = gst_element_factory_make ("xvimagesink", NULL);
      gst_bin_add_many (GST_BIN (pipeline), src, sink, NULL);
      gst_element_link (src, sink);
    
      // prepare the ui
    
      QWidget window;
      window.resize(320, 240);
      window.show();
    
      WId xwinid = window.winId();
      gst_video_overlay_set_window_handle (GST_VIDEO_OVERLAY (sink), xwinid);
    
      // run the pipeline
    
      GstStateChangeReturn sret = gst_element_set_state (pipeline,
          GST_STATE_PLAYING);
      if (sret == GST_STATE_CHANGE_FAILURE) {
        gst_element_set_state (pipeline, GST_STATE_NULL);
        gst_object_unref (pipeline);
        // Exit application
        QTimer::singleShot(0, QApplication::activeWindow(), SLOT(quit()));
      }
    
      int ret = app.exec();
    
      window.hide();
      gst_element_set_state (pipeline, GST_STATE_NULL);
      gst_object_unref (pipeline);
    
      return ret;
    }
    ```
*/
struct GstVideoOverlay;

/**
    Functions to create and handle overlay compositions on video buffers.
    
    An overlay composition describes one or more overlay rectangles to be
    blended on top of a video buffer.
    
    This API serves two main purposes:
    
    $(LIST
      * it can be used to attach overlay information (subtitles or logos)
        to non-raw video buffers such as GL/VAAPI/VDPAU surfaces. The actual
        blending of the overlay can then be done by e.g. the video sink that
        processes these non-raw buffers.
      
      * it can also be used to blend overlay rectangles on top of raw video
        buffers, thus consolidating blending functionality for raw video in
        one place.
    )
      
    Together, this allows existing overlay elements to easily handle raw
    and non-raw video as input in without major changes (once the overlays
    have been put into a #GstVideoOverlayComposition object anyway) - for raw
    video the overlay can just use the blending function to blend the data
    on top of the video, and for surface buffers it can just attach them to
    the buffer and let the sink render the overlays.
*/
struct GstVideoOverlayComposition;

/**
    Extra buffer metadata describing image overlay data.
*/
struct GstVideoOverlayCompositionMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      the attached #GstVideoOverlayComposition
  */
  GstVideoOverlayComposition* overlay;
}

/**
    #GstVideoOverlay interface
*/
struct GstVideoOverlayInterface
{
  /**
      parent interface type.
  */
  GTypeInterface iface;

  /**
      virtual method to handle expose events
  */
  extern(C) void function(GstVideoOverlay* overlay) expose;

  /**
      virtual method to handle events
  */
  extern(C) void function(GstVideoOverlay* overlay, gboolean handleEvents) handleEvents;

  /**
      virtual method to set the render rectangle
  */
  extern(C) void function(GstVideoOverlay* overlay, int x, int y, int width, int height) setRenderRectangle;

  /**
      virtual method to configure the window handle
  */
  extern(C) void function(GstVideoOverlay* overlay, size_t handle) setWindowHandle;
}

/**
    An opaque video overlay rectangle object. A rectangle contains a single
    overlay rectangle which can be added to a composition.
*/
struct GstVideoOverlayRectangle;

/**
    Helper structure representing a rectangular area.
*/
struct GstVideoRectangle
{
  /**
      X coordinate of rectangle's top-left point
  */
  int x;

  /**
      Y coordinate of rectangle's top-left point
  */
  int y;

  /**
      width of the rectangle
  */
  int w;

  /**
      height of the rectangle
  */
  int h;
}

/**
    Extra buffer metadata describing an image region of interest
*/
struct GstVideoRegionOfInterestMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      GQuark describing the semantic of the Roi (f.i. a face, a pedestrian)
  */
  GQuark roiType;

  /**
      identifier of this particular ROI
  */
  int id;

  /**
      identifier of its parent ROI, used f.i. for ROI hierarchisation.
  */
  int parentId;

  /**
      x component of upper-left corner
  */
  uint x;

  /**
      y component of upper-left corner
  */
  uint y;

  /**
      bounding box width
  */
  uint w;

  /**
      bounding box height
  */
  uint h;

  /**
      list of #GstStructure containing element-specific params for downstream,
               see [gstvideo.video_region_of_interest_meta.VideoRegionOfInterestMeta.addParam]. (Since: 1.14)
  */
  GList* params;
}

/**
    #GstVideoResampler is a structure which holds the information
    required to perform various kinds of resampling filtering.
*/
struct GstVideoResampler
{
  /**
      the input size
  */
  int inSize;

  /**
      the output size
  */
  int outSize;

  /**
      the maximum number of taps
  */
  uint maxTaps;

  /**
      the number of phases
  */
  uint nPhases;

  /**
      array with the source offset for each output element
  */
  uint* offset;

  /**
      array with the phase to use for each output element
  */
  uint* phase;

  /**
      array with new number of taps for each phase
  */
  uint* nTaps;

  /**
      the taps for all phases
  */
  double* taps;

  /** */
  void*[4] GstReserved;
}

/**
    H.264 H.265 metadata from SEI User Data Unregistered messages
*/
struct GstVideoSEIUserDataUnregisteredMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      User Data Unregistered UUID
  */
  ubyte[16] uuid;

  /**
      Unparsed data buffer
  */
  ubyte* data;

  /**
      Size of the data buffer
  */
  size_t size;
}

/**
    #GstVideoScaler is a utility object for rescaling and resampling
    video frames using various interpolation / sampling methods.
*/
struct GstVideoScaler;

/**
    Provides useful functions and a base class for video sinks.
    
    GstVideoSink will configure the default base sink to drop frames that
    arrive later than 20ms as this is considered the default threshold for
    observing out-of-sync frames.
*/
struct GstVideoSink
{
  /** */
  GstBaseSink element;

  /**
      video width (derived class needs to set this)
  */
  int width;

  /**
      video height (derived class needs to set this)
  */
  int height;

  /** */
  GstVideoSinkPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    The video sink class structure. Derived classes should override the
    @show_frame virtual function.
*/
struct GstVideoSinkClass
{
  /**
      the parent class structure
  */
  GstBaseSinkClass parentClass;

  /**
      render a video frame. Maps to #GstBaseSinkClass.render() and
          #GstBaseSinkClass.preroll() vfuncs. Rendering during preroll will be
          suppressed if the #GstVideoSink:show-preroll-frame property is set to
          false.
  */
  extern(C) GstFlowReturn function(GstVideoSink* videoSink, GstBuffer* buf) showFrame;

  /** */
  extern(C) gboolean function(GstVideoSink* videoSink, GstCaps* caps, const(GstVideoInfo)* info) setInfo;

  /** */
  void*[3] GstReserved;
}

/** */
struct GstVideoSinkPrivate;

/**
    Description of a tile. This structure allow to describe arbitrary tile
    dimensions and sizes.
*/
struct GstVideoTileInfo
{
  /**
      The width in pixels of a tile. This value can be zero if the number of
      pixels per line is not an integer value.
  */
  uint width;

  /** */
  uint height;

  /**
      The stride (in bytes) of a tile line. Regardless if the tile have sub-tiles
      this stride multiplied by the height should be equal to
      #GstVideoTileInfo.size. This value is used to translate into linear stride
      when older APIs are being used to expose this format.
  */
  uint stride;

  /**
      The size in bytes of a tile. This value must be divisible by
      #GstVideoTileInfo.stride.
  */
  uint size;

  /** */
  uint[4] padding;
}

/**
    @field_count must be 0 for progressive video and 1 or 2 for interlaced.
    
    A representation of a SMPTE time code.
    
    @hours must be positive and less than 24. Will wrap around otherwise.
    @minutes and @seconds must be positive and less than 60.
    @frames must be less than or equal to @config.fps_n / @config.fps_d
    These values are *NOT* automatically normalized.
*/
struct GstVideoTimeCode
{
  /**
      the corresponding #GstVideoTimeCodeConfig
  */
  GstVideoTimeCodeConfig config;

  /**
      the hours field of #GstVideoTimeCode
  */
  uint hours;

  /**
      the minutes field of #GstVideoTimeCode
  */
  uint minutes;

  /**
      the seconds field of #GstVideoTimeCode
  */
  uint seconds;

  /**
      the frames field of #GstVideoTimeCode
  */
  uint frames;

  /**
      Interlaced video field count
  */
  uint fieldCount;
}

/**
    Supported frame rates: 30000/1001, 60000/1001 (both with and without drop
    frame), and integer frame rates e.g. 25/1, 30/1, 50/1, 60/1.
    
    The configuration of the time code.
*/
struct GstVideoTimeCodeConfig
{
  /**
      Numerator of the frame rate
  */
  uint fpsN;

  /**
      Denominator of the frame rate
  */
  uint fpsD;

  /**
      the corresponding #GstVideoTimeCodeFlags
  */
  GstVideoTimeCodeFlags flags;

  /**
      The latest daily jam information, if present, or NULL
  */
  GDateTime* latestDailyJam;
}

/**
    A representation of a difference between two #GstVideoTimeCode instances.
    Will not necessarily correspond to a real timecode (e.g. 00:00:10;00)
*/
struct GstVideoTimeCodeInterval
{
  /**
      the hours field of #GstVideoTimeCodeInterval
  */
  uint hours;

  /**
      the minutes field of #GstVideoTimeCodeInterval
  */
  uint minutes;

  /**
      the seconds field of #GstVideoTimeCodeInterval
  */
  uint seconds;

  /**
      the frames field of #GstVideoTimeCodeInterval
  */
  uint frames;
}

/**
    Extra buffer metadata describing the GstVideoTimeCode of the frame.
    
    Each frame is assumed to have its own timecode, i.e. they are not
    automatically incremented/interpolated.
*/
struct GstVideoTimeCodeMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      the GstVideoTimeCode to attach
  */
  GstVideoTimeCode tc;
}

/**
    An encoder for writing ancillary data to the
    Vertical Blanking Interval lines of component signals.
*/
struct GstVideoVBIEncoder;

/**
    A parser for detecting and extracting @GstVideoAncillary data from
    Vertical Blanking Interval lines of component signals.
*/
struct GstVideoVBIParser;

alias extern(C) gboolean function(GstVideoAffineTransformationMeta* meta, float* matrix) GstVideoAffineTransformationGetMatrix;

alias extern(C) void function(GstSample* sample, GError* error, void* userData) GstVideoConvertSampleCallback;

alias extern(C) void function(const(GstVideoFormatInfo)* info, GstVideoPackFlags flags, void* src, int sstride, void** data, const(int)* stride, GstVideoChromaSite chromaSite, int y, int width) GstVideoFormatPack;

alias extern(C) void function(const(GstVideoFormatInfo)* info, GstVideoPackFlags flags, void* dest, const(void*)* data, const(int)* stride, int x, int y, int width) GstVideoFormatUnpack;

alias extern(C) gboolean function(GstVideoGLTextureUploadMeta* meta, uint* textureId) GstVideoGLTextureUpload;

