/// Module for [MediaStream] class
module gtk.media_stream;

import gdk.paintable;
import gdk.paintable_mixin;
import gdk.surface;
import gid.gid;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.media_stream.MediaStream] is the integration point for media playback inside GTK.
    
    GTK provides an implementation of the [gtk.media_stream.MediaStream] interface that
    is called [gtk.media_file.MediaFile].
    
    Apart from application-facing API for stream playback, [gtk.media_stream.MediaStream]
    has a number of APIs that are only useful for implementations and should
    not be used in applications:
    [gtk.media_stream.MediaStream.prepared],
    [gtk.media_stream.MediaStream.unprepared],
    [gtk.media_stream.MediaStream.update],
    [gtk.media_stream.MediaStream.ended],
    [gtk.media_stream.MediaStream.seekSuccess],
    [gtk.media_stream.MediaStream.seekFailed],
    [gtk.media_stream.MediaStream.gerror],
    [gtk.media_stream.MediaStream.error],
    [gtk.media_stream.MediaStream.errorValist].
*/
class MediaStream : gobject.object.ObjectWrap, gdk.paintable.Paintable
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_media_stream_get_type != &gidSymbolNotFound ? gtk_media_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MediaStream self()
  {
    return this;
  }

  /**
      Get `duration` property.
      Returns: The stream's duration in microseconds or 0 if unknown.
  */
  @property long duration()
  {
    return getDuration();
  }

  /**
      Get `loop` property.
      Returns: Try to restart the media from the beginning once it ended.
  */
  @property bool loop()
  {
    return getLoop();
  }

  /**
      Set `loop` property.
      Params:
        propval = Try to restart the media from the beginning once it ended.
  */
  @property void loop(bool propval)
  {
    return setLoop(propval);
  }

  /**
      Get `muted` property.
      Returns: Whether the audio stream should be muted.
  */
  @property bool muted()
  {
    return getMuted();
  }

  /**
      Set `muted` property.
      Params:
        propval = Whether the audio stream should be muted.
  */
  @property void muted(bool propval)
  {
    return setMuted(propval);
  }

  /**
      Get `playing` property.
      Returns: Whether the stream is currently playing.
  */
  @property bool playing()
  {
    return getPlaying();
  }

  /**
      Set `playing` property.
      Params:
        propval = Whether the stream is currently playing.
  */
  @property void playing(bool propval)
  {
    return setPlaying(propval);
  }

  /**
      Get `seekable` property.
      Returns: Set unless the stream is known to not support seeking.
  */
  @property bool seekable()
  {
    return isSeekable();
  }

  /**
      Get `seeking` property.
      Returns: Set while a seek is in progress.
  */
  @property bool seeking()
  {
    return isSeeking();
  }

  /**
      Get `timestamp` property.
      Returns: The current presentation timestamp in microseconds.
  */
  @property long timestamp()
  {
    return getTimestamp();
  }

  /**
      Get `volume` property.
      Returns: Volume of the audio stream.
  */
  @property double volume()
  {
    return getVolume();
  }

  /**
      Set `volume` property.
      Params:
        propval = Volume of the audio stream.
  */
  @property void volume(double propval)
  {
    return setVolume(propval);
  }

  mixin PaintableT!();

  /**
      Sets self into an error state.
      
      This will pause the stream (you can check for an error
      via [gtk.media_stream.MediaStream.getError] in your
      GtkMediaStream.pause() implementation), abort pending
      seeks and mark the stream as prepared.
      
      if the stream is already in an error state, this call
      will be ignored and the existing error will be retained.
      
      To unset an error, the stream must be reset via a call to
      [gtk.media_stream.MediaStream.unprepared].
  
      Params:
        error = the [glib.error.ErrorWrap] to set
  */
  void gerror(glib.error.ErrorWrap error)
  {
    gtk_media_stream_gerror(cast(GtkMediaStream*)this._cPtr, error ? cast(GError*)error._cPtr : null);
  }

  /**
      Gets the duration of the stream.
      
      If the duration is not known, 0 will be returned.
      Returns: the duration of the stream or 0 if not known.
  */
  long getDuration()
  {
    long _retval;
    _retval = gtk_media_stream_get_duration(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the streams playback is finished.
      Returns: true if playback is finished
  */
  bool getEnded()
  {
    bool _retval;
    _retval = cast(bool)gtk_media_stream_get_ended(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      If the stream is in an error state, returns the [glib.error.ErrorWrap]
      explaining that state.
      
      Any type of error can be reported here depending on the
      implementation of the media stream.
      
      A media stream in an error cannot be operated on, calls
      like [gtk.media_stream.MediaStream.play] or
      [gtk.media_stream.MediaStream.seek] will not have any effect.
      
      [gtk.media_stream.MediaStream] itself does not provide a way to unset
      an error, but implementations may provide options. For example,
      a [gtk.media_file.MediaFile] will unset errors when a new source is
      set, e.g. with [gtk.media_file.MediaFile.setFile].
      Returns: null if not in an
          error state or the [glib.error.ErrorWrap] of the stream
  */
  glib.error.ErrorWrap getError()
  {
    const(GError)* _cretval;
    _cretval = gtk_media_stream_get_error(cast(GtkMediaStream*)this._cPtr);
    auto _retval = _cretval ? new glib.error.ErrorWrap(cast(GError*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns whether the stream is set to loop.
      
      See [gtk.media_stream.MediaStream.setLoop] for details.
      Returns: true if the stream should loop
  */
  bool getLoop()
  {
    bool _retval;
    _retval = cast(bool)gtk_media_stream_get_loop(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the audio for the stream is muted.
      
      See [gtk.media_stream.MediaStream.setMuted] for details.
      Returns: true if the stream is muted
  */
  bool getMuted()
  {
    bool _retval;
    _retval = cast(bool)gtk_media_stream_get_muted(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Return whether the stream is currently playing.
      Returns: true if the stream is playing
  */
  bool getPlaying()
  {
    bool _retval;
    _retval = cast(bool)gtk_media_stream_get_playing(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current presentation timestamp in microseconds.
      Returns: the timestamp in microseconds
  */
  long getTimestamp()
  {
    long _retval;
    _retval = gtk_media_stream_get_timestamp(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Returns the volume of the audio for the stream.
      
      See [gtk.media_stream.MediaStream.setVolume] for details.
      Returns: volume of the stream from 0.0 to 1.0
  */
  double getVolume()
  {
    double _retval;
    _retval = gtk_media_stream_get_volume(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the stream has audio.
      Returns: true if the stream has audio
  */
  bool hasAudio()
  {
    bool _retval;
    _retval = cast(bool)gtk_media_stream_has_audio(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the stream has video.
      Returns: true if the stream has video
  */
  bool hasVideo()
  {
    bool _retval;
    _retval = cast(bool)gtk_media_stream_has_video(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the stream has finished initializing.
      
      At this point the existence of audio and video is known.
      Returns: true if the stream is prepared
  */
  bool isPrepared()
  {
    bool _retval;
    _retval = cast(bool)gtk_media_stream_is_prepared(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a stream may be seekable.
      
      This is meant to be a hint. Streams may not allow seeking even if
      this function returns true. However, if this function returns
      false, streams are guaranteed to not be seekable and user interfaces
      may hide controls that allow seeking.
      
      It is allowed to call [gtk.media_stream.MediaStream.seek] on a non-seekable
      stream, though it will not do anything.
      Returns: true if the stream may support seeking
  */
  bool isSeekable()
  {
    bool _retval;
    _retval = cast(bool)gtk_media_stream_is_seekable(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Checks if there is currently a seek operation going on.
      Returns: true if a seek operation is ongoing.
  */
  bool isSeeking()
  {
    bool _retval;
    _retval = cast(bool)gtk_media_stream_is_seeking(cast(GtkMediaStream*)this._cPtr);
    return _retval;
  }

  /**
      Pauses playback of the stream.
      
      If the stream is not playing, do nothing.
  */
  void pause()
  {
    gtk_media_stream_pause(cast(GtkMediaStream*)this._cPtr);
  }

  /**
      Starts playing the stream.
      
      If the stream is in error or already playing, do nothing.
  */
  void play()
  {
    gtk_media_stream_play(cast(GtkMediaStream*)this._cPtr);
  }

  /**
      Called by users to attach the media stream to a [gdk.surface.Surface] they manage.
      
      The stream can then access the resources of surface for its
      rendering purposes. In particular, media streams might want to
      create a [gdk.glcontext.GLContext] or sync to the [gdk.frame_clock.FrameClock].
      
      Whoever calls this function is responsible for calling
      [gtk.media_stream.MediaStream.unrealize] before either the stream
      or surface get destroyed.
      
      Multiple calls to this function may happen from different
      users of the video, even with the same surface. Each of these
      calls must be followed by its own call to
      [gtk.media_stream.MediaStream.unrealize].
      
      It is not required to call this function to make a media stream work.
  
      Params:
        surface = a [gdk.surface.Surface]
  */
  void realize(gdk.surface.Surface surface)
  {
    gtk_media_stream_realize(cast(GtkMediaStream*)this._cPtr, surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null);
  }

  /**
      Start a seek operation on self to timestamp.
      
      If timestamp is out of range, it will be clamped.
      
      Seek operations may not finish instantly. While a
      seek operation is in process, the [gtk.media_stream.MediaStream.seeking]
      property will be set.
      
      When calling [gtk.media_stream.MediaStream.seek] during an
      ongoing seek operation, the new seek will override
      any pending seek.
  
      Params:
        timestamp = timestamp to seek to.
  */
  void seek(long timestamp)
  {
    gtk_media_stream_seek(cast(GtkMediaStream*)this._cPtr, timestamp);
  }

  /**
      Ends a seek operation started via GtkMediaStream.seek() as a failure.
      
      This will not cause an error on the stream and will assume that
      playback continues as if no seek had happened.
      
      See [gtk.media_stream.MediaStream.seekSuccess] for the other way of
      ending a seek.
  */
  void seekFailed()
  {
    gtk_media_stream_seek_failed(cast(GtkMediaStream*)this._cPtr);
  }

  /**
      Ends a seek operation started via GtkMediaStream.seek() successfully.
      
      This function will unset the GtkMediaStream:ended property
      if it was set.
      
      See [gtk.media_stream.MediaStream.seekFailed] for the other way of
      ending a seek.
  */
  void seekSuccess()
  {
    gtk_media_stream_seek_success(cast(GtkMediaStream*)this._cPtr);
  }

  /**
      Sets whether the stream should loop.
      
      In this case, it will attempt to restart playback
      from the beginning instead of stopping at the end.
      
      Not all streams may support looping, in particular
      non-seekable streams. Those streams will ignore the
      loop setting and just end.
  
      Params:
        loop = true if the stream should loop
  */
  void setLoop(bool loop)
  {
    gtk_media_stream_set_loop(cast(GtkMediaStream*)this._cPtr, loop);
  }

  /**
      Sets whether the audio stream should be muted.
      
      Muting a stream will cause no audio to be played, but it
      does not modify the volume. This means that muting and
      then unmuting the stream will restore the volume settings.
      
      If the stream has no audio, calling this function will
      still work but it will not have an audible effect.
  
      Params:
        muted = true if the stream should be muted
  */
  void setMuted(bool muted)
  {
    gtk_media_stream_set_muted(cast(GtkMediaStream*)this._cPtr, muted);
  }

  /**
      Starts or pauses playback of the stream.
  
      Params:
        playing = whether to start or pause playback
  */
  void setPlaying(bool playing)
  {
    gtk_media_stream_set_playing(cast(GtkMediaStream*)this._cPtr, playing);
  }

  /**
      Sets the volume of the audio stream.
      
      This function call will work even if the stream is muted.
      
      The given volume should range from 0.0 for silence to 1.0
      for as loud as possible. Values outside of this range will
      be clamped to the nearest value.
      
      If the stream has no audio or is muted, calling this function
      will still work but it will not have an immediate audible effect.
      When the stream is unmuted, the new volume setting will take effect.
  
      Params:
        volume = New volume of the stream from 0.0 to 1.0
  */
  void setVolume(double volume)
  {
    gtk_media_stream_set_volume(cast(GtkMediaStream*)this._cPtr, volume);
  }

  /**
      Pauses the media stream and marks it as ended.
      
      This is a hint only, calls to [gtk.media_stream.MediaStream.play]
      may still happen.
      
      The media stream must be prepared when this function is called.
  */
  void streamEnded()
  {
    gtk_media_stream_stream_ended(cast(GtkMediaStream*)this._cPtr);
  }

  /**
      Called by [gtk.media_stream.MediaStream] implementations to advertise the stream
      being ready to play and providing details about the stream.
      
      Note that the arguments are hints. If the stream implementation
      cannot determine the correct values, it is better to err on the
      side of caution and return true. User interfaces will use those
      values to determine what controls to show.
      
      This function may not be called again until the stream has been
      reset via [gtk.media_stream.MediaStream.streamUnprepared].
  
      Params:
        hasAudio = true if the stream should advertise audio support
        hasVideo = true if the stream should advertise video support
        seekable = true if the stream should advertise seekability
        duration = The duration of the stream or 0 if unknown
  */
  void streamPrepared(bool hasAudio, bool hasVideo, bool seekable, long duration)
  {
    gtk_media_stream_stream_prepared(cast(GtkMediaStream*)this._cPtr, hasAudio, hasVideo, seekable, duration);
  }

  /**
      Resets a given media stream implementation.
      
      [gtk.media_stream.MediaStream.streamPrepared] can then be called again.
      
      This function will also reset any error state the stream was in.
  */
  void streamUnprepared()
  {
    gtk_media_stream_stream_unprepared(cast(GtkMediaStream*)this._cPtr);
  }

  /**
      Undoes a previous call to [gtk.media_stream.MediaStream.realize].
      
      This causes the stream to release all resources it had
      allocated from surface.
  
      Params:
        surface = the [gdk.surface.Surface] the stream was realized with
  */
  void unrealize(gdk.surface.Surface surface)
  {
    gtk_media_stream_unrealize(cast(GtkMediaStream*)this._cPtr, surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null);
  }

  /**
      Media stream implementations should regularly call this
      function to update the timestamp reported by the stream.
      
      It is up to implementations to call this at the frequency
      they deem appropriate.
      
      The media stream must be prepared when this function is called.
  
      Params:
        timestamp = the new timestamp
  */
  void update(long timestamp)
  {
    gtk_media_stream_update(cast(GtkMediaStream*)this._cPtr, timestamp);
  }
}
