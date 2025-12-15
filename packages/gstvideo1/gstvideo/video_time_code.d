/// Module for [VideoTimeCode] class
module gstvideo.video_time_code;

import gid.gid;
import glib.date_time;
import gobject.boxed;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_time_code_config;
import gstvideo.video_time_code_interval;

/**
    @field_count must be 0 for progressive video and 1 or 2 for interlaced.
    
    A representation of a SMPTE time code.
    
    @hours must be positive and less than 24. Will wrap around otherwise.
    @minutes and @seconds must be positive and less than 60.
    @frames must be less than or equal to @config.fps_n / @config.fps_d
    These values are *NOT* automatically normalized.
*/
class VideoTimeCode : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_time_code_get_type != &gidSymbolNotFound ? gst_video_time_code_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoTimeCode self()
  {
    return this;
  }

  /**
      Get `config` field.
      Returns: the corresponding #GstVideoTimeCodeConfig
  */
  @property gstvideo.video_time_code_config.VideoTimeCodeConfig config()
  {
    return new gstvideo.video_time_code_config.VideoTimeCodeConfig(cast(GstVideoTimeCodeConfig*)&(cast(GstVideoTimeCode*)this._cPtr).config, No.Take);
  }

  /**
      Get `hours` field.
      Returns: the hours field of #GstVideoTimeCode
  */
  @property uint hours()
  {
    return (cast(GstVideoTimeCode*)this._cPtr).hours;
  }

  /**
      Set `hours` field.
      Params:
        propval = the hours field of #GstVideoTimeCode
  */
  @property void hours(uint propval)
  {
    (cast(GstVideoTimeCode*)this._cPtr).hours = propval;
  }

  /**
      Get `minutes` field.
      Returns: the minutes field of #GstVideoTimeCode
  */
  @property uint minutes()
  {
    return (cast(GstVideoTimeCode*)this._cPtr).minutes;
  }

  /**
      Set `minutes` field.
      Params:
        propval = the minutes field of #GstVideoTimeCode
  */
  @property void minutes(uint propval)
  {
    (cast(GstVideoTimeCode*)this._cPtr).minutes = propval;
  }

  /**
      Get `seconds` field.
      Returns: the seconds field of #GstVideoTimeCode
  */
  @property uint seconds()
  {
    return (cast(GstVideoTimeCode*)this._cPtr).seconds;
  }

  /**
      Set `seconds` field.
      Params:
        propval = the seconds field of #GstVideoTimeCode
  */
  @property void seconds(uint propval)
  {
    (cast(GstVideoTimeCode*)this._cPtr).seconds = propval;
  }

  /**
      Get `frames` field.
      Returns: the frames field of #GstVideoTimeCode
  */
  @property uint frames()
  {
    return (cast(GstVideoTimeCode*)this._cPtr).frames;
  }

  /**
      Set `frames` field.
      Params:
        propval = the frames field of #GstVideoTimeCode
  */
  @property void frames(uint propval)
  {
    (cast(GstVideoTimeCode*)this._cPtr).frames = propval;
  }

  /**
      Get `fieldCount` field.
      Returns: Interlaced video field count
  */
  @property uint fieldCount()
  {
    return (cast(GstVideoTimeCode*)this._cPtr).fieldCount;
  }

  /**
      Set `fieldCount` field.
      Params:
        propval = Interlaced video field count
  */
  @property void fieldCount(uint propval)
  {
    (cast(GstVideoTimeCode*)this._cPtr).fieldCount = propval;
  }

  /**
      field_count is 0 for progressive, 1 or 2 for interlaced.
      latest_daiy_jam reference is stolen from caller.
  
      Params:
        fpsN = Numerator of the frame rate
        fpsD = Denominator of the frame rate
        latestDailyJam = The latest daily jam of the #GstVideoTimeCode
        flags = #GstVideoTimeCodeFlags
        hours = the hours field of #GstVideoTimeCode
        minutes = the minutes field of #GstVideoTimeCode
        seconds = the seconds field of #GstVideoTimeCode
        frames = the frames field of #GstVideoTimeCode
        fieldCount = Interlaced video field count
      Returns: a new #GstVideoTimeCode with the given values.
        The values are not checked for being in a valid range. To see if your
        timecode actually has valid content, use [gstvideo.video_time_code.VideoTimeCode.isValid].
  */
  this(uint fpsN, uint fpsD, glib.date_time.DateTime latestDailyJam, gstvideo.types.VideoTimeCodeFlags flags, uint hours, uint minutes, uint seconds, uint frames, uint fieldCount)
  {
    GstVideoTimeCode* _cretval;
    _cretval = gst_video_time_code_new(fpsN, fpsD, latestDailyJam ? cast(GDateTime*)latestDailyJam._cPtr(No.Dup) : null, flags, hours, minutes, seconds, frames, fieldCount);
    this(_cretval, Yes.Take);
  }

  /** */
  static gstvideo.video_time_code.VideoTimeCode newEmpty()
  {
    GstVideoTimeCode* _cretval;
    _cretval = gst_video_time_code_new_empty();
    auto _retval = _cretval ? new gstvideo.video_time_code.VideoTimeCode(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      The resulting config->latest_daily_jam is set to
      midnight, and timecode is set to the given time.
      
      This might return a completely invalid timecode, use
      [gstvideo.video_time_code.VideoTimeCode.newFromDateTimeFull] to ensure
      that you would get null instead in that case.
  
      Params:
        fpsN = Numerator of the frame rate
        fpsD = Denominator of the frame rate
        dt = #GDateTime to convert
        flags = #GstVideoTimeCodeFlags
        fieldCount = Interlaced video field count
      Returns: the #GstVideoTimeCode representation of dt.
  */
  static gstvideo.video_time_code.VideoTimeCode newFromDateTime(uint fpsN, uint fpsD, glib.date_time.DateTime dt, gstvideo.types.VideoTimeCodeFlags flags, uint fieldCount)
  {
    GstVideoTimeCode* _cretval;
    _cretval = gst_video_time_code_new_from_date_time(fpsN, fpsD, dt ? cast(GDateTime*)dt._cPtr(No.Dup) : null, flags, fieldCount);
    auto _retval = _cretval ? new gstvideo.video_time_code.VideoTimeCode(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      The resulting config->latest_daily_jam is set to
      midnight, and timecode is set to the given time.
  
      Params:
        fpsN = Numerator of the frame rate
        fpsD = Denominator of the frame rate
        dt = #GDateTime to convert
        flags = #GstVideoTimeCodeFlags
        fieldCount = Interlaced video field count
      Returns: the #GstVideoTimeCode representation of dt, or null if
          no valid timecode could be created.
  */
  static gstvideo.video_time_code.VideoTimeCode newFromDateTimeFull(uint fpsN, uint fpsD, glib.date_time.DateTime dt, gstvideo.types.VideoTimeCodeFlags flags, uint fieldCount)
  {
    GstVideoTimeCode* _cretval;
    _cretval = gst_video_time_code_new_from_date_time_full(fpsN, fpsD, dt ? cast(GDateTime*)dt._cPtr(No.Dup) : null, flags, fieldCount);
    auto _retval = _cretval ? new gstvideo.video_time_code.VideoTimeCode(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  static gstvideo.video_time_code.VideoTimeCode newFromString(string tcStr)
  {
    GstVideoTimeCode* _cretval;
    const(char)* _tcStr = tcStr.toCString(No.Alloc);
    _cretval = gst_video_time_code_new_from_string(_tcStr);
    auto _retval = _cretval ? new gstvideo.video_time_code.VideoTimeCode(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adds or subtracts frames amount of frames to tc. tc needs to
      contain valid data, as verified by [gstvideo.video_time_code.VideoTimeCode.isValid].
  
      Params:
        frames = How many frames to add or subtract
  */
  void addFrames(long frames)
  {
    gst_video_time_code_add_frames(cast(GstVideoTimeCode*)this._cPtr, frames);
  }

  /**
      This makes a component-wise addition of tc_inter to tc. For example,
      adding ("01:02:03:04", "00:01:00:00") will return "01:03:03:04".
      When it comes to drop-frame timecodes,
      adding ("00:00:00;00", "00:01:00:00") will return "00:01:00;02"
      because of drop-frame oddities. However,
      adding ("00:09:00;02", "00:01:00:00") will return "00:10:00;00"
      because this time we can have an exact minute.
  
      Params:
        tcInter = The #GstVideoTimeCodeInterval to add to tc.
          The interval must contain valid values, except that for drop-frame
          timecode, it may also contain timecodes which would normally
          be dropped. These are then corrected to the next reasonable timecode.
      Returns: A new #GstVideoTimeCode with tc_inter added or null
          if the interval can't be added.
  */
  gstvideo.video_time_code.VideoTimeCode addInterval(gstvideo.video_time_code_interval.VideoTimeCodeInterval tcInter)
  {
    GstVideoTimeCode* _cretval;
    _cretval = gst_video_time_code_add_interval(cast(const(GstVideoTimeCode)*)this._cPtr, tcInter ? cast(const(GstVideoTimeCodeInterval)*)tcInter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gstvideo.video_time_code.VideoTimeCode(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Initializes tc with empty/zero/NULL values and frees any memory
      it might currently use.
  */
  void clear()
  {
    gst_video_time_code_clear(cast(GstVideoTimeCode*)this._cPtr);
  }

  /**
      Compares tc1 and tc2. If both have latest daily jam information, it is
      taken into account. Otherwise, it is assumed that the daily jam of both
      tc1 and tc2 was at the same time. Both time codes must be valid.
  
      Params:
        tc2 = another valid #GstVideoTimeCode
      Returns: 1 if tc1 is after tc2, -1 if tc1 is before tc2, 0 otherwise.
  */
  int compare(gstvideo.video_time_code.VideoTimeCode tc2)
  {
    int _retval;
    _retval = gst_video_time_code_compare(cast(const(GstVideoTimeCode)*)this._cPtr, tc2 ? cast(const(GstVideoTimeCode)*)tc2._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  gstvideo.video_time_code.VideoTimeCode copy()
  {
    GstVideoTimeCode* _cretval;
    _cretval = gst_video_time_code_copy(cast(const(GstVideoTimeCode)*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_time_code.VideoTimeCode(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  ulong framesSinceDailyJam()
  {
    ulong _retval;
    _retval = gst_video_time_code_frames_since_daily_jam(cast(const(GstVideoTimeCode)*)this._cPtr);
    return _retval;
  }

  /**
      Adds one frame to tc.
  */
  void incrementFrame()
  {
    gst_video_time_code_increment_frame(cast(GstVideoTimeCode*)this._cPtr);
  }

  /**
      field_count is 0 for progressive, 1 or 2 for interlaced.
      latest_daiy_jam reference is stolen from caller.
      
      Initializes tc with the given values.
      The values are not checked for being in a valid range. To see if your
      timecode actually has valid content, use [gstvideo.video_time_code.VideoTimeCode.isValid].
  
      Params:
        fpsN = Numerator of the frame rate
        fpsD = Denominator of the frame rate
        latestDailyJam = The latest daily jam of the #GstVideoTimeCode
        flags = #GstVideoTimeCodeFlags
        hours = the hours field of #GstVideoTimeCode
        minutes = the minutes field of #GstVideoTimeCode
        seconds = the seconds field of #GstVideoTimeCode
        frames = the frames field of #GstVideoTimeCode
        fieldCount = Interlaced video field count
  */
  void init_(uint fpsN, uint fpsD, glib.date_time.DateTime latestDailyJam, gstvideo.types.VideoTimeCodeFlags flags, uint hours, uint minutes, uint seconds, uint frames, uint fieldCount)
  {
    gst_video_time_code_init(cast(GstVideoTimeCode*)this._cPtr, fpsN, fpsD, latestDailyJam ? cast(GDateTime*)latestDailyJam._cPtr(No.Dup) : null, flags, hours, minutes, seconds, frames, fieldCount);
  }

  /**
      The resulting config->latest_daily_jam is set to midnight, and timecode is
      set to the given time.
      
      Will assert on invalid parameters, use [gstvideo.video_time_code.VideoTimeCode.initFromDateTimeFull]
      for being able to handle invalid parameters.
  
      Params:
        fpsN = Numerator of the frame rate
        fpsD = Denominator of the frame rate
        dt = #GDateTime to convert
        flags = #GstVideoTimeCodeFlags
        fieldCount = Interlaced video field count
  */
  void initFromDateTime(uint fpsN, uint fpsD, glib.date_time.DateTime dt, gstvideo.types.VideoTimeCodeFlags flags, uint fieldCount)
  {
    gst_video_time_code_init_from_date_time(cast(GstVideoTimeCode*)this._cPtr, fpsN, fpsD, dt ? cast(GDateTime*)dt._cPtr(No.Dup) : null, flags, fieldCount);
  }

  /**
      The resulting config->latest_daily_jam is set to
      midnight, and timecode is set to the given time.
  
      Params:
        fpsN = Numerator of the frame rate
        fpsD = Denominator of the frame rate
        dt = #GDateTime to convert
        flags = #GstVideoTimeCodeFlags
        fieldCount = Interlaced video field count
      Returns: true if tc could be correctly initialized to a valid timecode
  */
  bool initFromDateTimeFull(uint fpsN, uint fpsD, glib.date_time.DateTime dt, gstvideo.types.VideoTimeCodeFlags flags, uint fieldCount)
  {
    bool _retval;
    _retval = cast(bool)gst_video_time_code_init_from_date_time_full(cast(GstVideoTimeCode*)this._cPtr, fpsN, fpsD, dt ? cast(GDateTime*)dt._cPtr(No.Dup) : null, flags, fieldCount);
    return _retval;
  }

  /** */
  bool isValid()
  {
    bool _retval;
    _retval = cast(bool)gst_video_time_code_is_valid(cast(const(GstVideoTimeCode)*)this._cPtr);
    return _retval;
  }

  /** */
  ulong nsecSinceDailyJam()
  {
    ulong _retval;
    _retval = gst_video_time_code_nsec_since_daily_jam(cast(const(GstVideoTimeCode)*)this._cPtr);
    return _retval;
  }

  /**
      The tc.config->latest_daily_jam is required to be non-NULL.
      Returns: the #GDateTime representation of tc or null if tc
          has no daily jam.
  */
  glib.date_time.DateTime toDateTime()
  {
    GDateTime* _cretval;
    _cretval = gst_video_time_code_to_date_time(cast(const(GstVideoTimeCode)*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = gst_video_time_code_to_string(cast(const(GstVideoTimeCode)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
