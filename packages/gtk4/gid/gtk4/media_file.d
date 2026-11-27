/// Module for [MediaFile] class
module gid.gtk4.media_file;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.paintable;
import gid.gdk4.paintable_mixin;
import gid.gio2.file;
import gid.gio2.input_stream;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.media_stream;
import gid.gtk4.types;

/**
    Implements the [gid.gtk4.media_stream.MediaStream] interface for files.
    
    This provides a simple way to play back video files with GTK.
    
    GTK provides a GIO extension point for [gid.gtk4.media_file.MediaFile] implementations
    to allow for external implementations using various media frameworks.
    
    GTK itself includes an implementation using GStreamer.
*/
@gidGir("MediaFile", "MediaFileClass")
class MediaFile : gid.gtk4.media_stream.MediaStream
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_media_file_get_type != &gidSymbolNotFound ? gtk_media_file_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMediaFile";
  }

  /** Returns `this`, for use in `with` statements. */
  override MediaFile self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.media_file.MediaFile]
      Returns: New builder object
  */
  static MediaFileGidBuilder builder() nothrow
  {
    return new MediaFileGidBuilder;
  }

  /**
      Get `file` property.
      Returns: The file being played back or null if not playing a file.
  */
  @property gid.gio2.file.File file() nothrow
  {
    return getFile();
  }

  /**
      Set `file` property.
      Params:
        propval = The file being played back or null if not playing a file.
  */
  @property void file(gid.gio2.file.File propval) nothrow
  {
    setFile(propval);
  }

  /**
      Get `inputStream` property.
      Returns: The stream being played back or null if not playing a stream.
        
        This is null when playing a file.
  */
  @property gid.gio2.input_stream.InputStream inputStream() nothrow
  {
    return getInputStream();
  }

  /**
      Set `inputStream` property.
      Params:
        propval = The stream being played back or null if not playing a stream.
          
          This is null when playing a file.
  */
  @property void inputStream(gid.gio2.input_stream.InputStream propval) nothrow
  {
    setInputStream(propval);
  }

  /**
      Creates a new empty media file.
      Returns: a new [gid.gtk4.media_file.MediaFile]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkMediaStream* _cretval;
      _cretval = gtk_media_file_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new media file to play file.
  
      Params:
        file = The file to play
      Returns: a new [gid.gtk4.media_file.MediaFile] playing file
  */
  static gid.gtk4.media_file.MediaFile newForFile(gid.gio2.file.File file) nothrow
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_file_new_for_file(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.media_file.MediaFile)(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new media file for the given filename.
      
      This is a utility function that converts the given filename
      to a [gid.gio2.file.File] and calls [gid.gtk4.media_file.MediaFile.newForFile].
  
      Params:
        filename = filename to open
      Returns: a new [gid.gtk4.media_file.MediaFile] playing filename
  */
  static gid.gtk4.media_file.MediaFile newForFilename(string filename) nothrow
  {
    GtkMediaStream* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_media_file_new_for_filename(_filename);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.media_file.MediaFile)(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new media file to play stream.
      
      If you want the resulting media to be seekable,
      the stream should implement the [gid.gio2.seekable.Seekable] interface.
  
      Params:
        stream = The stream to play
      Returns: a new [gid.gtk4.media_file.MediaFile]
  */
  static gid.gtk4.media_file.MediaFile newForInputStream(gid.gio2.input_stream.InputStream stream) nothrow
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_file_new_for_input_stream(stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.media_file.MediaFile)(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new new media file for the given resource.
      
      This is a utility function that converts the given resource
      to a [gid.gio2.file.File] and calls [gid.gtk4.media_file.MediaFile.newForFile].
  
      Params:
        resourcePath = resource path to open
      Returns: a new [gid.gtk4.media_file.MediaFile] playing resource_path
  */
  static gid.gtk4.media_file.MediaFile newForResource(string resourcePath) nothrow
  {
    GtkMediaStream* _cretval;
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_media_file_new_for_resource(_resourcePath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.media_file.MediaFile)(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  protected void vfuncClose()
  {
    auto _klass = cast(GtkMediaFileClass*)_vfuncClass;
    if (!_klass.close)
      return;

    _klass.close(cast(GtkMediaFile*)this._cPtr);
  }

  /** */
  protected void vfuncOpen()
  {
    auto _klass = cast(GtkMediaFileClass*)_vfuncClass;
    if (!_klass.open)
      return;

    _klass.open(cast(GtkMediaFile*)this._cPtr);
  }

  /**
      Resets the media file to be empty.
  */
  void clear() nothrow
  {
    gtk_media_file_clear(cast(GtkMediaFile*)this._cPtr);
  }

  /**
      Returns the file that self is currently playing from.
      
      When self is not playing or not playing from a file,
      null is returned.
      Returns: The currently playing file
  */
  gid.gio2.file.File getFile() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_media_file_get_file(cast(GtkMediaFile*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the stream that self is currently playing from.
      
      When self is not playing or not playing from a stream,
      null is returned.
      Returns: The currently playing stream
  */
  gid.gio2.input_stream.InputStream getInputStream() nothrow
  {
    GInputStream* _cretval;
    _cretval = gtk_media_file_get_input_stream(cast(GtkMediaFile*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the [gid.gtk4.media_file.MediaFile] to play the given file.
      
      If any file is still playing, stop playing it.
  
      Params:
        file = the file to play
  */
  void setFile(gid.gio2.file.File file = null) nothrow
  {
    gtk_media_file_set_file(cast(GtkMediaFile*)this._cPtr, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gtk4.media_file.MediaFile] to play the given file.
      
      This is a utility function that converts the given filename
      to a [gid.gio2.file.File] and calls [gid.gtk4.media_file.MediaFile.setFile].
  
      Params:
        filename = name of file to play
  */
  void setFilename(string filename = null) nothrow
  {
    const(char)* _filename = filename.toCString!(No.Malloc, Yes.Nullable);
    gtk_media_file_set_filename(cast(GtkMediaFile*)this._cPtr, _filename);
  }

  /**
      Sets the [gid.gtk4.media_file.MediaFile] to play the given stream.
      
      If anything is still playing, stop playing it.
      
      Full control about the stream is assumed for the duration of
      playback. The stream will not be closed.
  
      Params:
        stream = the stream to play from
  */
  void setInputStream(gid.gio2.input_stream.InputStream stream = null) nothrow
  {
    gtk_media_file_set_input_stream(cast(GtkMediaFile*)this._cPtr, stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gtk4.media_file.MediaFile] to play the given resource.
      
      This is a utility function that converts the given resource_path
      to a [gid.gio2.file.File] and calls [gid.gtk4.media_file.MediaFile.setFile].
  
      Params:
        resourcePath = path to resource to play
  */
  void setResource(string resourcePath = null) nothrow
  {
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, Yes.Nullable);
    gtk_media_file_set_resource(cast(GtkMediaFile*)this._cPtr, _resourcePath);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from MediaFile
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.media_file.MediaFile), T.stringof ~ " is not derived from gid.gtk4.media_file.MediaFile");

    gid.gtk4.media_stream.MediaStream._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gtk4.media_file.MediaFile))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpen", true)[0]) == gid.gtk4.media_file.MediaFile))
      _installVfunc(klass, "open");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkMediaFileClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) void _vfuncCloseTramp(GtkMediaFile* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk4.media_file.MediaFile)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkMediaFileClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(self);
            return;
          }

          try
          {
            _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.media_file.MediaFile.vfuncClose");
          }
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "open":
      {
        static extern(C) void _vfuncOpenTramp(GtkMediaFile* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk4.media_file.MediaFile)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkMediaFileClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.open)
              return (cast(typeof(&_vfuncOpenTramp))_klass.open)(self);
            return;
          }

          try
          {
            _obj.vfuncOpen();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.media_file.MediaFile.vfuncOpen");
          }
        }

        _klass.open = cast(typeof(_klass.open))&_vfuncOpenTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.media_file.MediaFile]
class MediaFileGidBuilderImpl(T) : gid.gtk4.media_stream.MediaStreamGidBuilderImpl!T
{


  /**
      Set `file` property.
      Params:
        propval = The file being played back or null if not playing a file.
      Returns: Builder instance for fluent chaining
  */
  T file(gid.gio2.file.File propval) nothrow
  {
    return setProperty("file", propval);
  }

  /**
      Set `inputStream` property.
      Params:
        propval = The stream being played back or null if not playing a stream.
          
          This is null when playing a file.
      Returns: Builder instance for fluent chaining
  */
  T inputStream(gid.gio2.input_stream.InputStream propval) nothrow
  {
    return setProperty("input-stream", propval);
  }
}

/// Fluent builder for [gid.gtk4.media_file.MediaFile]
final class MediaFileGidBuilder : MediaFileGidBuilderImpl!MediaFileGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MediaFile build() nothrow
  {
    return new MediaFile(cast(void*)createGObject(MediaFile._getGType), Yes.Take);
  }
}
