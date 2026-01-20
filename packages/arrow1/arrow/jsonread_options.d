/// Module for [JSONReadOptions] class
module arrow.jsonread_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.schema;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class JSONReadOptions : gobject.object.ObjectWrap
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
    return cast(void function())garrow_json_read_options_get_type != &gidSymbolNotFound ? garrow_json_read_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override JSONReadOptions self()
  {
    return this;
  }

  /**
      Get `allowNewlinesInValues` property.
      Returns: Whether objects may be printed across multiple lines (for example pretty printed).
        if false, input must end with an empty line.
  */
  @property bool allowNewlinesInValues()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-newlines-in-values");
  }

  /**
      Set `allowNewlinesInValues` property.
      Params:
        propval = Whether objects may be printed across multiple lines (for example pretty printed).
          if false, input must end with an empty line.
  */
  @property void allowNewlinesInValues(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-newlines-in-values", propval);
  }

  /**
      Get `blockSize` property.
      Returns: Block size we request from the IO layer; also determines the size
        of chunks when #GArrowJSONReadOptions:use-threads is true.
  */
  @property int blockSize()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("block-size");
  }

  /**
      Set `blockSize` property.
      Params:
        propval = Block size we request from the IO layer; also determines the size
          of chunks when #GArrowJSONReadOptions:use-threads is true.
  */
  @property void blockSize(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("block-size", propval);
  }

  /**
      Get `schema` property.
      Returns: Schema for passing custom conversion rules.
  */
  @property arrow.schema.Schema schema()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.schema.Schema)("schema");
  }

  /**
      Set `schema` property.
      Params:
        propval = Schema for passing custom conversion rules.
  */
  @property void schema(arrow.schema.Schema propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.schema.Schema)("schema", propval);
  }

  /**
      Get `unexpectedFieldBehavior` property.
      Returns: How to parse handle fields outside the explicit schema.
  */
  @property arrow.types.JSONReadUnexpectedFieldBehavior unexpectedFieldBehavior()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.JSONReadUnexpectedFieldBehavior)("unexpected-field-behavior");
  }

  /**
      Set `unexpectedFieldBehavior` property.
      Params:
        propval = How to parse handle fields outside the explicit schema.
  */
  @property void unexpectedFieldBehavior(arrow.types.JSONReadUnexpectedFieldBehavior propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.JSONReadUnexpectedFieldBehavior)("unexpected-field-behavior", propval);
  }

  /**
      Get `useThreads` property.
      Returns: Whether to use the global CPU thread pool.
  */
  @property bool useThreads()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-threads");
  }

  /**
      Set `useThreads` property.
      Params:
        propval = Whether to use the global CPU thread pool.
  */
  @property void useThreads(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-threads", propval);
  }

  /** */
  this()
  {
    GArrowJSONReadOptions* _cretval;
    _cretval = garrow_json_read_options_new();
    this(_cretval, Yes.Take);
  }
}
