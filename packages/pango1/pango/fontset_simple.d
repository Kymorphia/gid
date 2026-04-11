/// Module for [FontsetSimple] class
module pango.fontset_simple;

import gid.gid;
import gobject.gid_builder;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.fontset;
import pango.language;
import pango.types;

/**
    [pango.fontset_simple.FontsetSimple] is a implementation of the abstract
    [pango.fontset.Fontset] base class as an array of fonts.
    
    When creating a [pango.fontset_simple.FontsetSimple], you have to provide
    the array of fonts that make up the fontset.
*/
class FontsetSimple : pango.fontset.Fontset
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
    return cast(void function())pango_fontset_simple_get_type != &gidSymbolNotFound ? pango_fontset_simple_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontsetSimple self()
  {
    return this;
  }

  /**
      Get builder for [pango.fontset_simple.FontsetSimple]
      Returns: New builder object
  */
  static FontsetSimpleGidBuilder builder()
  {
    return new FontsetSimpleGidBuilder;
  }

  /**
      Creates a new [pango.fontset_simple.FontsetSimple] for the given language.
  
      Params:
        language = a [pango.language.Language] tag
      Returns: the newly allocated [pango.fontset_simple.FontsetSimple]
  */
  this(pango.language.Language language)
  {
    PangoFontsetSimple* _cretval;
    _cretval = pango_fontset_simple_new(language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds a font to the fontset.
      
      The fontset takes ownership of font.
  
      Params:
        font = a [pango.font.Font].
  */
  void append(pango.font.Font font)
  {
    pango_fontset_simple_append(cast(PangoFontsetSimple*)this._cPtr, font ? cast(PangoFont*)font._cPtr(Yes.Dup) : null);
  }

  /**
      Returns the number of fonts in the fontset.
      Returns: the size of fontset
  */
  int size()
  {
    int _retval;
    _retval = pango_fontset_simple_size(cast(PangoFontsetSimple*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [pango.fontset_simple.FontsetSimple]
class FontsetSimpleGidBuilderImpl(T) : pango.fontset.FontsetGidBuilderImpl!T
{
}

/// Fluent builder for [pango.fontset_simple.FontsetSimple]
final class FontsetSimpleGidBuilder : FontsetSimpleGidBuilderImpl!FontsetSimpleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FontsetSimple build()
  {
    return new FontsetSimple(cast(void*)createGObject(FontsetSimple._getGType), Yes.Take);
  }
}
