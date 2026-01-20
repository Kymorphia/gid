/// Module for [TypeFind] struct
module gst.type_find;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.plugin;
import gst.types;

/**
    The following functions allow you to detect the media type of an unknown
    stream.
*/
struct TypeFind
{
  /**
      Method to peek data.
  */
  extern(C) const(ubyte)* function(void* data, long offset, uint size) peekFunc;

  /**
      Method to suggest #GstCaps with a given probability.
  */
  extern(C) void function(void* data, uint probability, GstCaps* caps) suggestFunc;

  /**
      The data used by the caller of the typefinding function.
  */
  void* data;

  /**
      Returns the length of current data.
  */
  extern(C) ulong function(void* data) getLengthFunc;

  /** */
  void*[4] GstReserved;

  /**
      Get the length of the data stream.
      Returns: The length of the data stream, or 0 if it is not available.
  */
  ulong getLength()
  {
    ulong _retval;
    _retval = gst_type_find_get_length(cast(GstTypeFind*)&this);
    return _retval;
  }

  /**
      Returns the size bytes of the stream to identify beginning at offset. If
      offset is a positive number, the offset is relative to the beginning of the
      stream, if offset is a negative number the offset is relative to the end of
      the stream. The returned memory is valid until the typefinding function
      returns and must not be freed.
  
      Params:
        offset = The offset
        size = The number of bytes to return
      Returns: the
            requested data, or null if that data is not available.
  */
  const(ubyte)* peek(long offset, uint size)
  {
    auto _retval = gst_type_find_peek(cast(GstTypeFind*)&this, offset, size);
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
  void suggest(uint probability, gst.caps.Caps caps)
  {
    gst_type_find_suggest(cast(GstTypeFind*)&this, probability, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
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
  void suggestEmptySimple(uint probability, string mediaType)
  {
    const(char)* _mediaType = mediaType.toCString(No.Alloc);
    gst_type_find_suggest_empty_simple(cast(GstTypeFind*)&this, probability, _mediaType);
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
  static bool register(gst.plugin.Plugin plugin, string name, uint rank, gst.types.TypeFindFunction func, string extensions = null, gst.caps.Caps possibleCaps = null)
  {
    extern(C) void _funcCallback(GstTypeFind* find, void* userData)
    {
      auto _dlg = cast(gst.types.TypeFindFunction*)userData;

      (*_dlg)(*cast(gst.type_find.TypeFind*)find);
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _extensions = extensions.toCString(No.Alloc);
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _retval = cast(bool)gst_type_find_register(plugin ? cast(GstPlugin*)plugin._cPtr(No.Dup) : null, _name, rank, _funcCB, _extensions, possibleCaps ? cast(GstCaps*)possibleCaps._cPtr(No.Dup) : null, _func, _funcDestroyCB);
    return _retval;
  }
}
