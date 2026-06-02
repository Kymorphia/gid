/// Module for [LocalFileSystemOptions] class
module arrow.local_file_system_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class LocalFileSystemOptions : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_local_file_system_options_get_type != &gidSymbolNotFound ? garrow_local_file_system_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LocalFileSystemOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.local_file_system_options.LocalFileSystemOptions]
      Returns: New builder object
  */
  static LocalFileSystemOptionsGidBuilder builder() nothrow
  {
    return new LocalFileSystemOptionsGidBuilder;
  }

  /**
      Get `useMmap` property.
      Returns: Whether open_input_stream and open_input_file return a mmap'ed file,
        or a regular one.
  */
  @property bool useMmap() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-mmap");
  }

  /**
      Set `useMmap` property.
      Params:
        propval = Whether open_input_stream and open_input_file return a mmap'ed file,
          or a regular one.
  */
  @property void useMmap(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-mmap", propval);
  }

  /** */
  this() nothrow
  {
    GArrowLocalFileSystemOptions* _cretval;
    _cretval = garrow_local_file_system_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.local_file_system_options.LocalFileSystemOptions]
class LocalFileSystemOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `useMmap` property.
      Params:
        propval = Whether open_input_stream and open_input_file return a mmap'ed file,
          or a regular one.
      Returns: Builder instance for fluent chaining
  */
  T useMmap(bool propval) nothrow
  {
    return setProperty("use-mmap", propval);
  }
}

/// Fluent builder for [arrow.local_file_system_options.LocalFileSystemOptions]
final class LocalFileSystemOptionsGidBuilder : LocalFileSystemOptionsGidBuilderImpl!LocalFileSystemOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LocalFileSystemOptions build() nothrow
  {
    return new LocalFileSystemOptions(cast(void*)createGObject(LocalFileSystemOptions._getGType), Yes.Take);
  }
}
