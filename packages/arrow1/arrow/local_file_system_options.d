/// Module for [LocalFileSystemOptions] class
module arrow.local_file_system_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class LocalFileSystemOptions : gobject.object.ObjectWrap
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
    return cast(void function())garrow_local_file_system_options_get_type != &gidSymbolNotFound ? garrow_local_file_system_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LocalFileSystemOptions self()
  {
    return this;
  }

  /**
      Get `useMmap` property.
      Returns: Whether open_input_stream and open_input_file return a mmap'ed file,
        or a regular one.
  */
  @property bool useMmap()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-mmap");
  }

  /**
      Set `useMmap` property.
      Params:
        propval = Whether open_input_stream and open_input_file return a mmap'ed file,
          or a regular one.
  */
  @property void useMmap(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-mmap", propval);
  }

  /** */
  this()
  {
    GArrowLocalFileSystemOptions* _cretval;
    _cretval = garrow_local_file_system_options_new();
    this(_cretval, Yes.Take);
  }
}
