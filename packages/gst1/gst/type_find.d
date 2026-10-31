/// Module for [TypeFind] class
module gst.type_find;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.plugin;
import gst.types;

/**
    The following functions allow you to detect the media type of an unknown
    stream.
*/
class TypeFind : gobject.boxed.Boxed
{

  /**
      Create a `type_find.TypeFind` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!GstTypeFind(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_type_find_get_type != &gidSymbolNotFound ? gst_type_find_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TypeFind self() nothrow
  {
    return this;
  }

  /** Function alias for field `peekFunc` */
  alias PeekFuncFuncType = extern(C) const(ubyte)* function(void* data, long offset, uint size);

  /**
      Get `peekFunc` field.
      Returns: Method to peek data.
  */
  @property PeekFuncFuncType peekFunc() nothrow
  {
    return (cast(GstTypeFind*)this._cPtr).peekFunc;
  }

  /** Function alias for field `suggestFunc` */
  alias SuggestFuncFuncType = extern(C) void function(void* data, uint probability, GstCaps* caps);

  /**
      Get `suggestFunc` field.
      Returns: Method to suggest #GstCaps with a given probability.
  */
  @property SuggestFuncFuncType suggestFunc() nothrow
  {
    return (cast(GstTypeFind*)this._cPtr).suggestFunc;
  }

  /** Function alias for field `getLengthFunc` */
  alias GetLengthFuncFuncType = extern(C) ulong function(void* data);

  /**
      Get `getLengthFunc` field.
      Returns: Returns the length of current data.
  */
  @property GetLengthFuncFuncType getLengthFunc() nothrow
  {
    return (cast(GstTypeFind*)this._cPtr).getLengthFunc;
  }

  /**
      Get the length of the data stream.
      Returns: The length of the data stream, or 0 if it is not available.
  */
  ulong getLength() nothrow
  {
    ulong _retval;
    _retval = gst_type_find_get_length(cast(GstTypeFind*)this._cPtr);
    return _retval;
  }

  /**
      If a #GstTypeFindFunction calls this function it suggests the caps with the
      given probability. A #GstTypeFindFunction may supply different suggestions
      in one call.
      It is up to the caller of the #GstTypeFindFunction to interpret these values.
  
      Params:
        probability = The probability in percent that the suggestion is right
        caps = The fixed #GstCaps to suggest
  */
  void suggest(uint probability, gst.caps.Caps caps) nothrow
  {
    gst_type_find_suggest(cast(GstTypeFind*)this._cPtr, probability, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  }

  /**
      If a #GstTypeFindFunction calls this function it suggests caps of the
      given media_type with the given probability.
      
      This function is similar to [gst.type_find.TypeFind.suggestSimple], but uses
      a #GstCaps with no fields.
  
      Params:
        probability = The probability in percent that the suggestion is right
        mediaType = the media type of the suggested caps
  */
  void suggestEmptySimple(uint probability, string mediaType) nothrow
  {
    const(char)* _mediaType = mediaType.toCString!(No.Malloc, No.Nullable);
    gst_type_find_suggest_empty_simple(cast(GstTypeFind*)this._cPtr, probability, _mediaType);
  }

  /**
      Registers a new typefind function to be used for typefinding. After
      registering this function will be available for typefinding.
      This function is typically called during an element's plugin initialization.
  
      Params:
        plugin = A #GstPlugin, or null for a static typefind function
        name = The name for registering
        rank = The rank (or importance) of this typefind function
        func = The #GstTypeFindFunction to use
        extensions = Optional comma-separated list of extensions
              that could belong to this type
        possibleCaps = Optionally the caps that could be returned when typefinding
                          succeeds
      Returns: true on success, false otherwise
  */
  static bool register(gst.plugin.Plugin plugin, string name, uint rank, gst.types.TypeFindFunction func, string extensions = null, gst.caps.Caps possibleCaps = null) nothrow
  {
    extern(C) void _funcCallback(GstTypeFind* find, void* userData) nothrow
    {
      auto _dlg = cast(gst.types.TypeFindFunction*)userData;

      try
      {
        (*_dlg)(find ? new gst.type_find.TypeFind(cast(void*)find, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gst.types.TypeFindFunction");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _extensions = extensions.toCString!(No.Malloc, Yes.Nullable);
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _retval = cast(bool)gst_type_find_register(plugin ? cast(GstPlugin*)plugin._cPtr(No.Dup) : null, _name, rank, _funcCB, _extensions, possibleCaps ? cast(GstCaps*)possibleCaps._cPtr(No.Dup) : null, _func, _funcDestroyCB);
    return _retval;
  }
}
