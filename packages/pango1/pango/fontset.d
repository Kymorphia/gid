/// Module for [Fontset] class
module pango.fontset;

import gid.gid;
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_fontset_get_type != &gidSymbolNotFound ? pango_fontset_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Fontset self()
  {
    return this;
  }

  /**
      Iterates through all the fonts in a fontset, calling func for
      each one.
      
      If func returns true, that stops the iteration.
  
      Params:
        func = Callback function
  */
  void foreach_(pango.types.FontsetForeachFunc func)
  {
    extern(C) gboolean _funcCallback(PangoFontset* fontset, PangoFont* font, void* userData)
    {
      auto _dlg = cast(pango.types.FontsetForeachFunc*)userData;

      gboolean _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(pango.fontset.Fontset)(cast(void*)fontset, No.Take), gobject.object.ObjectWrap._getDObject!(pango.font.Font)(cast(void*)font, No.Take));
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
  pango.font.Font getFont(uint wc)
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
  pango.font_metrics.FontMetrics getMetrics()
  {
    PangoFontMetrics* _cretval;
    _cretval = pango_fontset_get_metrics(cast(PangoFontset*)this._cPtr);
    auto _retval = _cretval ? new pango.font_metrics.FontMetrics(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
