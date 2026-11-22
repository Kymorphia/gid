/// Module for [StyleSchemePreview] class
module gid.gtksource5.style_scheme_preview;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.style_scheme;
import gid.gtksource5.types;

/**
    A preview widget for [gid.gtksource5.style_scheme.StyleScheme].
    
    This widget provides a convenient [gid.gtk4.widget.Widget] to preview a [gid.gtksource5.style_scheme.StyleScheme].
    
    The [gid.gtksource5.style_scheme_preview.StyleSchemePreview.selected] property can be used to manage
    the selection state of a single preview widget.
*/
class StyleSchemePreview : gid.gtk4.widget.Widget, gid.gtk4.actionable.Actionable
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
    return cast(void function())gtk_source_style_scheme_preview_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_preview_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceStyleSchemePreview";
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleSchemePreview self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.style_scheme_preview.StyleSchemePreview]
      Returns: New builder object
  */
  static StyleSchemePreviewGidBuilder builder() nothrow
  {
    return new StyleSchemePreviewGidBuilder;
  }

  /** */
  @property gid.gtksource5.style_scheme.StyleScheme scheme() nothrow
  {
    return getScheme();
  }

  /** */
  @property bool selected() nothrow
  {
    return getSelected();
  }

  /** */
  @property void selected(bool propval) nothrow
  {
    setSelected(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new #GtkSourceStyleSchemePreview to preview the style scheme
      provided in scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme
      Returns: a #GtkWidget
  */
  this(gid.gtksource5.style_scheme.StyleScheme scheme) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_style_scheme_preview_new(scheme ? cast(GtkSourceStyleScheme*)scheme._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets the #GtkSourceStyleScheme previewed by the widget.
      Returns: a #GtkSourceStyleScheme
  */
  gid.gtksource5.style_scheme.StyleScheme getScheme() nothrow
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_style_scheme_preview_get_scheme(cast(GtkSourceStyleSchemePreview*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool getSelected() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_style_scheme_preview_get_selected(cast(GtkSourceStyleSchemePreview*)this._cPtr);
    return _retval;
  }

  /** */
  void setSelected(bool selected) nothrow
  {
    gtk_source_style_scheme_preview_set_selected(cast(GtkSourceStyleSchemePreview*)this._cPtr, selected);
  }

  /**
      Connect to `Activate` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource5.style_scheme_preview.StyleSchemePreview styleSchemePreview)`
  
          `styleSchemePreview` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.style_scheme_preview.StyleSchemePreview)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.style_scheme_preview.StyleSchemePreview.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.style_scheme_preview.StyleSchemePreview]
class StyleSchemePreviewGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.actionable.ActionableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();

  /** */
  T scheme(gid.gtksource5.style_scheme.StyleScheme propval) nothrow
  {
    return setProperty("scheme", propval);
  }

  /** */
  T selected(bool propval) nothrow
  {
    return setProperty("selected", propval);
  }
}

/// Fluent builder for [gid.gtksource5.style_scheme_preview.StyleSchemePreview]
final class StyleSchemePreviewGidBuilder : StyleSchemePreviewGidBuilderImpl!StyleSchemePreviewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StyleSchemePreview build() nothrow
  {
    return new StyleSchemePreview(cast(void*)createGObject(StyleSchemePreview._getGType), Yes.Take);
  }
}
