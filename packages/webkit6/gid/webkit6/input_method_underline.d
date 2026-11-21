/// Module for [InputMethodUnderline] class
module gid.webkit6.input_method_underline;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.rgba;
import gid.gobject2.boxed;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    Range of text in an preedit string to be shown underlined.
*/
class InputMethodUnderline : gid.gobject2.boxed.BoxedWrap!(webkit_input_method_underline_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override InputMethodUnderline self() nothrow
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
  this(uint startOffset, uint endOffset) nothrow
  {
    WebKitInputMethodUnderline* _cretval;
    _cretval = webkit_input_method_underline_new(startOffset, endOffset);
    this(_cretval, Yes.Take);
  }

  /**
      Make a copy of the #WebKitInputMethodUnderline.
      Returns: A copy of passed in #WebKitInputMethodUnderline
  */
  gid.webkit6.input_method_underline.InputMethodUnderline copy() nothrow
  {
    WebKitInputMethodUnderline* _cretval;
    _cretval = webkit_input_method_underline_copy(cast(WebKitInputMethodUnderline*)this._cPtr);
    auto _retval = _cretval ? new gid.webkit6.input_method_underline.InputMethodUnderline(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the color of the underline.
      
      If rgba is null the foreground text color will be used
      for the underline too.
  
      Params:
        rgba = a #GdkRGBA or null
  */
  void setColor(gid.gdk4.rgba.RGBA* rgba = null) nothrow
  {
    webkit_input_method_underline_set_color(cast(WebKitInputMethodUnderline*)this._cPtr, cast(const(GdkRGBA)*)rgba);
  }
}
