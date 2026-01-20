/// Module for [FontFace] class
module cairo.font_face;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A #cairo_font_face_t specifies all aspects of a font other
    than the size or font matrix (a font matrix is used to distort
    a font by shearing it or scaling it unequally in the two
    directions) . A font face can be set on a #cairo_t by using
    [cairo.context.Context.setFontFace]; the size and font matrix are set with
    [cairo.context.Context.setFontSize] and [cairo.context.Context.setFontMatrix].
    
    There are various types of font faces, depending on the
    <firstterm>font backend</firstterm> they use. The type of a
    font face can be queried using [cairo.font_face.FontFace.getFontType].
    
    Memory management of #cairo_font_face_t is done with
    [cairo.font_face.FontFace.reference] and [cairo.font_face.FontFace.destroy].
*/
class FontFace : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_font_face_get_type != &gidSymbolNotFound ? cairo_gobject_font_face_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontFace self()
  {
    return this;
  }

  /**
      This function returns the type of the backend used to create
      a font face. See #cairo_font_type_t for available types.
      Returns: The type of font_face.
  */
  cairo.types.FontType getFontType()
  {
    cairo_font_type_t _cretval;
    _cretval = cairo_font_face_get_type(cast(cairo_font_face_t*)this._cPtr);
    cairo.types.FontType _retval = cast(cairo.types.FontType)_cretval;
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
  void* getUserData(cairo.types.UserDataKey key)
  {
    auto _retval = cairo_font_face_get_user_data(cast(cairo_font_face_t*)this._cPtr, &key);
    return _retval;
  }

  /**
      Checks whether an error has previously occurred for this
      font face
      Returns: [cairo.types.Status.Success] or another error such as
          [cairo.types.Status.NoMemory].
  */
  cairo.types.Status status()
  {
    cairo_status_t _cretval;
    _cretval = cairo_font_face_status(cast(cairo_font_face_t*)this._cPtr);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }
}
