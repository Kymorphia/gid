/// Module for [FontFamily] class
module gid.pango1.font_family;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.font_face;
import gid.pango1.types;

/**
    A [gid.pango1.font_family.FontFamily] is used to represent a family of related
    font faces.
    
    The font faces in a family share a common design, but differ in
    slant, weight, width or other aspects.
*/
class FontFamily : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel
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
    return cast(void function())pango_font_family_get_type != &gidSymbolNotFound ? pango_font_family_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PangoFontFamily";
  }

  /** Returns `this`, for use in `with` statements. */
  override FontFamily self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.pango1.font_family.FontFamily]
      Returns: New builder object
  */
  static FontFamilyGidBuilder builder() nothrow
  {
    return new FontFamilyGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of items contained in this list.
  */
  @property gid.gobject2.types.GType itemType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items contained in this list.
  */
  @property uint nItems() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  /**
      Get `name` property.
      Returns: The name of the family
  */
  @property string name() nothrow
  {
    return getName();
  }

  mixin ListModelT!();

  /**
      Gets the [gid.pango1.font_face.FontFace] of family with the given name.
  
      Params:
        name = the name of a face. If the name is null,
            the family's default face (fontconfig calls it "Regular")
            will be returned.
      Returns: the [gid.pango1.font_face.FontFace],
          or null if no face with the given name exists.
  */
  gid.pango1.font_face.FontFace getFace(string name = null) nothrow
  {
    PangoFontFace* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = pango_font_family_get_face(cast(PangoFontFamily*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_face.FontFace)(cast(PangoFontFace*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the family.
      
      The name is unique among all fonts for the font backend and can
      be used in a [gid.pango1.font_description.FontDescription] to specify that a face from
      this family is desired.
      Returns: the name of the family. This string is owned
          by the family object and must not be modified or freed.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = pango_font_family_get_name(cast(PangoFontFamily*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      A monospace font is a font designed for text display where the the
      characters form a regular grid.
      
      For Western languages this would
      mean that the advance width of all characters are the same, but
      this categorization also includes Asian fonts which include
      double-width characters: characters that occupy two grid cells.
      [gid.glib2.global.unicharIswide] returns a result that indicates whether a
      character is typically double-width in a monospace font.
      
      The best way to find out the grid-cell size is to call
      [gid.pango1.font_metrics.FontMetrics.getApproximateDigitWidth], since the
      results of [gid.pango1.font_metrics.FontMetrics.getApproximateCharWidth] may
      be affected by double-width characters.
      Returns: true if the family is monospace.
  */
  bool isMonospace() nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_font_family_is_monospace(cast(PangoFontFamily*)this._cPtr);
    return _retval;
  }

  /**
      A variable font is a font which has axes that can be modified to
      produce different faces.
      
      Such axes are also known as _variations_; see
      [gid.pango1.font_description.FontDescription.setVariations] for more information.
      Returns: true if the family is variable
  */
  bool isVariable() nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_font_family_is_variable(cast(PangoFontFamily*)this._cPtr);
    return _retval;
  }

  /**
      Lists the different font faces that make up family.
      
      The faces in a family share a common design, but differ in slant, weight,
      width and other aspects.
      
      Note that the returned faces are not in any particular order, and
      multiple faces may have the same name or characteristics.
      
      [gid.pango1.font_family.FontFamily] also implemented the [gid.gio2.list_model.ListModel] interface
      for enumerating faces.
  
      Params:
        faces = location to store an array of pointers to [gid.pango1.font_face.FontFace] objects,
            or null. This array should be freed with [gid.glib2.global.gfree] when it is no
            longer needed.
  */
  void listFaces(out gid.pango1.font_face.FontFace[] faces) nothrow
  {
    int _nFaces;
    PangoFontFace** _faces;
    pango_font_family_list_faces(cast(PangoFontFamily*)this._cPtr, &_faces, &_nFaces);
    faces.length = _nFaces;
    foreach (i; 0 .. _nFaces)
      faces[i] = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_face.FontFace)(_faces[i], No.Take);
    gFree(cast(void*)_faces);
  }
}

/// Fluent builder implementation template for [gid.pango1.font_family.FontFamily]
class FontFamilyGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
}

/// Fluent builder for [gid.pango1.font_family.FontFamily]
final class FontFamilyGidBuilder : FontFamilyGidBuilderImpl!FontFamilyGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FontFamily build() nothrow
  {
    return new FontFamily(cast(void*)createGObject(FontFamily._getGType), Yes.Take);
  }
}
