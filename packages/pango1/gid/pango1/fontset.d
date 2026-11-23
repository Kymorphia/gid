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
import gid.pango1.language;
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncForeach` to chain up from an override.
      Overriding it from D is not supported (parameter 'func' of kind 'Callback' is not supported).
  */
  protected void vfuncForeach(gid.pango1.types.FontsetForeachFunc func)
  {
    auto _klass = cast(PangoFontsetClass*)_vfuncClass;
    if (!_klass.foreach_)
      return;

    extern(C) gboolean _funcCallback(PangoFontset* fontset, PangoFont* font, void* userData) nothrow
    {
      gidAttachThread();
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
    _klass.foreach_(cast(PangoFontset*)this._cPtr, _funcCB, _func);
  }

  /**
      Returns the font in the fontset that contains the best
      glyph for a Unicode character.
  
      Params:
        wc = a Unicode character
      Returns: a [gid.pango1.font.Font]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetFont` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.pango1.font.Font vfuncGetFont(uint wc)
  {
    auto _klass = cast(PangoFontsetClass*)_vfuncClass;
    if (!_klass.getFont)
      return typeof(return).init;

    PangoFont* _cretval;
    _cretval = _klass.getFont(cast(PangoFontset*)this._cPtr, wc);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      a function to get the language of the fontset.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetLanguage` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.pango1.language.Language vfuncGetLanguage()
  {
    auto _klass = cast(PangoFontsetClass*)_vfuncClass;
    if (!_klass.getLanguage)
      return typeof(return).init;

    PangoLanguage* _cretval;
    _cretval = _klass.getLanguage(cast(PangoFontset*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.language.Language(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get overall metric information for the fonts in the fontset.
      Returns: a [gid.pango1.font_metrics.FontMetrics] object
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetMetrics` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.pango1.font_metrics.FontMetrics vfuncGetMetrics()
  {
    auto _klass = cast(PangoFontsetClass*)_vfuncClass;
    if (!_klass.getMetrics)
      return typeof(return).init;

    PangoFontMetrics* _cretval;
    _cretval = _klass.getMetrics(cast(PangoFontset*)this._cPtr);
    gid.pango1.font_metrics.FontMetrics _retval;
    if (_cretval)
    {
      _retval = *cast(gid.pango1.font_metrics.FontMetrics*)_cretval;
      cValueFree!(gid.pango1.font_metrics.FontMetrics)(_cretval);
    }
    return _retval;
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
      gidAttachThread();
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Fontset
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.pango1.fontset.Fontset), T.stringof ~ " is not derived from gid.pango1.fontset.Fontset");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncForeach", true)[0]) == gid.pango1.fontset.Fontset))
      static assert(0, "Overriding gid.pango1.fontset.Fontset.vfuncForeach is not supported: parameter 'func' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetFont", true)[0]) == gid.pango1.fontset.Fontset))
      _installVfunc(klass, "get_font");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetLanguage", true)[0]) == gid.pango1.fontset.Fontset))
      _installVfunc(klass, "get_language");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetMetrics", true)[0]) == gid.pango1.fontset.Fontset))
      _installVfunc(klass, "get_metrics");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(PangoFontsetClass*)klass;

    switch (vfunc)
    {
      case "get_font":
      {
        static extern(C) PangoFont* _vfuncGetFontTramp(PangoFontset* fontset, uint wc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.fontset.Fontset)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontset);
          if (!_obj)
          {
            auto _klass = cast(PangoFontsetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontset);
            if (_klass.getFont)
              return (cast(typeof(&_vfuncGetFontTramp))_klass.getFont)(fontset, wc);
            return typeof(return).init;
          }

          gid.pango1.font.Font _dretval;

          try
          {
            _dretval = _obj.vfuncGetFont(wc);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.fontset.Fontset.vfuncGetFont");
          }
          auto _retval = _dretval ? cast(PangoFont*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getFont = cast(typeof(_klass.getFont))&_vfuncGetFontTramp;
        break;
      }
      case "get_language":
      {
        static extern(C) PangoLanguage* _vfuncGetLanguageTramp(PangoFontset* fontset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.fontset.Fontset)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontset);
          if (!_obj)
          {
            auto _klass = cast(PangoFontsetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontset);
            if (_klass.getLanguage)
              return (cast(typeof(&_vfuncGetLanguageTramp))_klass.getLanguage)(fontset);
            return typeof(return).init;
          }

          gid.pango1.language.Language _dretval;

          try
          {
            _dretval = _obj.vfuncGetLanguage();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.fontset.Fontset.vfuncGetLanguage");
          }
          auto _retval = _dretval ? cast(PangoLanguage*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getLanguage = cast(typeof(_klass.getLanguage))&_vfuncGetLanguageTramp;
        break;
      }
      case "get_metrics":
      {
        static extern(C) PangoFontMetrics* _vfuncGetMetricsTramp(PangoFontset* fontset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.pango1.fontset.Fontset)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontset);
          if (!_obj)
          {
            auto _klass = cast(PangoFontsetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontset);
            if (_klass.getMetrics)
              return (cast(typeof(&_vfuncGetMetricsTramp))_klass.getMetrics)(fontset);
            return typeof(return).init;
          }

          gid.pango1.font_metrics.FontMetrics _dretval;

          try
          {
            _dretval = _obj.vfuncGetMetrics();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.pango1.fontset.Fontset.vfuncGetMetrics");
          }
          auto _retval = cast(PangoFontMetrics*)gid.pango1.font_metrics.FontMetrics._cDup(cast(void*)&_dretval);

          return _retval;
        }

        _klass.getMetrics = cast(typeof(_klass.getMetrics))&_vfuncGetMetricsTramp;
        break;
      }
      default:
      break;
    }
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
