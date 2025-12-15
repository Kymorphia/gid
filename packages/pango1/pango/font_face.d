/// Module for [FontFace] class
module pango.font_face;

import gid.gid;
import gobject.object;
import pango.c.functions;
import pango.c.types;
import pango.font_description;
import pango.font_family;
import pango.types;

/**
    A [pango.font_face.FontFace] is used to represent a group of fonts with
    the same family, slant, weight, and width, but varying sizes.
*/
class FontFace : gobject.object.ObjectWrap
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
    return cast(void function())pango_font_face_get_type != &gidSymbolNotFound ? pango_font_face_get_type() : cast(GType)0;
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
      Returns a font description that matches the face.
      
      The resulting font description will have the family, style,
      variant, weight and stretch of the face, but its size field
      will be unset.
      Returns: a newly-created [pango.font_description.FontDescription] structure
          holding the description of the face. Use [pango.font_description.FontDescription.free]
          to free the result.
  */
  pango.font_description.FontDescription describe()
  {
    PangoFontDescription* _cretval;
    _cretval = pango_font_face_describe(cast(PangoFontFace*)this._cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a name representing the style of this face.
      
      Note that a font family may contain multiple faces
      with the same name (e.g. a variable and a non-variable
      face for the same style).
      Returns: the face name for the face. This string is
          owned by the face object and must not be modified or freed.
  */
  string getFaceName()
  {
    const(char)* _cretval;
    _cretval = pango_font_face_get_face_name(cast(PangoFontFace*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the [pango.font_family.FontFamily] that face belongs to.
      Returns: the [pango.font_family.FontFamily]
  */
  pango.font_family.FontFamily getFamily()
  {
    PangoFontFamily* _cretval;
    _cretval = pango_font_face_get_family(cast(PangoFontFace*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether a [pango.font_face.FontFace] is synthesized.
      
      This will be the case if the underlying font rendering engine
      creates this face from another face, by shearing, emboldening,
      lightening or modifying it in some other way.
      Returns: whether face is synthesized
  */
  bool isSynthesized()
  {
    bool _retval;
    _retval = cast(bool)pango_font_face_is_synthesized(cast(PangoFontFace*)this._cPtr);
    return _retval;
  }

  /**
      List the available sizes for a font.
      
      This is only applicable to bitmap fonts. For scalable fonts, stores
      null at the location pointed to by sizes and 0 at the location pointed
      to by n_sizes. The sizes returned are in Pango units and are sorted
      in ascending order.
  
      Params:
        sizes = location to store a pointer to an array of int. This array
            should be freed with [glib.global.gfree].
  */
  void listSizes(out int[] sizes)
  {
    int _nSizes;
    int* _sizes;
    pango_font_face_list_sizes(cast(PangoFontFace*)this._cPtr, &_sizes, &_nSizes);
    sizes.length = _nSizes;
    sizes[0 .. $] = (cast(int*)_sizes)[0 .. _nSizes];
    gFree(cast(void*)_sizes);
  }
}
