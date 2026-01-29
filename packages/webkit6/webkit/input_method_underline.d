/// Module for [InputMethodUnderline] class
module webkit.input_method_underline;

import gdk.rgba;
import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Range of text in an preedit string to be shown underlined.
*/
class InputMethodUnderline : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_input_method_underline_get_type != &gidSymbolNotFound ? webkit_input_method_underline_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InputMethodUnderline self()
  {
    return this;
  }

  /**
      Create a new #WebKitInputMethodUnderline for the given range in preedit string
  
      Params:
        startOffset = the start offset in preedit string
        endOffset = the end offset in preedit string
      Returns: A newly created #WebKitInputMethodUnderline
  */
  this(uint startOffset, uint endOffset)
  {
    WebKitInputMethodUnderline* _cretval;
    _cretval = webkit_input_method_underline_new(startOffset, endOffset);
    this(_cretval, Yes.Take);
  }

  /**
      Make a copy of the #WebKitInputMethodUnderline.
      Returns: A copy of passed in #WebKitInputMethodUnderline
  */
  webkit.input_method_underline.InputMethodUnderline copy()
  {
    WebKitInputMethodUnderline* _cretval;
    _cretval = webkit_input_method_underline_copy(cast(WebKitInputMethodUnderline*)this._cPtr);
    auto _retval = _cretval ? new webkit.input_method_underline.InputMethodUnderline(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the color of the underline.
      
      If rgba is null the foreground text color will be used
      for the underline too.
  
      Params:
        rgba = a #GdkRGBA or null
  */
  void setColor(gdk.rgba.RGBA rgba)
  {
    webkit_input_method_underline_set_color(cast(WebKitInputMethodUnderline*)this._cPtr, cast(const(GdkRGBA)*)&rgba);
  }
}
