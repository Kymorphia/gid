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
@gidGir("FontFace", "FontFaceClass")
class FontFace : gid.gobject2.object.ObjectWrap
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDescribe` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.pango1.font_description.FontDescription vfuncDescribe()
  {
    auto _klass = cast(PangoFontFaceClass*)_vfuncClass;
    if (!_klass.describe)
      return typeof(return).init;

    PangoFontDescription* _cretval;
    _cretval = _klass.describe(cast(PangoFontFace*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetFaceName` to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  protected string vfuncGetFaceName()
  {
    auto _klass = cast(PangoFontFaceClass*)_vfuncClass;
    if (!_klass.getFaceName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getFaceName(cast(PangoFontFace*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the [gid.pango1.font_family.FontFamily] that face belongs to.
      Returns: the [gid.pango1.font_family.FontFamily]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetFamily` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.pango1.font_family.FontFamily vfuncGetFamily()
  {
    auto _klass = cast(PangoFontFaceClass*)_vfuncClass;
    if (!_klass.getFamily)
      return typeof(return).init;

    PangoFontFamily* _cretval;
    _cretval = _klass.getFamily(cast(PangoFontFace*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether a [gid.pango1.font_face.FontFace] is synthesized.
      
      This will be the case if the underlying font rendering engine
      creates this face from another face, by shearing, emboldening,
      lightening or modifying it in some other way.
      Returns: whether face is synthesized
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsSynthesized` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncIsSynthesized()
  {
    auto _klass = cast(PangoFontFaceClass*)_vfuncClass;
    if (!_klass.isSynthesized)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isSynthesized(cast(PangoFontFace*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncListSizes` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncListSizes(out int[] sizes)
  {
    auto _klass = cast(PangoFontFaceClass*)_vfuncClass;
    if (!_klass.listSizes)
      return;

    int _nSizes;
    int* _sizes;
    _klass.listSizes(cast(PangoFontFace*)this._cPtr, &_sizes, &_nSizes);
    sizes.length = _nSizes;
    sizes[0 .. $] = (cast(int*)_sizes)[0 .. _nSizes];
    gFree(cast(void*)_sizes);
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from FontFace
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.pango1.font_face.FontFace), T.stringof ~ " is not derived from gid.pango1.font_face.FontFace");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDescribe", true)[0]) == gid.pango1.font_face.FontFace))
      _installVfunc(klass, "describe");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetFaceName", true)[0]) == gid.pango1.font_face.FontFace))
      static assert(0, "Overriding gid.pango1.font_face.FontFace.vfuncGetFaceName is not supported: callback string return value with transfer none is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetFamily", true)[0]) == gid.pango1.font_face.FontFace))
      _installVfunc(klass, "get_family");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsSynthesized", true)[0]) == gid.pango1.font_face.FontFace))
      _installVfunc(klass, "is_synthesized");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncListSizes", true)[0]) == gid.pango1.font_face.FontFace))
      _installVfunc(klass, "list_sizes");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(PangoFontFaceClass*)klass;

    switch (vfunc)
    {
      case "describe":
      {
        static extern(C) PangoFontDescription* _vfuncDescribeTramp(PangoFontFace* face) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.pango1.font_face.FontFace)(cast(void*)face);
          if (!_obj)
          {
            auto _klass = cast(PangoFontFaceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)face);
            if (_klass.describe)
              return (cast(typeof(&_vfuncDescribeTramp))_klass.describe)(face);
            return typeof(return).init;
          }

          gid.pango1.font_description.FontDescription _dretval;

          try
          {
            _dretval = _obj.vfuncDescribe();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_face.FontFace.vfuncDescribe");
          }
          auto _retval = _dretval ? cast(PangoFontDescription*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.describe = cast(typeof(_klass.describe))&_vfuncDescribeTramp;
        break;
      }
      case "get_family":
      {
        static extern(C) PangoFontFamily* _vfuncGetFamilyTramp(PangoFontFace* face) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.pango1.font_face.FontFace)(cast(void*)face);
          if (!_obj)
          {
            auto _klass = cast(PangoFontFaceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)face);
            if (_klass.getFamily)
              return (cast(typeof(&_vfuncGetFamilyTramp))_klass.getFamily)(face);
            return typeof(return).init;
          }

          gid.pango1.font_family.FontFamily _dretval;

          try
          {
            _dretval = _obj.vfuncGetFamily();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_face.FontFace.vfuncGetFamily");
          }
          auto _retval = _dretval ? cast(PangoFontFamily*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getFamily = cast(typeof(_klass.getFamily))&_vfuncGetFamilyTramp;
        break;
      }
      case "is_synthesized":
      {
        static extern(C) gboolean _vfuncIsSynthesizedTramp(PangoFontFace* face) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.pango1.font_face.FontFace)(cast(void*)face);
          if (!_obj)
          {
            auto _klass = cast(PangoFontFaceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)face);
            if (_klass.isSynthesized)
              return (cast(typeof(&_vfuncIsSynthesizedTramp))_klass.isSynthesized)(face);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsSynthesized();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_face.FontFace.vfuncIsSynthesized");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isSynthesized = cast(typeof(_klass.isSynthesized))&_vfuncIsSynthesizedTramp;
        break;
      }
      case "list_sizes":
      {
        static extern(C) void _vfuncListSizesTramp(PangoFontFace* face, int** sizes, int* nSizes) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.pango1.font_face.FontFace)(cast(void*)face);
          if (!_obj)
          {
            auto _klass = cast(PangoFontFaceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)face);
            if (_klass.listSizes)
              return (cast(typeof(&_vfuncListSizesTramp))_klass.listSizes)(face, sizes, nSizes);
            return;
          }

          typeof(*sizes) _sizesNull;
          if (!sizes)
            sizes = &_sizesNull;

          int[] _sizes;

          try
          {
            _obj.vfuncListSizes(_sizes);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_face.FontFace.vfuncListSizes");
          }
          *nSizes = cast(typeof(*nSizes))_sizes.length;
          typeof(*sizes) _sizesC;
          if (_sizes.length > 0)
          {
            _sizesC = cast(typeof(_sizesC))gMalloc(_sizes.length * (*_sizesC).sizeof);
            _sizesC[0 .. _sizes.length] = _sizes[];
          }

          *sizes = _sizesC;

        }

        _klass.listSizes = cast(typeof(_klass.listSizes))&_vfuncListSizesTramp;
        break;
      }
      default:
      break;
    }
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
