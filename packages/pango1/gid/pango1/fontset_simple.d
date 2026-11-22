/// Module for [FontsetSimple] class
module gid.pango1.fontset_simple;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.font;
import gid.pango1.fontset;
import gid.pango1.language;
import gid.pango1.types;

/**
    [gid.pango1.fontset_simple.FontsetSimple] is a implementation of the abstract
    [gid.pango1.fontset.Fontset] base class as an array of fonts.
    
    When creating a [gid.pango1.fontset_simple.FontsetSimple], you have to provide
    the array of fonts that make up the fontset.
*/
class FontsetSimple : gid.pango1.fontset.Fontset
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
    return cast(void function())pango_fontset_simple_get_type != &gidSymbolNotFound ? pango_fontset_simple_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PangoFontsetSimple";
  }

  /** Returns `this`, for use in `with` statements. */
  override FontsetSimple self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.pango1.fontset_simple.FontsetSimple]
      Returns: New builder object
  */
  static FontsetSimpleGidBuilder builder() nothrow
  {
    return new FontsetSimpleGidBuilder;
  }

  /**
      Creates a new [gid.pango1.fontset_simple.FontsetSimple] for the given language.
  
      Params:
        language = a [gid.pango1.language.Language] tag
      Returns: the newly allocated [gid.pango1.fontset_simple.FontsetSimple]
  */
  this(gid.pango1.language.Language language) nothrow
  {
    PangoFontsetSimple* _cretval;
    _cretval = pango_fontset_simple_new(language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds a font to the fontset.
      
      The fontset takes ownership of font.
  
      Params:
        font = a [gid.pango1.font.Font].
  */
  void append(gid.pango1.font.Font font) nothrow
  {
    pango_fontset_simple_append(cast(PangoFontsetSimple*)this._cPtr, font ? cast(PangoFont*)font._cPtr(Yes.Dup) : null);
  }

  /**
      Returns the number of fonts in the fontset.
      Returns: the size of fontset
  */
  int size() nothrow
  {
    int _retval;
    _retval = pango_fontset_simple_size(cast(PangoFontsetSimple*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.pango1.fontset_simple.FontsetSimple]
class FontsetSimpleGidBuilderImpl(T) : gid.pango1.fontset.FontsetGidBuilderImpl!T
{
}

/// Fluent builder for [gid.pango1.fontset_simple.FontsetSimple]
final class FontsetSimpleGidBuilder : FontsetSimpleGidBuilderImpl!FontsetSimpleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FontsetSimple build() nothrow
  {
    return new FontsetSimple(cast(void*)createGObject(FontsetSimple._getGType), Yes.Take);
  }
}
