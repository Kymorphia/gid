/// Module for [FontMap] class
module gid.pango1.font_map;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.context;
import gid.pango1.font;
import gid.pango1.font_description;
import gid.pango1.font_family;
import gid.pango1.fontset;
import gid.pango1.language;
import gid.pango1.types;

/**
    A [gid.pango1.font_map.FontMap] represents the set of fonts available for a
    particular rendering system.
    
    This is a virtual object with implementations being specific to
    particular rendering systems.
*/
class FontMap : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())pango_font_map_get_type != &gidSymbolNotFound ? pango_font_map_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PangoFontMap";
  }

  /** Returns `this`, for use in `with` statements. */
  override FontMap self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.pango1.font_map.FontMap]
      Returns: New builder object
  */
  static FontMapGidBuilder builder() nothrow
  {
    return new FontMapGidBuilder;
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

  mixin ListModelT!();

  /**
      Forces a change in the fontmap, which will cause any [gid.pango1.context.Context]
      using this fontmap to change.
      
      This function is only useful when implementing a new backend
      for Pango, something applications won't do. Backends should
      call this function if they have attached extra data to the
      fontmap and such data is changed.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncChanged()
  {
    auto _klass = cast(PangoFontMapClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(PangoFontMap*)this._cPtr);
  }

  /**
      Gets a font family by name.
  
      Params:
        name = a family name
      Returns: the [gid.pango1.font_family.FontFamily]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetFamily` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.pango1.font_family.FontFamily vfuncGetFamily(string name)
  {
    auto _klass = cast(PangoFontMapClass*)_vfuncClass;
    if (!_klass.getFamily)
      return typeof(return).init;

    PangoFontFamily* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getFamily(cast(PangoFontMap*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the current serial number of fontmap.
      
      The serial number is initialized to an small number larger than zero
      when a new fontmap is created and is increased whenever the fontmap
      is changed. It may wrap, but will never have the value 0. Since it can
      wrap, never compare it with "less than", always use "not equals".
      
      The fontmap can only be changed using backend-specific API, like changing
      fontmap resolution.
      
      This can be used to automatically detect changes to a [gid.pango1.font_map.FontMap],
      like in [gid.pango1.context.Context].
      Returns: The current serial number of fontmap.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetSerial` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected uint vfuncGetSerial()
  {
    auto _klass = cast(PangoFontMapClass*)_vfuncClass;
    if (!_klass.getSerial)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.getSerial(cast(PangoFontMap*)this._cPtr);
    return _retval;
  }

  /**
      List all families for a fontmap.
      
      Note that the returned families are not in any particular order.
      
      [gid.pango1.font_map.FontMap] also implemented the [gid.gio2.list_model.ListModel] interface
      for enumerating families.
  
      Params:
        families = location to
            store a pointer to an array of [gid.pango1.font_family.FontFamily] *.
            This array should be freed with [gid.glib2.global.gfree].
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncListFamilies` to chain up from an override.
      Overriding it from D is not supported (Out array parameter 'families' in callback with ownership 'Container' is not supported).
  */
  protected void vfuncListFamilies(out gid.pango1.font_family.FontFamily[] families)
  {
    auto _klass = cast(PangoFontMapClass*)_vfuncClass;
    if (!_klass.listFamilies)
      return;

    int _nFamilies;
    PangoFontFamily** _families;
    _klass.listFamilies(cast(PangoFontMap*)this._cPtr, &_families, &_nFamilies);
    families.length = _nFamilies;
    foreach (i; 0 .. _nFamilies)
      families[i] = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(_families[i], No.Take);
    gFree(cast(void*)_families);
  }

  /**
      Load the font in the fontmap that is the closest match for desc.
  
      Params:
        context = the [gid.pango1.context.Context] the font will be used with
        desc = a [gid.pango1.font_description.FontDescription] describing the font to load
      Returns: the newly allocated [gid.pango1.font.Font]
          loaded, or null if no font matched.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLoadFont` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.pango1.font.Font vfuncLoadFont(gid.pango1.context.Context context, gid.pango1.font_description.FontDescription desc)
  {
    auto _klass = cast(PangoFontMapClass*)_vfuncClass;
    if (!_klass.loadFont)
      return typeof(return).init;

    PangoFont* _cretval;
    _cretval = _klass.loadFont(cast(PangoFontMap*)this._cPtr, context ? cast(PangoContext*)context._cPtr(No.Dup) : null, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Load a set of fonts in the fontmap that can be used to render
      a font matching desc.
  
      Params:
        context = the [gid.pango1.context.Context] the font will be used with
        desc = a [gid.pango1.font_description.FontDescription] describing the font to load
        language = a [gid.pango1.language.Language] the fonts will be used for (modified in place, changes are seen by the caller)
      Returns: the newly allocated
          [gid.pango1.fontset.Fontset] loaded, or null if no font matched.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLoadFontset` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.pango1.fontset.Fontset vfuncLoadFontset(gid.pango1.context.Context context, gid.pango1.font_description.FontDescription desc, gid.pango1.language.Language language)
  {
    auto _klass = cast(PangoFontMapClass*)_vfuncClass;
    if (!_klass.loadFontset)
      return typeof(return).init;

    PangoFontset* _cretval;
    _cretval = _klass.loadFontset(cast(PangoFontMap*)this._cPtr, context ? cast(PangoContext*)context._cPtr(No.Dup) : null, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.fontset.Fontset)(cast(PangoFontset*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Loads a font file with one or more fonts into the [gid.pango1.font_map.FontMap].
      
      The added fonts will take precedence over preexisting
      fonts with the same name.
  
      Params:
        filename = Path to the font file
      Returns: True if the font file is successfully loaded
            into the fontmap, false if an error occurred.
      Throws: [ErrorWrap]
  */
  bool addFontFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)pango_font_map_add_font_file(cast(PangoFontMap*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Forces a change in the fontmap, which will cause any [gid.pango1.context.Context]
      using this fontmap to change.
      
      This function is only useful when implementing a new backend
      for Pango, something applications won't do. Backends should
      call this function if they have attached extra data to the
      fontmap and such data is changed.
  */
  void changed() nothrow
  {
    pango_font_map_changed(cast(PangoFontMap*)this._cPtr);
  }

  /**
      Creates a [gid.pango1.context.Context] connected to fontmap.
      
      This is equivalent to [gid.pango1.context.Context.new_] followed by
      [gid.pango1.context.Context.setFontMap].
      
      If you are using Pango as part of a higher-level system,
      that system may have it's own way of create a [gid.pango1.context.Context].
      For instance, the GTK toolkit has, among others,
      [gid.gtk4.widget.Widget.getPangoContext]. Use those instead.
      Returns: the newly allocated [gid.pango1.context.Context],
          which should be freed with [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.pango1.context.Context createContext() nothrow
  {
    PangoContext* _cretval;
    _cretval = pango_font_map_create_context(cast(PangoFontMap*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a font family by name.
  
      Params:
        name = a family name
      Returns: the [gid.pango1.font_family.FontFamily]
  */
  gid.pango1.font_family.FontFamily getFamily(string name) nothrow
  {
    PangoFontFamily* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = pango_font_map_get_family(cast(PangoFontMap*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the current serial number of fontmap.
      
      The serial number is initialized to an small number larger than zero
      when a new fontmap is created and is increased whenever the fontmap
      is changed. It may wrap, but will never have the value 0. Since it can
      wrap, never compare it with "less than", always use "not equals".
      
      The fontmap can only be changed using backend-specific API, like changing
      fontmap resolution.
      
      This can be used to automatically detect changes to a [gid.pango1.font_map.FontMap],
      like in [gid.pango1.context.Context].
      Returns: The current serial number of fontmap.
  */
  uint getSerial() nothrow
  {
    uint _retval;
    _retval = pango_font_map_get_serial(cast(PangoFontMap*)this._cPtr);
    return _retval;
  }

  /**
      List all families for a fontmap.
      
      Note that the returned families are not in any particular order.
      
      [gid.pango1.font_map.FontMap] also implemented the [gid.gio2.list_model.ListModel] interface
      for enumerating families.
  
      Params:
        families = location to
            store a pointer to an array of [gid.pango1.font_family.FontFamily] *.
            This array should be freed with [gid.glib2.global.gfree].
  */
  void listFamilies(out gid.pango1.font_family.FontFamily[] families) nothrow
  {
    int _nFamilies;
    PangoFontFamily** _families;
    pango_font_map_list_families(cast(PangoFontMap*)this._cPtr, &_families, &_nFamilies);
    families.length = _nFamilies;
    foreach (i; 0 .. _nFamilies)
      families[i] = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(_families[i], No.Take);
    gFree(cast(void*)_families);
  }

  /**
      Load the font in the fontmap that is the closest match for desc.
  
      Params:
        context = the [gid.pango1.context.Context] the font will be used with
        desc = a [gid.pango1.font_description.FontDescription] describing the font to load
      Returns: the newly allocated [gid.pango1.font.Font]
          loaded, or null if no font matched.
  */
  gid.pango1.font.Font loadFont(gid.pango1.context.Context context, gid.pango1.font_description.FontDescription desc) nothrow
  {
    PangoFont* _cretval;
    _cretval = pango_font_map_load_font(cast(PangoFontMap*)this._cPtr, context ? cast(PangoContext*)context._cPtr(No.Dup) : null, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Load a set of fonts in the fontmap that can be used to render
      a font matching desc.
  
      Params:
        context = the [gid.pango1.context.Context] the font will be used with
        desc = a [gid.pango1.font_description.FontDescription] describing the font to load
        language = a [gid.pango1.language.Language] the fonts will be used for
      Returns: the newly allocated
          [gid.pango1.fontset.Fontset] loaded, or null if no font matched.
  */
  gid.pango1.fontset.Fontset loadFontset(gid.pango1.context.Context context, gid.pango1.font_description.FontDescription desc, gid.pango1.language.Language language) nothrow
  {
    PangoFontset* _cretval;
    _cretval = pango_font_map_load_fontset(cast(PangoFontMap*)this._cPtr, context ? cast(PangoContext*)context._cPtr(No.Dup) : null, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.fontset.Fontset)(cast(PangoFontset*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns a new font that is like font, except that it is scaled
      by scale, its backend-dependent configuration (e.g. cairo font options)
      is replaced by the one in context, and its variations are replaced
      by variations.
      
      Note that the scaling here is meant to be linear, so this
      scaling can be used to render a font on a hi-dpi display
      without changing its optical size.
  
      Params:
        font = a font in fontmap
        scale = the scale factor to apply
        context = a [gid.pango1.context.Context]
        variations = font variations to use
      Returns: the modified font
  */
  gid.pango1.font.Font reloadFont(gid.pango1.font.Font font, double scale, gid.pango1.context.Context context = null, string variations = null) nothrow
  {
    PangoFont* _cretval;
    const(char)* _variations = variations.toCString!(No.Malloc, Yes.Nullable);
    _cretval = pango_font_map_reload_font(cast(PangoFontMap*)this._cPtr, font ? cast(PangoFont*)font._cPtr(No.Dup) : null, scale, context ? cast(PangoContext*)context._cPtr(No.Dup) : null, _variations);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from FontMap
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.pango1.font_map.FontMap), T.stringof ~ " is not derived from gid.pango1.font_map.FontMap");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.pango1.font_map.FontMap))
      _installVfunc(klass, "changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetFamily", true)[0]) == gid.pango1.font_map.FontMap))
      _installVfunc(klass, "get_family");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetSerial", true)[0]) == gid.pango1.font_map.FontMap))
      _installVfunc(klass, "get_serial");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncListFamilies", true)[0]) == gid.pango1.font_map.FontMap))
      static assert(0, "Overriding gid.pango1.font_map.FontMap.vfuncListFamilies is not supported: Out array parameter 'families' in callback with ownership 'Container' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLoadFont", true)[0]) == gid.pango1.font_map.FontMap))
      _installVfunc(klass, "load_font");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLoadFontset", true)[0]) == gid.pango1.font_map.FontMap))
      _installVfunc(klass, "load_fontset");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(PangoFontMapClass*)klass;

    switch (vfunc)
    {
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(PangoFontMap* fontmap) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.font_map.FontMap)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontmap);
          if (!_obj)
          {
            auto _klass = cast(PangoFontMapClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontmap);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(fontmap);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_map.FontMap.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      case "get_family":
      {
        static extern(C) PangoFontFamily* _vfuncGetFamilyTramp(PangoFontMap* fontmap, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.font_map.FontMap)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontmap);
          if (!_obj)
          {
            auto _klass = cast(PangoFontMapClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontmap);
            if (_klass.getFamily)
              return (cast(typeof(&_vfuncGetFamilyTramp))_klass.getFamily)(fontmap, name);
            return typeof(return).init;
          }

          gid.pango1.font_family.FontFamily _dretval;
          string _name = name.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetFamily(_name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_map.FontMap.vfuncGetFamily");
          }
          auto _retval = _dretval ? cast(PangoFontFamily*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getFamily = cast(typeof(_klass.getFamily))&_vfuncGetFamilyTramp;
        break;
      }
      case "get_serial":
      {
        static extern(C) uint _vfuncGetSerialTramp(PangoFontMap* fontmap) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.font_map.FontMap)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontmap);
          if (!_obj)
          {
            auto _klass = cast(PangoFontMapClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontmap);
            if (_klass.getSerial)
              return (cast(typeof(&_vfuncGetSerialTramp))_klass.getSerial)(fontmap);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncGetSerial();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_map.FontMap.vfuncGetSerial");
          }
          return _retval;
        }

        _klass.getSerial = cast(typeof(_klass.getSerial))&_vfuncGetSerialTramp;
        break;
      }
      case "load_font":
      {
        static extern(C) PangoFont* _vfuncLoadFontTramp(PangoFontMap* fontmap, PangoContext* context, const(PangoFontDescription)* desc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.font_map.FontMap)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontmap);
          if (!_obj)
          {
            auto _klass = cast(PangoFontMapClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontmap);
            if (_klass.loadFont)
              return (cast(typeof(&_vfuncLoadFontTramp))_klass.loadFont)(fontmap, context, desc);
            return typeof(return).init;
          }

          gid.pango1.font.Font _dretval;

          try
          {
            _dretval = _obj.vfuncLoadFont(gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.context.Context)(cast(void*)context, No.Take), desc ? new gid.pango1.font_description.FontDescription(cast(void*)desc, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_map.FontMap.vfuncLoadFont");
          }
          auto _retval = _dretval ? cast(PangoFont*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.loadFont = cast(typeof(_klass.loadFont))&_vfuncLoadFontTramp;
        break;
      }
      case "load_fontset":
      {
        static extern(C) PangoFontset* _vfuncLoadFontsetTramp(PangoFontMap* fontmap, PangoContext* context, const(PangoFontDescription)* desc, PangoLanguage* language) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.font_map.FontMap)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontmap);
          if (!_obj)
          {
            auto _klass = cast(PangoFontMapClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontmap);
            if (_klass.loadFontset)
              return (cast(typeof(&_vfuncLoadFontsetTramp))_klass.loadFontset)(fontmap, context, desc, language);
            return typeof(return).init;
          }

          gid.pango1.fontset.Fontset _dretval;
          auto _language = language ? new gid.pango1.language.Language(cast(void*)language, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncLoadFontset(gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.context.Context)(cast(void*)context, No.Take), desc ? new gid.pango1.font_description.FontDescription(cast(void*)desc, No.Take) : null, _language);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.font_map.FontMap.vfuncLoadFontset");
          }
          auto _retval = _dretval ? cast(PangoFontset*)_dretval._cPtr(Yes.Dup) : null;
          if (_language)
            _language._cUnborrow;

          return _retval;
        }

        _klass.loadFontset = cast(typeof(_klass.loadFontset))&_vfuncLoadFontsetTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.pango1.font_map.FontMap]
class FontMapGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
}

/// Fluent builder for [gid.pango1.font_map.FontMap]
final class FontMapGidBuilder : FontMapGidBuilderImpl!FontMapGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FontMap build() nothrow
  {
    return new FontMap(cast(void*)createGObject(FontMap._getGType), Yes.Take);
  }
}
