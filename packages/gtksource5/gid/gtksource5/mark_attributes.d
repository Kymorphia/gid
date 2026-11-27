/// Module for [MarkAttributes] class
module gid.gtksource5.mark_attributes;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.paintable;
import gid.gdk4.rgba;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.icon;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.widget;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.mark;
import gid.gtksource5.types;

/**
    The source mark attributes object.
    
    [gid.gtksource5.mark_attributes.MarkAttributes] is an object specifying attributes used by
    a [gid.gtksource5.view.View] to visually show lines marked with [gid.gtksource5.mark.Mark]s
    of a specific category. It allows you to define a background color of a line,
    an icon shown in gutter and tooltips.
    
    The background color is used as a background of a line where a mark is placed
    and it can be set with [gid.gtksource5.mark_attributes.MarkAttributes.setBackground]. To check
    if any custom background color was defined and what color it is, use
    [gid.gtksource5.mark_attributes.MarkAttributes.getBackground].
    
    An icon is a graphic element which is shown in the gutter of a view. An
    example use is showing a red filled circle in a debugger to show that a
    breakpoint was set in certain line. To get an icon that will be placed in
    a gutter, first a base for it must be specified and then
    [gid.gtksource5.mark_attributes.MarkAttributes.renderIcon] must be called.
    There are several ways to specify a base for an icon:
    
    - [gid.gtksource5.mark_attributes.MarkAttributes.setIconName]
    - [gid.gtksource5.mark_attributes.MarkAttributes.setGicon]
    - [gid.gtksource5.mark_attributes.MarkAttributes.setPixbuf]
    
    Using any of the above functions overrides the one used earlier. But note
    that a getter counterpart of earlier used function can still return some
    value, but it is just not used when rendering the proper icon.
    
    To provide meaningful tooltips for a given mark of a category, you should
    connect to [gid.gtksource5.mark_attributes.MarkAttributes.queryTooltipText] or
    [gid.gtksource5.mark_attributes.MarkAttributes.queryTooltipMarkup] where the latter
    takes precedence.
*/
@gidGir("MarkAttributes", "MarkAttributesClass")
class MarkAttributes : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_source_mark_attributes_get_type != &gidSymbolNotFound ? gtk_source_mark_attributes_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceMarkAttributes";
  }

  /** Returns `this`, for use in `with` statements. */
  override MarkAttributes self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.mark_attributes.MarkAttributes]
      Returns: New builder object
  */
  static MarkAttributesGidBuilder builder() nothrow
  {
    return new MarkAttributesGidBuilder;
  }

  /**
      Get `background` property.
      Returns: A color used for background of a line.
  */
  @property gid.gdk4.rgba.RGBA background() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk4.rgba.RGBA)("background");
  }

  /**
      Set `background` property.
      Params:
        propval = A color used for background of a line.
  */
  @property void background(gid.gdk4.rgba.RGBA propval) nothrow
  {
    setBackground(propval);
  }

  /**
      Get `gicon` property.
      Returns: A #GIcon that may be a base of a rendered icon.
  */
  @property gid.gio2.icon.Icon gicon() nothrow
  {
    return getGicon();
  }

  /**
      Set `gicon` property.
      Params:
        propval = A #GIcon that may be a base of a rendered icon.
  */
  @property void gicon(gid.gio2.icon.Icon propval) nothrow
  {
    setGicon(propval);
  }

  /**
      Get `iconName` property.
      Returns: An icon name that may be a base of a rendered icon.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = An icon name that may be a base of a rendered icon.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `pixbuf` property.
      Returns: A #GdkPixbuf that may be a base of a rendered icon.
  */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf() nothrow
  {
    return getPixbuf();
  }

  /**
      Set `pixbuf` property.
      Params:
        propval = A #GdkPixbuf that may be a base of a rendered icon.
  */
  @property void pixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    setPixbuf(propval);
  }

  /**
      Creates a new source mark attributes.
      Returns: a new source mark attributes.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkSourceMarkAttributes* _cretval;
      _cretval = gtk_source_mark_attributes_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Stores background color in background.
  
      Params:
        background = a #GdkRGBA.
      Returns: whether background color for attributes was set.
  */
  bool getBackground(out gid.gdk4.rgba.RGBA background) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_mark_attributes_get_background(cast(GtkSourceMarkAttributes*)this._cPtr, cast(GdkRGBA*)&background);
    return _retval;
  }

  /**
      Gets a [gid.gio2.icon.Icon] to be used as a base for rendered icon.
      
      Note that the icon can be null if it wasn't set earlier.
      Returns: An icon. The icon belongs to attributes and should
        not be unreffed.
  */
  gid.gio2.icon.Icon getGicon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_source_mark_attributes_get_gicon(cast(GtkSourceMarkAttributes*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a name of an icon to be used as a base for rendered icon.
      
      Note that the icon name can be null if it wasn't set earlier.
      Returns: An icon name. The string belongs to attributes and
        should not be freed.
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_mark_attributes_get_icon_name(cast(GtkSourceMarkAttributes*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a [gid.gdkpixbuf2.pixbuf.Pixbuf] to be used as a base for rendered icon.
      
      Note that the pixbuf can be null if it wasn't set earlier.
      Returns: A pixbuf. The pixbuf belongs to attributes and
        should not be unreffed.
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getPixbuf() nothrow
  {
    const(GdkPixbuf)* _cretval;
    _cretval = gtk_source_mark_attributes_get_pixbuf(cast(GtkSourceMarkAttributes*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries for a tooltip by emitting a [gid.gtksource5.mark_attributes.MarkAttributes.queryTooltipMarkup] signal.
      
      The tooltip may contain a markup.
  
      Params:
        mark = a #GtkSourceMark.
      Returns: A tooltip. The returned string should be freed by
        using [gid.glib2.global.gfree] when done with it.
  */
  string getTooltipMarkup(gid.gtksource5.mark.Mark mark) nothrow
  {
    char* _cretval;
    _cretval = gtk_source_mark_attributes_get_tooltip_markup(cast(GtkSourceMarkAttributes*)this._cPtr, mark ? cast(GtkSourceMark*)mark._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Queries for a tooltip by emitting a [gid.gtksource5.mark_attributes.MarkAttributes.queryTooltipText] signal.
      
      The tooltip is a plain text.
  
      Params:
        mark = a #GtkSourceMark.
      Returns: A tooltip. The returned string should be freed by
        using [gid.glib2.global.gfree] when done with it.
  */
  string getTooltipText(gid.gtksource5.mark.Mark mark) nothrow
  {
    char* _cretval;
    _cretval = gtk_source_mark_attributes_get_tooltip_text(cast(GtkSourceMarkAttributes*)this._cPtr, mark ? cast(GtkSourceMark*)mark._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Renders an icon of given size.
      
      The base of the icon is set by the last call to one of:
      
      - [gid.gtksource5.mark_attributes.MarkAttributes.setPixbuf]
      - [gid.gtksource5.mark_attributes.MarkAttributes.setGicon]
      - [gid.gtksource5.mark_attributes.MarkAttributes.setIconName]
      
      size cannot be lower than 1.
  
      Params:
        widget = widget of which style settings may be used.
        size = size of the rendered icon.
      Returns: A #GdkPaintable. The paintable belongs to attributes
        and should not be unreffed.
  */
  gid.gdk4.paintable.Paintable renderIcon(gid.gtk4.widget.Widget widget, int size) nothrow
  {
    GdkPaintable* _cretval;
    _cretval = gtk_source_mark_attributes_render_icon(cast(GtkSourceMarkAttributes*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, size);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets background color to the one given in background.
  
      Params:
        background = a #GdkRGBA.
  */
  void setBackground(gid.gdk4.rgba.RGBA background) nothrow
  {
    gtk_source_mark_attributes_set_background(cast(GtkSourceMarkAttributes*)this._cPtr, cast(const(GdkRGBA)*)&background);
  }

  /**
      Sets an icon to be used as a base for rendered icon.
  
      Params:
        gicon = a #GIcon to be used.
  */
  void setGicon(gid.gio2.icon.Icon gicon) nothrow
  {
    gtk_source_mark_attributes_set_gicon(cast(GtkSourceMarkAttributes*)this._cPtr, gicon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)gicon)._cPtr(No.Dup) : null);
  }

  /**
      Sets a name of an icon to be used as a base for rendered icon.
  
      Params:
        iconName = name of an icon to be used.
  */
  void setIconName(string iconName) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, No.Nullable);
    gtk_source_mark_attributes_set_icon_name(cast(GtkSourceMarkAttributes*)this._cPtr, _iconName);
  }

  /**
      Sets a pixbuf to be used as a base for rendered icon.
  
      Params:
        pixbuf = a #GdkPixbuf to be used.
  */
  void setPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf) nothrow
  {
    gtk_source_mark_attributes_set_pixbuf(cast(GtkSourceMarkAttributes*)this._cPtr, pixbuf ? cast(const(GdkPixbuf)*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Connect to `QueryTooltipMarkup` signal.
  
      The code should connect to this signal to provide a tooltip for given
        mark. The tooltip can contain a markup.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `string callback(gid.gtksource5.mark.Mark mark, gid.gtksource5.mark_attributes.MarkAttributes markAttributes)`
  
          `mark` The #GtkSourceMark. (optional)
  
          `markAttributes` the instance the signal is connected to (optional)
  
          `Returns` A tooltip. The string should be freed with
            [gid.glib2.global.gfree] when done with it.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryTooltipMarkup(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == string)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.mark.Mark)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtksource5.mark_attributes.MarkAttributes)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      string _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.mark_attributes.MarkAttributes.queryTooltipMarkup");
      }

      setVal!(string)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip-markup", closure, after);
  }

  /**
      Connect to `QueryTooltipText` signal.
  
      The code should connect to this signal to provide a tooltip for given
        mark. The tooltip should be just a plain text.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `string callback(gid.gtksource5.mark.Mark mark, gid.gtksource5.mark_attributes.MarkAttributes markAttributes)`
  
          `mark` The #GtkSourceMark. (optional)
  
          `markAttributes` the instance the signal is connected to (optional)
  
          `Returns` A tooltip. The string should be freed with
            [gid.glib2.global.gfree] when done with it.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryTooltipText(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == string)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.mark.Mark)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtksource5.mark_attributes.MarkAttributes)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      string _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.mark_attributes.MarkAttributes.queryTooltipText");
      }

      setVal!(string)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip-text", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.mark_attributes.MarkAttributes]
class MarkAttributesGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `background` property.
      Params:
        propval = A color used for background of a line.
      Returns: Builder instance for fluent chaining
  */
  T background(gid.gdk4.rgba.RGBA propval) nothrow
  {
    return setProperty("background", propval);
  }

  /**
      Set `gicon` property.
      Params:
        propval = A #GIcon that may be a base of a rendered icon.
      Returns: Builder instance for fluent chaining
  */
  T gicon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("gicon", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = An icon name that may be a base of a rendered icon.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `pixbuf` property.
      Params:
        propval = A #GdkPixbuf that may be a base of a rendered icon.
      Returns: Builder instance for fluent chaining
  */
  T pixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf", propval);
  }
}

/// Fluent builder for [gid.gtksource5.mark_attributes.MarkAttributes]
final class MarkAttributesGidBuilder : MarkAttributesGidBuilderImpl!MarkAttributesGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MarkAttributes build() nothrow
  {
    return new MarkAttributes(cast(void*)createGObject(MarkAttributes._getGType), Yes.Take);
  }
}
