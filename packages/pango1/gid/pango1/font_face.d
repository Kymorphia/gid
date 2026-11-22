/// Module for [FontFace] class
module gid.pango1.font_face;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.font_description;
import gid.pango1.font_family;
import gid.pango1.types;

/**
    A [gid.pango1.font_face.FontFace] is used to represent a group of fonts with
    the same family, slant, weight, and width, but varying sizes.
*/
class FontFace : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())pango_font_face_get_type != &gidSymbolNotFound ? pango_font_face_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PangoFontFace";
  }

  /** Returns `this`, for use in `with` statements. */
  override FontFace self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.pango1.font_face.FontFace]
      Returns: New builder object
  */
  static FontFaceGidBuilder builder() nothrow
  {
    return new FontFaceGidBuilder;
  }

  /**
      Returns a font description that matches the face.
      
      The resulting font description will have the family, style,
      variant, weight and stretch of the face, but its size field
      will be unset.
      Returns: a newly-created [gid.pango1.font_description.FontDescription] structure
          holding the description of the face. Use [gid.pango1.font_description.FontDescription.free]
          to free the result.
  */
  gid.pango1.font_description.FontDescription describe() nothrow
  {
    PangoFontDescription* _cretval;
    _cretval = pango_font_face_describe(cast(PangoFontFace*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
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
  string getFaceName() nothrow
  {
    const(char)* _cretval;
    _cretval = pango_font_face_get_face_name(cast(PangoFontFace*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the [gid.pango1.font_family.FontFamily] that face belongs to.
      Returns: the [gid.pango1.font_family.FontFamily]
  */
  gid.pango1.font_family.FontFamily getFamily() nothrow
  {
    PangoFontFamily* _cretval;
    _cretval = pango_font_face_get_family(cast(PangoFontFace*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether a [gid.pango1.font_face.FontFace] is synthesized.
      
      This will be the case if the underlying font rendering engine
      creates this face from another face, by shearing, emboldening,
      lightening or modifying it in some other way.
      Returns: whether face is synthesized
  */
  bool isSynthesized() nothrow
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
            should be freed with [gid.glib2.global.gfree].
  */
  void listSizes(out int[] sizes) nothrow
  {
    int _nSizes;
    int* _sizes;
    pango_font_face_list_sizes(cast(PangoFontFace*)this._cPtr, &_sizes, &_nSizes);
    sizes.length = _nSizes;
    sizes[0 .. $] = (cast(int*)_sizes)[0 .. _nSizes];
    gFree(cast(void*)_sizes);
  }
}

/// Fluent builder implementation template for [gid.pango1.font_face.FontFace]
class FontFaceGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.pango1.font_face.FontFace]
final class FontFaceGidBuilder : FontFaceGidBuilderImpl!FontFaceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FontFace build() nothrow
  {
    return new FontFace(cast(void*)createGObject(FontFace._getGType), Yes.Take);
  }
}
