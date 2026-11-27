/// Module for [FontFamily] class
module gid.pango1.font_family;

public import gid.core.basictypes;
import gid.core.utils;
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
@gidGir("FontFamily", "FontFamilyClass")
class FontFamily : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetFace` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.pango1.font_face.FontFace vfuncGetFace(string name = null)
  {
    auto _klass = cast(PangoFontFamilyClass*)_vfuncClass;
    if (!_klass.getFace)
      return typeof(return).init;

    PangoFontFace* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = _klass.getFace(cast(PangoFontFamily*)this._cPtr, _name);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetName` to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  protected string vfuncGetName()
  {
    auto _klass = cast(PangoFontFamilyClass*)_vfuncClass;
    if (!_klass.getName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getName(cast(PangoFontFamily*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsMonospace` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncIsMonospace()
  {
    auto _klass = cast(PangoFontFamilyClass*)_vfuncClass;
    if (!_klass.isMonospace)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isMonospace(cast(PangoFontFamily*)this._cPtr);
    return _retval;
  }

  /**
      A variable font is a font which has axes that can be modified to
      produce different faces.
      
      Such axes are also known as _variations_; see
      [gid.pango1.font_description.FontDescription.setVariations] for more information.
      Returns: true if the family is variable
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsVariable` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncIsVariable()
  {
    auto _klass = cast(PangoFontFamilyClass*)_vfuncClass;
    if (!_klass.isVariable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isVariable(cast(PangoFontFamily*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncListFaces` to chain up from an override.
      Overriding it from D is not supported (Out array parameter 'faces' in callback with ownership 'Container' is not supported).
  */
  protected void vfuncListFaces(out gid.pango1.font_face.FontFace[] faces)
  {
    auto _klass = cast(PangoFontFamilyClass*)_vfuncClass;
    if (!_klass.listFaces)
      return;

    int _nFaces;
    PangoFontFace** _faces;
    _klass.listFaces(cast(PangoFontFamily*)this._cPtr, &_faces, &_nFaces);
    faces.length = _nFaces;
    foreach (i; 0 .. _nFaces)
      faces[i] = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_face.FontFace)(_faces[i], No.Take);
    gFree(cast(void*)_faces);
  }

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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from FontFamily
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.pango1.font_family.FontFamily), T.stringof ~ " is not derived from gid.pango1.font_family.FontFamily");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetFace", true)[0]) == gid.pango1.font_family.FontFamily))
      _installVfunc(klass, "get_face");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetName", true)[0]) == gid.pango1.font_family.FontFamily))
      static assert(0, "Overriding gid.pango1.font_family.FontFamily.vfuncGetName is not supported: callback string return value with transfer none is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsMonospace", true)[0]) == gid.pango1.font_family.FontFamily))
      _installVfunc(klass, "is_monospace");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsVariable", true)[0]) == gid.pango1.font_family.FontFamily))
      _installVfunc(klass, "is_variable");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncListFaces", true)[0]) == gid.pango1.font_family.FontFamily))
      static assert(0, "Overriding gid.pango1.font_family.FontFamily.vfuncListFaces is not supported: Out array parameter 'faces' in callback with ownership 'Container' is not supported");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(PangoFontFamilyClass*)klass;

    switch (vfunc)
    {
      case "get_face":
      {
        static extern(C) PangoFontFace* _vfuncGetFaceTramp(PangoFontFamily* family, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.font_family.FontFamily)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)family);
          if (!_obj)
          {
            auto _klass = cast(PangoFontFamilyClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)family);
            if (_klass.getFace)
              return (cast(typeof(&_vfuncGetFaceTramp))_klass.getFace)(family, name);
            return typeof(return).init;
          }

          gid.pango1.font_face.FontFace _dretval;
          string _name = name.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetFace(_name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_family.FontFamily.vfuncGetFace");
          }
          auto _retval = _dretval ? cast(PangoFontFace*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getFace = cast(typeof(_klass.getFace))&_vfuncGetFaceTramp;
        break;
      }
      case "is_monospace":
      {
        static extern(C) gboolean _vfuncIsMonospaceTramp(PangoFontFamily* family) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.font_family.FontFamily)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)family);
          if (!_obj)
          {
            auto _klass = cast(PangoFontFamilyClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)family);
            if (_klass.isMonospace)
              return (cast(typeof(&_vfuncIsMonospaceTramp))_klass.isMonospace)(family);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsMonospace();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_family.FontFamily.vfuncIsMonospace");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isMonospace = cast(typeof(_klass.isMonospace))&_vfuncIsMonospaceTramp;
        break;
      }
      case "is_variable":
      {
        static extern(C) gboolean _vfuncIsVariableTramp(PangoFontFamily* family) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.font_family.FontFamily)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)family);
          if (!_obj)
          {
            auto _klass = cast(PangoFontFamilyClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)family);
            if (_klass.isVariable)
              return (cast(typeof(&_vfuncIsVariableTramp))_klass.isVariable)(family);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsVariable();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_family.FontFamily.vfuncIsVariable");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isVariable = cast(typeof(_klass.isVariable))&_vfuncIsVariableTramp;
        break;
      }
      default:
      break;
    }
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
