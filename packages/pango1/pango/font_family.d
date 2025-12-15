/// Module for [FontFamily] class
module pango.font_family;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gobject.types;
import pango.c.functions;
import pango.c.types;
import pango.font_face;
import pango.types;

/**
    A [pango.font_family.FontFamily] is used to represent a family of related
    font faces.
    
    The font faces in a family share a common design, but differ in
    slant, weight, width or other aspects.
*/
class FontFamily : gobject.object.ObjectWrap, gio.list_model.ListModel
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
    return cast(void function())pango_font_family_get_type != &gidSymbolNotFound ? pango_font_family_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontFamily self()
  {
    return this;
  }

  /**
      Get `itemType` property.
      Returns: The type of items contained in this list.
  */
  @property gobject.types.GType itemType()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items contained in this list.
  */
  @property uint nItems()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  /**
      Get `name` property.
      Returns: The name of the family
  */
  @property string name()
  {
    return getName();
  }

  mixin ListModelT!();

  /**
      Gets the [pango.font_face.FontFace] of family with the given name.
  
      Params:
        name = the name of a face. If the name is null,
            the family's default face (fontconfig calls it "Regular")
            will be returned.
      Returns: the [pango.font_face.FontFace],
          or null if no face with the given name exists.
  */
  pango.font_face.FontFace getFace(string name = null)
  {
    PangoFontFace* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = pango_font_family_get_face(cast(PangoFontFamily*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_face.FontFace)(cast(PangoFontFace*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the family.
      
      The name is unique among all fonts for the font backend and can
      be used in a [pango.font_description.FontDescription] to specify that a face from
      this family is desired.
      Returns: the name of the family. This string is owned
          by the family object and must not be modified or freed.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = pango_font_family_get_name(cast(PangoFontFamily*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      A monospace font is a font designed for text display where the the
      characters form a regular grid.
      
      For Western languages this would
      mean that the advance width of all characters are the same, but
      this categorization also includes Asian fonts which include
      double-width characters: characters that occupy two grid cells.
      [glib.global.unicharIswide] returns a result that indicates whether a
      character is typically double-width in a monospace font.
      
      The best way to find out the grid-cell size is to call
      [pango.font_metrics.FontMetrics.getApproximateDigitWidth], since the
      results of [pango.font_metrics.FontMetrics.getApproximateCharWidth] may
      be affected by double-width characters.
      Returns: true if the family is monospace.
  */
  bool isMonospace()
  {
    bool _retval;
    _retval = cast(bool)pango_font_family_is_monospace(cast(PangoFontFamily*)this._cPtr);
    return _retval;
  }

  /**
      A variable font is a font which has axes that can be modified to
      produce different faces.
      
      Such axes are also known as _variations_; see
      [pango.font_description.FontDescription.setVariations] for more information.
      Returns: true if the family is variable
  */
  bool isVariable()
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
      
      [pango.font_family.FontFamily] also implemented the [gio.list_model.ListModel] interface
      for enumerating faces.
  
      Params:
        faces = location to store an array of pointers to [pango.font_face.FontFace] objects,
            or null. This array should be freed with [glib.global.gfree] when it is no
            longer needed.
  */
  void listFaces(out pango.font_face.FontFace[] faces)
  {
    int _nFaces;
    PangoFontFace** _faces;
    pango_font_family_list_faces(cast(PangoFontFamily*)this._cPtr, &_faces, &_nFaces);
    faces.length = _nFaces;
    foreach (i; 0 .. _nFaces)
      faces[i] = gobject.object.ObjectWrap._getDObject!(pango.font_face.FontFace)(_faces[i], No.Take);
    gFree(cast(void*)_faces);
  }
}
