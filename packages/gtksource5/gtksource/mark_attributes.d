/// Module for [MarkAttributes] class
module gtksource.mark_attributes;

import gdk.paintable;
import gdk.rgba;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.dclosure;
import gobject.object;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.mark;
import gtksource.types;

/**
    The source mark attributes object.
    
    [gtksource.mark_attributes.MarkAttributes] is an object specifying attributes used by
    a `class@View` to visually show lines marked with `class@Mark`s
    of a specific category. It allows you to define a background color of a line,
    an icon shown in gutter and tooltips.
    
    The background color is used as a background of a line where a mark is placed
    and it can be set with [gtksource.mark_attributes.MarkAttributes.setBackground]. To check
    if any custom background color was defined and what color it is, use
    [gtksource.mark_attributes.MarkAttributes.getBackground].
    
    An icon is a graphic element which is shown in the gutter of a view. An
    example use is showing a red filled circle in a debugger to show that a
    breakpoint was set in certain line. To get an icon that will be placed in
    a gutter, first a base for it must be specified and then
    [gtksource.mark_attributes.MarkAttributes.renderIcon] must be called.
    There are several ways to specify a base for an icon:
    
    $(LIST
      * [gtksource.mark_attributes.MarkAttributes.setIconName]
      * [gtksource.mark_attributes.MarkAttributes.setGicon]
      * [gtksource.mark_attributes.MarkAttributes.setPixbuf]
    )
      
    Using any of the above functions overrides the one used earlier. But note
    that a getter counterpart of earlier used function can still return some
    value, but it is just not used when rendering the proper icon.
    
    To provide meaningful tooltips for a given mark of a category, you should
    connect to `signal@MarkAttributes::query-tooltip-text` or
    `signal@MarkAttributes::query-tooltip-markup` where the latter
    takes precedence.
*/
class MarkAttributes : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_mark_attributes_get_type != &gidSymbolNotFound ? gtk_source_mark_attributes_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MarkAttributes self()
  {
    return this;
  }

  /**
      Get `background` property.
      Returns: A color used for background of a line.
  */
  @property gdk.rgba.RGBA background()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("background");
  }

  /**
      Set `background` property.
      Params:
        propval = A color used for background of a line.
  */
  @property void background(gdk.rgba.RGBA propval)
  {
    return setBackground(propval);
  }

  /**
      Get `gicon` property.
      Returns: A #GIcon that may be a base of a rendered icon.
  */
  @property gio.icon.Icon gicon()
  {
    return getGicon();
  }

  /**
      Set `gicon` property.
      Params:
        propval = A #GIcon that may be a base of a rendered icon.
  */
  @property void gicon(gio.icon.Icon propval)
  {
    return setGicon(propval);
  }

  /**
      Get `iconName` property.
      Returns: An icon name that may be a base of a rendered icon.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = An icon name that may be a base of a rendered icon.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `pixbuf` property.
      Returns: A #GdkPixbuf that may be a base of a rendered icon.
  */
  @property gdkpixbuf.pixbuf.Pixbuf pixbuf()
  {
    return getPixbuf();
  }

  /**
      Set `pixbuf` property.
      Params:
        propval = A #GdkPixbuf that may be a base of a rendered icon.
  */
  @property void pixbuf(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    return setPixbuf(propval);
  }

  /**
      Creates a new source mark attributes.
      Returns: a new source mark attributes.
  */
  this()
  {
    GtkSourceMarkAttributes* _cretval;
    _cretval = gtk_source_mark_attributes_new();
    this(_cretval, Yes.Take);
  }

  /**
      Stores background color in background.
  
      Params:
        background = a #GdkRGBA.
      Returns: whether background color for attributes was set.
  */
  bool getBackground(out gdk.rgba.RGBA background)
  {
    bool _retval;
    _retval = cast(bool)gtk_source_mark_attributes_get_background(cast(GtkSourceMarkAttributes*)this._cPtr, cast(GdkRGBA*)&background);
    return _retval;
  }

  /**
      Gets a [gio.icon.Icon] to be used as a base for rendered icon.
      
      Note that the icon can be null if it wasn't set earlier.
      Returns: An icon. The icon belongs to attributes and should
        not be unreffed.
  */
  gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_source_mark_attributes_get_gicon(cast(GtkSourceMarkAttributes*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a name of an icon to be used as a base for rendered icon.
      
      Note that the icon name can be null if it wasn't set earlier.
      Returns: An icon name. The string belongs to attributes and
        should not be freed.
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_mark_attributes_get_icon_name(cast(GtkSourceMarkAttributes*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a [gdkpixbuf.pixbuf.Pixbuf] to be used as a base for rendered icon.
      
      Note that the pixbuf can be null if it wasn't set earlier.
      Returns: A pixbuf. The pixbuf belongs to attributes and
        should not be unreffed.
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    const(GdkPixbuf)* _cretval;
    _cretval = gtk_source_mark_attributes_get_pixbuf(cast(GtkSourceMarkAttributes*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries for a tooltip by emitting a `signalMarkAttributes::query-tooltip-markup` signal.
      
      The tooltip may contain a markup.
  
      Params:
        mark = a #GtkSourceMark.
      Returns: A tooltip. The returned string should be freed by
        using [glib.global.gfree] when done with it.
  */
  string getTooltipMarkup(gtksource.mark.Mark mark)
  {
    char* _cretval;
    _cretval = gtk_source_mark_attributes_get_tooltip_markup(cast(GtkSourceMarkAttributes*)this._cPtr, mark ? cast(GtkSourceMark*)mark._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Queries for a tooltip by emitting a `signalMarkAttributes::query-tooltip-text` signal.
      
      The tooltip is a plain text.
  
      Params:
        mark = a #GtkSourceMark.
      Returns: A tooltip. The returned string should be freed by
        using [glib.global.gfree] when done with it.
  */
  string getTooltipText(gtksource.mark.Mark mark)
  {
    char* _cretval;
    _cretval = gtk_source_mark_attributes_get_tooltip_text(cast(GtkSourceMarkAttributes*)this._cPtr, mark ? cast(GtkSourceMark*)mark._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Renders an icon of given size.
      
      The base of the icon is set by the last call to one of:
      
      $(LIST
        * [gtksource.mark_attributes.MarkAttributes.setPixbuf]
        * [gtksource.mark_attributes.MarkAttributes.setGicon]
        * [gtksource.mark_attributes.MarkAttributes.setIconName]
      )
        
      size cannot be lower than 1.
  
      Params:
        widget = widget of which style settings may be used.
        size = size of the rendered icon.
      Returns: A #GdkPaintable. The paintable belongs to attributes
        and should not be unreffed.
  */
  gdk.paintable.Paintable renderIcon(gtk.widget.Widget widget, int size)
  {
    GdkPaintable* _cretval;
    _cretval = gtk_source_mark_attributes_render_icon(cast(GtkSourceMarkAttributes*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets background color to the one given in background.
  
      Params:
        background = a #GdkRGBA.
  */
  void setBackground(gdk.rgba.RGBA background)
  {
    gtk_source_mark_attributes_set_background(cast(GtkSourceMarkAttributes*)this._cPtr, cast(const(GdkRGBA)*)&background);
  }

  /**
      Sets an icon to be used as a base for rendered icon.
  
      Params:
        gicon = a #GIcon to be used.
  */
  void setGicon(gio.icon.Icon gicon)
  {
    gtk_source_mark_attributes_set_gicon(cast(GtkSourceMarkAttributes*)this._cPtr, gicon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)gicon)._cPtr(No.Dup) : null);
  }

  /**
      Sets a name of an icon to be used as a base for rendered icon.
  
      Params:
        iconName = name of an icon to be used.
  */
  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_mark_attributes_set_icon_name(cast(GtkSourceMarkAttributes*)this._cPtr, _iconName);
  }

  /**
      Sets a pixbuf to be used as a base for rendered icon.
  
      Params:
        pixbuf = a #GdkPixbuf to be used.
  */
  void setPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    gtk_source_mark_attributes_set_pixbuf(cast(GtkSourceMarkAttributes*)this._cPtr, pixbuf ? cast(const(GdkPixbuf)*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Connect to `QueryTooltipMarkup` signal.
  
      The code should connect to this signal to provide a tooltip for given
        mark. The tooltip can contain a markup.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D string callback(gtksource.mark.Mark mark, gtksource.mark_attributes.MarkAttributes markAttributes))
  
          `mark` The #GtkSourceMark. (optional)
  
          `markAttributes` the instance the signal is connected to (optional)
  
          `Returns` A tooltip. The string should be freed with
            [glib.global.gfree] when done with it.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectQueryTooltipMarkup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == string)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.mark.Mark)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.mark_attributes.MarkAttributes)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D string callback(gtksource.mark.Mark mark, gtksource.mark_attributes.MarkAttributes markAttributes))
  
          `mark` The #GtkSourceMark. (optional)
  
          `markAttributes` the instance the signal is connected to (optional)
  
          `Returns` A tooltip. The string should be freed with
            [glib.global.gfree] when done with it.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectQueryTooltipText(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == string)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.mark.Mark)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.mark_attributes.MarkAttributes)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(string)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip-text", closure, after);
  }
}
