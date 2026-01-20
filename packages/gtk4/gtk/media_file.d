/// Module for [MediaFile] class
module gtk.media_file;

import gdk.paintable;
import gdk.paintable_mixin;
import gid.gid;
import gio.file;
import gio.input_stream;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.media_stream;
import gtk.types;

/**
    [gtk.media_file.MediaFile] implements [gtk.media_stream.MediaStream] for files.
    
    This provides a simple way to play back video files with GTK.
    
    GTK provides a GIO extension point for [gtk.media_file.MediaFile] implementations
    to allow for external implementations using various media frameworks.
    
    GTK itself includes an implementation using GStreamer.
*/
class MediaFile : gtk.media_stream.MediaStream
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
    return cast(void function())gtk_media_file_get_type != &gidSymbolNotFound ? gtk_media_file_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MediaFile self()
  {
    return this;
  }

  /**
      Get `file` property.
      Returns: The file being played back or null if not playing a file.
  */
  @property gio.file.File file()
  {
    return getFile();
  }

  /**
      Set `file` property.
      Params:
        propval = The file being played back or null if not playing a file.
  */
  @property void file(gio.file.File propval)
  {
    return setFile(propval);
  }

  /**
      Get `inputStream` property.
      Returns: The stream being played back or null if not playing a stream.
        
        This is null when playing a file.
  */
  @property gio.input_stream.InputStream inputStream()
  {
    return getInputStream();
  }

  /**
      Set `inputStream` property.
      Params:
        propval = The stream being played back or null if not playing a stream.
          
          This is null when playing a file.
  */
  @property void inputStream(gio.input_stream.InputStream propval)
  {
    return setInputStream(propval);
  }

  /**
      Creates a new empty media file.
      Returns: a new [gtk.media_file.MediaFile]
  */
  this()
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_file_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new media file to play file.
  
      Params:
        file = The file to play
      Returns: a new [gtk.media_file.MediaFile] playing file
  */
  static gtk.media_file.MediaFile newForFile(gio.file.File file)
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_file_new_for_file(file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.media_file.MediaFile)(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new media file for the given filename.
      
      This is a utility function that converts the given filename
      to a [gio.file.File] and calls [gtk.media_file.MediaFile.newForFile].
  
      Params:
        filename = filename to open
      Returns: a new [gtk.media_file.MediaFile] playing filename
  */
  static gtk.media_file.MediaFile newForFilename(string filename)
  {
    GtkMediaStream* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gtk_media_file_new_for_filename(_filename);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.media_file.MediaFile)(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new media file to play stream.
      
      If you want the resulting media to be seekable,
      the stream should implement the [gio.seekable.Seekable] interface.
  
      Params:
        stream = The stream to play
      Returns: a new [gtk.media_file.MediaFile]
  */
  static gtk.media_file.MediaFile newForInputStream(gio.input_stream.InputStream stream)
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_file_new_for_input_stream(stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.media_file.MediaFile)(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new new media file for the given resource.
      
      This is a utility function that converts the given resource
      to a [gio.file.File] and calls [gtk.media_file.MediaFile.newForFile].
  
      Params:
        resourcePath = resource path to open
      Returns: a new [gtk.media_file.MediaFile] playing resource_path
  */
  static gtk.media_file.MediaFile newForResource(string resourcePath)
  {
    GtkMediaStream* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    _cretval = gtk_media_file_new_for_resource(_resourcePath);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.media_file.MediaFile)(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Resets the media file to be empty.
  */
  void clear()
  {
    gtk_media_file_clear(cast(GtkMediaFile*)this._cPtr);
  }

  /**
      Returns the file that self is currently playing from.
      
      When self is not playing or not playing from a file,
      null is returned.
      Returns: The currently playing file
  */
  gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_media_file_get_file(cast(GtkMediaFile*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the stream that self is currently playing from.
      
      When self is not playing or not playing from a stream,
      null is returned.
      Returns: The currently playing stream
  */
  gio.input_stream.InputStream getInputStream()
  {
    GInputStream* _cretval;
    _cretval = gtk_media_file_get_input_stream(cast(GtkMediaFile*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the [gtk.media_file.MediaFile] to play the given file.
      
      If any file is still playing, stop playing it.
  
      Params:
        file = the file to play
  */
  void setFile(gio.file.File file = null)
  {
    gtk_media_file_set_file(cast(GtkMediaFile*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Sets the `GtkMediaFile to play the given file.
      
      This is a utility function that converts the given filename
      to a [gio.file.File] and calls [gtk.media_file.MediaFile.setFile].
  
      Params:
        filename = name of file to play
  */
  void setFilename(string filename = null)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gtk_media_file_set_filename(cast(GtkMediaFile*)this._cPtr, _filename);
  }

  /**
      Sets the [gtk.media_file.MediaFile] to play the given stream.
      
      If anything is still playing, stop playing it.
      
      Full control about the stream is assumed for the duration of
      playback. The stream will not be closed.
  
      Params:
        stream = the stream to play from
  */
  void setInputStream(gio.input_stream.InputStream stream = null)
  {
    gtk_media_file_set_input_stream(cast(GtkMediaFile*)this._cPtr, stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null);
  }

  /**
      Sets the `GtkMediaFile to play the given resource.
      
      This is a utility function that converts the given resource_path
      to a [gio.file.File] and calls [gtk.media_file.MediaFile.setFile].
  
      Params:
        resourcePath = path to resource to play
  */
  void setResource(string resourcePath = null)
  {
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    gtk_media_file_set_resource(cast(GtkMediaFile*)this._cPtr, _resourcePath);
  }
}
