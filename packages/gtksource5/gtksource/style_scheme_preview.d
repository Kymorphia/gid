/// Module for [StyleSchemePreview] class
module gtksource.style_scheme_preview;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style_scheme;
import gtksource.types;

/**
    A preview widget for `class@StyleScheme`.
    
    This widget provides a convenient [gtk.widget.Widget] to preview a `class@StyleScheme`.
    
    The `property@StyleSchemePreview:selected` property can be used to manage
    the selection state of a single preview widget.
*/
class StyleSchemePreview : gtk.widget.Widget, gtk.actionable.Actionable
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
    return cast(void function())gtk_source_style_scheme_preview_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_preview_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleSchemePreview self()
  {
    return this;
  }

  /** */
  @property bool selected()
  {
    return getSelected();
  }

  /** */
  @property void selected(bool propval)
  {
    return setSelected(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new #GtkSourceStyleSchemePreview to preview the style scheme
      provided in scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme
      Returns: a #GtkWidget
  */
  this(gtksource.style_scheme.StyleScheme scheme)
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_style_scheme_preview_new(scheme ? cast(GtkSourceStyleScheme*)scheme._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets the #GtkSourceStyleScheme previewed by the widget.
      Returns: a #GtkSourceStyleScheme
  */
  gtksource.style_scheme.StyleScheme getScheme()
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_style_scheme_preview_get_scheme(cast(GtkSourceStyleSchemePreview*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool getSelected()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_style_scheme_preview_get_selected(cast(GtkSourceStyleSchemePreview*)this._cPtr);
    return _retval;
  }

  /** */
  void setSelected(bool selected)
  {
    gtk_source_style_scheme_preview_set_selected(cast(GtkSourceStyleSchemePreview*)this._cPtr, selected);
  }

  /**
      Connect to `Activate` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.style_scheme_preview.StyleSchemePreview styleSchemePreview))
  
          `styleSchemePreview` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.style_scheme_preview.StyleSchemePreview)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
