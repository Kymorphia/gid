/// Module for [Fontset] class
module pango.fontset;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.font_metrics;
import pango.types;

/**
    A [pango.fontset.Fontset] represents a set of [pango.font.Font] to use when rendering text.
    
    A [pango.fontset.Fontset] is the result of resolving a [pango.font_description.FontDescription]
    against a particular [pango.context.Context]. It has operations for finding the
    component font for a particular Unicode character, and for finding a
    composite set of metrics for the entire fontset.
*/
class Fontset : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_fontset_get_type != &gidSymbolNotFound ? pango_fontset_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Fontset self() nothrow
  {
    return this;
  }

  /**
      Get builder for [pango.fontset.Fontset]
      Returns: New builder object
  */
  static FontsetGidBuilder builder() nothrow
  {
    return new FontsetGidBuilder;
  }

  /**
      Iterates through all the fonts in a fontset, calling func for
      each one.
      
      If func returns true, that stops the iteration.
  
      Params:
        func = Callback function
  */
  void foreach_(pango.types.FontsetForeachFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(PangoFontset* fontset, PangoFont* font, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(pango.types.FontsetForeachFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(pango.fontset.Fontset)(cast(void*)fontset, No.Take), gobject.object.ObjectWrap._getDObject!(pango.font.Font)(cast(void*)font, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "pango.types.FontsetForeachFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    pango_fontset_foreach(cast(PangoFontset*)this._cPtr, _funcCB, _func);
  }

  /**
      Returns the font in the fontset that contains the best
      glyph for a Unicode character.
  
      Params:
        wc = a Unicode character
      Returns: a [pango.font.Font]
  */
  pango.font.Font getFont(uint wc) nothrow
  {
    PangoFont* _cretval;
    _cretval = pango_fontset_get_font(cast(PangoFontset*)this._cPtr, wc);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get overall metric information for the fonts in the fontset.
      Returns: a [pango.font_metrics.FontMetrics] object
  */
  pango.font_metrics.FontMetrics getMetrics() nothrow
  {
    PangoFontMetrics* _cretval;
    _cretval = pango_fontset_get_metrics(cast(PangoFontset*)this._cPtr);
    pango.font_metrics.FontMetrics _retval;
    if (_cretval)
      _retval = *cast(pango.font_metrics.FontMetrics*)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [pango.fontset.Fontset]
class FontsetGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [pango.fontset.Fontset]
final class FontsetGidBuilder : FontsetGidBuilderImpl!FontsetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Fontset build() nothrow
  {
    return new Fontset(cast(void*)createGObject(Fontset._getGType), No.Take);
  }
}
