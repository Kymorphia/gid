/// Module for [FontMap] class
module pango.font_map;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import pango.c.functions;
import pango.c.types;
import pango.context;
import pango.font;
import pango.font_description;
import pango.font_family;
import pango.fontset;
import pango.language;
import pango.types;

/**
    A [pango.font_map.FontMap] represents the set of fonts available for a
    particular rendering system.
    
    This is a virtual object with implementations being specific to
    particular rendering systems.
*/
class FontMap : gobject.object.ObjectWrap, gio.list_model.ListModel
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
    return cast(void function())pango_font_map_get_type != &gidSymbolNotFound ? pango_font_map_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontMap self()
  {
    return this;
  }

  /**
  Get builder for [pango.font_map.FontMap]
  Returns: New builder object
  */
  static FontMapGidBuilder builder()
  {
    return new FontMapGidBuilder;
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

  mixin ListModelT!();

  /**
      Forces a change in the context, which will cause any [pango.context.Context]
      using this fontmap to change.
      
      This function is only useful when implementing a new backend
      for Pango, something applications won't do. Backends should
      call this function if they have attached extra data to the
      context and such data is changed.
  */
  void changed()
  {
    pango_font_map_changed(cast(PangoFontMap*)this._cPtr);
  }

  /**
      Creates a [pango.context.Context] connected to fontmap.
      
      This is equivalent to [pango.context.Context.new_] followed by
      [pango.context.Context.setFontMap].
      
      If you are using Pango as part of a higher-level system,
      that system may have it's own way of create a [pango.context.Context].
      For instance, the GTK toolkit has, among others,
      [gtk.widget.Widget.getPangoContext]. Use those instead.
      Returns: the newly allocated [pango.context.Context],
          which should be freed with [gobject.object.ObjectWrap.unref].
  */
  pango.context.Context createContext()
  {
    PangoContext* _cretval;
    _cretval = pango_font_map_create_context(cast(PangoFontMap*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a font family by name.
  
      Params:
        name = a family name
      Returns: the [pango.font_family.FontFamily]
  */
  pango.font_family.FontFamily getFamily(string name)
  {
    PangoFontFamily* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = pango_font_map_get_family(cast(PangoFontMap*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
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
      
      This can be used to automatically detect changes to a [pango.font_map.FontMap],
      like in [pango.context.Context].
      Returns: The current serial number of fontmap.
  */
  uint getSerial()
  {
    uint _retval;
    _retval = pango_font_map_get_serial(cast(PangoFontMap*)this._cPtr);
    return _retval;
  }

  /**
      List all families for a fontmap.
      
      Note that the returned families are not in any particular order.
      
      [pango.font_map.FontMap] also implemented the [gio.list_model.ListModel] interface
      for enumerating families.
  
      Params:
        families = location to
            store a pointer to an array of [pango.font_family.FontFamily] *.
            This array should be freed with [glib.global.gfree].
  */
  void listFamilies(out pango.font_family.FontFamily[] families)
  {
    int _nFamilies;
    PangoFontFamily** _families;
    pango_font_map_list_families(cast(PangoFontMap*)this._cPtr, &_families, &_nFamilies);
    families.length = _nFamilies;
    foreach (i; 0 .. _nFamilies)
      families[i] = gobject.object.ObjectWrap._getDObject!(pango.font_family.FontFamily)(_families[i], No.Take);
    gFree(cast(void*)_families);
  }

  /**
      Load the font in the fontmap that is the closest match for desc.
  
      Params:
        context = the [pango.context.Context] the font will be used with
        desc = a [pango.font_description.FontDescription] describing the font to load
      Returns: the newly allocated [pango.font.Font]
          loaded, or null if no font matched.
  */
  pango.font.Font loadFont(pango.context.Context context, pango.font_description.FontDescription desc)
  {
    PangoFont* _cretval;
    _cretval = pango_font_map_load_font(cast(PangoFontMap*)this._cPtr, context ? cast(PangoContext*)context._cPtr(No.Dup) : null, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Load a set of fonts in the fontmap that can be used to render
      a font matching desc.
  
      Params:
        context = the [pango.context.Context] the font will be used with
        desc = a [pango.font_description.FontDescription] describing the font to load
        language = a [pango.language.Language] the fonts will be used for
      Returns: the newly allocated
          [pango.fontset.Fontset] loaded, or null if no font matched.
  */
  pango.fontset.Fontset loadFontset(pango.context.Context context, pango.font_description.FontDescription desc, pango.language.Language language)
  {
    PangoFontset* _cretval;
    _cretval = pango_font_map_load_fontset(cast(PangoFontMap*)this._cPtr, context ? cast(PangoContext*)context._cPtr(No.Dup) : null, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.fontset.Fontset)(cast(PangoFontset*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns a new font that is like font, except that its size
      is multiplied by scale, its backend-dependent configuration
      (e.g. cairo font options) is replaced by the one in context,
      and its variations are replaced by variations.
  
      Params:
        font = a font in fontmap
        scale = the scale factor to apply
        context = a [pango.context.Context]
        variations = font variations to use
      Returns: the modified font
  */
  pango.font.Font reloadFont(pango.font.Font font, double scale, pango.context.Context context = null, string variations = null)
  {
    PangoFont* _cretval;
    const(char)* _variations = variations.toCString(No.Alloc);
    _cretval = pango_font_map_reload_font(cast(PangoFontMap*)this._cPtr, font ? cast(PangoFont*)font._cPtr(No.Dup) : null, scale, context ? cast(PangoContext*)context._cPtr(No.Dup) : null, _variations);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }
}

class FontMapGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.list_model.ListModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
}

/// Fluent builder for [pango.font_map.FontMap]
final class FontMapGidBuilder : FontMapGidBuilderImpl!FontMapGidBuilder
{
  FontMap build()
  {
    return new FontMap(cast(void*)createGObject(FontMap._getGType), No.Take);
  }
}
