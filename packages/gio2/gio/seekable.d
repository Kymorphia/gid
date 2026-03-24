/// Module for [Seekable] interface
module gio.seekable;

public import gio.seekable_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.types;
import glib.error;
import glib.types;
import gobject.gid_builder;

/**
    [gio.seekable.Seekable] is implemented by streams (implementations of
    [gio.input_stream.InputStream] or [gio.output_stream.OutputStream]) that support seeking.
    
    Seekable streams largely fall into two categories: resizable and
    fixed-size.
    
    [gio.seekable.Seekable] on fixed-sized streams is approximately the same as POSIX
    [`lseek()`](man:lseek(2)) on a block device (for example: attempting to seek
    past the end of the device is an error).  Fixed streams typically cannot be
    truncated.
    
    [gio.seekable.Seekable] on resizable streams is approximately the same as POSIX
    [`lseek()`](man:lseek(2)) on a normal file.  Seeking past the end and writing
    data will usually cause the stream to resize by introducing zero bytes.
*/
interface Seekable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_seekable_get_type != &gidSymbolNotFound ? g_seekable_get_type() : cast(GType)0;
  }

  /**
      Tests if the stream supports the #GSeekableIface.
      Returns: true if seekable can be seeked. false otherwise.
  */
  bool canSeek();

  /**
      Tests if the length of the stream can be adjusted with
      [gio.seekable.Seekable.truncate].
      Returns: true if the stream can be truncated, false otherwise.
  */
  bool canTruncate();

  /**
      Seeks in the stream by the given offset, modified by type.
      
      Attempting to seek past the end of the stream will have different
      results depending on if the stream is fixed-sized or resizable.  If
      the stream is resizable then seeking past the end and then writing
      will result in zeros filling the empty space.  Seeking past the end
      of a resizable stream and reading will result in EOF.  Seeking past
      the end of a fixed-sized stream will fail.
      
      Any operation that would result in a negative offset will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        offset = a #goffset.
        type = a #GSeekType.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if successful. If an error
            has occurred, this function will return false and set error
            appropriately if present.
      Throws: [ErrorWrap]
  */
  bool seek(long offset, glib.types.SeekType type, gio.cancellable.Cancellable cancellable = null);

  /**
      Tells the current position within the stream.
      Returns: the (positive or zero) offset from the beginning of the
        buffer, zero if the target is not seekable.
  */
  long tell();

  /**
      Sets the length of the stream to offset. If the stream was previously
      larger than offset, the extra data is discarded. If the stream was
      previously shorter than offset, it is extended with NUL ('\0') bytes.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
  
      Params:
        offset = new length for seekable, in bytes.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if successful. If an error
            has occurred, this function will return false and set error
            appropriately if present.
      Throws: [ErrorWrap]
  */
  bool truncate(long offset, gio.cancellable.Cancellable cancellable = null);
}

interface SeekableGidBuilderImpl(T)
{
}
