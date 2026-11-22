/// Module for [Fontset] class
module gid.pango1.fontset;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.font;
import gid.pango1.font_metrics;
import gid.pango1.types;

/**
    A [gid.pango1.fontset.Fontset] represents a set of [gid.pango1.font.Font] to use when rendering text.
    
    A [gid.pango1.fontset.Fontset] is the result of resolving a [gid.pango1.font_description.FontDescription]
    against a particular [gid.pango1.context.Context]. It has operations for finding the
    component font for a particular Unicode character, and for finding a
    composite set of metrics for the entire fontset.
*/
class Fontset : gid.gobject2.object.ObjectWrap
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
    return cast(void function())pango_fontset_get_type != &gidSymbolNotFound ? pango_fontset_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PangoFontset";
  }

  /** Returns `this`, for use in `with` statements. */
  override Fontset self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.pango1.fontset.Fontset]
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
  void foreach_(gid.pango1.types.FontsetForeachFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(PangoFontset* fontset, PangoFont* font, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gid.pango1.types.FontsetForeachFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.fontset.Fontset)(cast(void*)fontset, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(void*)font, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.pango1.types.FontsetForeachFunc");
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
      Returns: a [gid.pango1.font.Font]
  */
  gid.pango1.font.Font getFont(uint wc) nothrow
  {
    PangoFont* _cretval;
    _cretval = pango_fontset_get_font(cast(PangoFontset*)this._cPtr, wc);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get overall metric information for the fonts in the fontset.
      Returns: a [gid.pango1.font_metrics.FontMetrics] object
  */
  gid.pango1.font_metrics.FontMetrics getMetrics() nothrow
  {
    PangoFontMetrics* _cretval;
    _cretval = pango_fontset_get_metrics(cast(PangoFontset*)this._cPtr);
    gid.pango1.font_metrics.FontMetrics _retval;
    if (_cretval)
    {
      _retval = *cast(gid.pango1.font_metrics.FontMetrics*)_cretval;
      cValueFree!(gid.pango1.font_metrics.FontMetrics)(_cretval);
    }
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.pango1.fontset.Fontset]
class FontsetGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.pango1.fontset.Fontset]
final class FontsetGidBuilder : FontsetGidBuilderImpl!FontsetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Fontset build() nothrow
  {
    return new Fontset(cast(void*)createGObject(Fontset._getGType), Yes.Take);
  }
}
