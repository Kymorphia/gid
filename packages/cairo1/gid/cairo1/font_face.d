/// Module for [FontFace] class
module gid.cairo1.font_face;

public import gid.core.basictypes;
import gid.cairo1.c.functions;
import gid.cairo1.c.types;
import gid.cairo1.types;
import gid.core.gid;
import gid.gobject2.boxed;

/**
    A #cairo_font_face_t specifies all aspects of a font other
    than the size or font matrix (a font matrix is used to distort
    a font by shearing it or scaling it unequally in the two
    directions) . A font face can be set on a #cairo_t by using
    [gid.cairo1.context.Context.setFontFace]; the size and font matrix are set with
    [gid.cairo1.context.Context.setFontSize] and [gid.cairo1.context.Context.setFontMatrix].
    
    There are various types of font faces, depending on the
    <firstterm>font backend</firstterm> they use. The type of a
    font face can be queried using [gid.cairo1.font_face.FontFace.getFontType].
    
    Memory management of #cairo_font_face_t is done with
    [gid.cairo1.font_face.FontFace.reference] and [gid.cairo1.font_face.FontFace.destroy].
*/
class FontFace : gid.gobject2.boxed.BoxedWrap!(cairo_gobject_font_face_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override FontFace self() nothrow
  {
    return this;
  }

  /**
      This function returns the type of the backend used to create
      a font face. See #cairo_font_type_t for available types.
      Returns: The type of font_face.
  */
  gid.cairo1.types.FontType getFontType() nothrow
  {
    cairo_font_type_t _cretval;
    _cretval = cairo_font_face_get_type(cast(cairo_font_face_t*)this._cPtr);
    gid.cairo1.types.FontType _retval = cast(gid.cairo1.types.FontType)_cretval;
    return _retval;
  }

  /**
      Return user data previously attached to font_face using the specified
      key.  If no user data has been attached with the given key this
      function returns null.
  
      Params:
        key = the address of the #cairo_user_data_key_t the user data was
          attached to
      Returns: the user data previously attached or null.
  */
  void* getUserData(gid.cairo1.types.UserDataKey key) nothrow
  {
    auto _retval = cairo_font_face_get_user_data(cast(cairo_font_face_t*)this._cPtr, cast(const(cairo_user_data_key_t)*)&key);
    return _retval;
  }

  /**
      Checks whether an error has previously occurred for this
      font face
      Returns: [gid.cairo1.types.Status.Success] or another error such as
          [gid.cairo1.types.Status.NoMemory].
  */
  gid.cairo1.types.Status status() nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_font_face_status(cast(cairo_font_face_t*)this._cPtr);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }
}
